#!/usr/bin/env bash
## bash or zsh functions to autenticate and assume roles in aws federated accounts
# required tools on $PATH - aws, date, curl, jq
#
# requried environment variables:
# AWS_CLI=`which aws`
#
# optional environment variable, to automatically assume a specific role when calling assume()
#AWS_ASSUME_ROLE=arn:aws:iam::369407384105:role/cross-account-federated-role

if [ -z "$AWS_CLI" ]; then
    AWS_CLI=$( type -P aws )
fi

aws_saml() {
  credentials
  $AWS_CLI $@
}

credentials() {
  check_expired
  if [ -z $EXPIRE ]; then
    echo "new credentials required"
    authenticate
  fi
}

remain() {
  local now=$( date -u +%s )
  local remain=$(( EXPIRE - now ))
  if [ $remain -gt 0 ]; then
    echo $remain
  fi
}

check_expired() {
  local now=$( date -u +%s )
  local remain=$(( EXPIRE - now ))
  if [ -n "$EXPIRETIME" ] && [ $remain -lt 0 ]; then
    echo "aws session has expired, unsetting creds and expire"
    aws_logout
    return 1
  else
    if [ -n "$AWS_DEBUG" ]; then
        echo "$remain seconds remain for credential expiration"
    fi
  fi
}

authenticate() {
  while true;
  do
    case "$1" in
      -u | --user)
        IDP_USER=$2
        shift 2
        ;;
      -r | --role)
        local selected_role=$2
        shift 2
        ;;
      -h | --idp-host)
        IDP_HOST=$2
        shift 2
        ;;
      --)
        shift
        break
        ;;
      *)
        break
        ;;
    esac
  done

  if [ -n "$ZSH_VERSION" ]; then
    setopt BASH_REMATCH
    setopt KSH_ARRAYS
    unsetopt BRACE_CCL
  fi

  if [ -z "$AWS_CLI" ]; then
    echo "You must set \$AWS_CLI first"
    return 1
  fi

  if ! saml_auth $IDP_USER; then
    echo "Cannot authenticate"
    return 1
  fi

  local principal=""
  local role=""
  local assertion=""
  local saml_auth_result=""

  extract_asserted_roles  $( echo -e "$SAML_RESPONSE" )

  if [  -z "${AWS_DEFAULT_ROLE}" -a -z "${selected_role}" ]; then
    select_saml_role
    read saml_auth_role
  else
    # Use default role if no role was specified using '-r'
    if [  -z "${selected_role}" ]; then
      local selected_role=$AWS_DEFAULT_ROLE
    fi

    for ((i=0; i < ${#AWS_ROLES[@]}; i++)); do
      if [[ ${AWS_ROLES[$i]} =~ ([0-9]+).role\/(.*) ]] && [ ${selected_role} = ${BASH_REMATCH[2]} ]; then
        saml_auth_role=$i
        echo "assuming $selected_role($i)"
      fi
    done
  fi

  if [[ ${AWS_ROLES[$saml_auth_role]} =~ (arn.[^,]*),(arn.*[^\[]) ]]; then
    principal=${BASH_REMATCH[1]}
    role=${BASH_REMATCH[2]}
  else
    echo "Roles did not match expected pattern"
    return 1
  fi

  echo "authenticating for account $principal and role $role"
  if [ -n "$SAML_RESPONSE" ]; then
    assertion=$( echo -e "$SAML_RESPONSE" | base64 )
    export AWS_ACCESS_KEY_ID="FAKE"
    export AWS_SECRET_ACCESS_KEY="FAKE"
    export AWS_DEFAULT_REGION="ap-southeast-2"
    saml_auth_result=$( $AWS_CLI sts assume-role-with-saml \
      --role-arn $role \
      --principal-arn $principal \
      --duration-seconds 3600 \
      --saml-assertion "$assertion" \
      --output json)
    if [ $? = 0 ]; then
      extract_creds $( echo "$saml_auth_result" )
    else
        echo "Error assuming role"
        return 1
    fi
  else
    echo "No SAML response received"
    return 1
  fi

  if [ -n "$ZSH_VERSION" ]; then
    unsetopt BASH_REMATCH
    unsetopt KSH_ARRAYS
  fi
}

saml_auth() {
  if ! type curl >/dev/null 2>&1; then
    echo "You must have either curl installed, and in your \$PATH"
    return 1
  fi

  if ! type uuidgen >/dev/null 2>&1; then
    echo "You must have uuidgen installed ..."
    return 1
  fi

  echo "logging in to saml provider to obtain saml assertion."
  local default_user=$USER
  local username=""
  local userid=""
  if [ -n "$1" ]; then
    userid=$1
    echo "Username: $userid"
  else
    echo -n "Username [$default_user]: "
    read username
    if [ -z $username ]; then
      userid=$default_user
    else
      userid=$username
    fi
  fi

  # password = the user's password
  if [ -n "$ZSH_VERSION" ]; then
    read -s "userpw?Password: "
  else
    read -s -p "Password: " userpw
  fi
  echo ""

  # idphost = your idp hostname
  local default_idphost="idp.realestate.com.au"

  if [ -n "$IDP_HOST" ]; then
    default_idphost=$IDP_HOST
    echo "IDP_HOST: $IDP_HOST"
  else
    echo -n "idp host [$default_idphost]: "
    read host
  fi

  if [ -z $host ]; then
    idphost=$default_idphost
  else
    idphost=$host
  fi

  # idpid = your idp entity id
  local idpid="https://$idphost/idp/shibboleth"


  # make a quick check curl to the idp endpoint to ensure the cert is trusted.
  ssl_ok=$(curl -s ${idpid} > /dev/null; echo $?)
  if [ $ssl_ok != 0 ]; then
    echo "SSL certificate for ${idpid} is not valid, not proceeding."
    return $ssl_ok
  fi

  # rpid = a valid SP entityId that is configured for ECP
  local rpid="urn:amazon:webservices"

  # acsurl,ascurlbinding = an AssertionConsumerService URL and binding
  # this will match the values in the 'relying party' and associated metadata
  local acsurl="https://signin.aws.amazon.com/saml"
  local acsurlbinding="urn:oasis:names:tc:SAML:2.0:bindings:HTTP-POST"

  # create a soap request
  local now=$( date -u +%Y-%m-%dT%H:%M:%S )
  local id="_$( uuidgen | tr -d '-' )"
  local envelope='<S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/" xmlns:samlp="urn:oasis:names:tc:SAML:2.0:protocol"><S:Body><samlp:AuthnRequest xmlns:samlp="urn:oasis:names:tc:SAML:2.0:protocol" AssertionConsumerServiceURL="'${acsurl}'" ID="'${id}'" IssueInstant="'${now}'" ProtocolBinding="'${acsurlbinding}'" Version="2.0"><saml:Issuer xmlns:saml="urn:oasis:names:tc:SAML:2.0:assertion">'${rpid}'</saml:Issuer><samlp:NameIDPolicy AllowCreate="1"/><samlp:Scoping><samlp:IDPList><samlp:IDPEntry ProviderID="'${idpid}'"/></samlp:IDPList></samlp:Scoping></samlp:AuthnRequest></S:Body></S:Envelope>'

  # make the request
  local URL="https://${idphost}/idp/profile/SAML2/SOAP/ECP"

  # Need to base64-encode username and password to cope with special chars
  local auth_str=$( echo -n "${userid}:${userpw}" | base64 )
  unset userpw
  local resp=$( curl -H "Authorization: Basic $auth_str" --write-out %{http_code} --output /tmp/idp-response.xml -s -d  "$envelope" "$URL" )

  if [ $resp -eq 200 ]; then
     echo "SAML login request successful!"
     [[ "$( cat -t /tmp/idp-response.xml )" =~ soap11:Body\>(.*)\<\/soap11:Body ]] && export SAML_RESPONSE="$( echo -e "${BASH_REMATCH[1]}" )"
     rm /tmp/idp-response.xml
     return 0
  else
    echo "SAML login request failed, http response code $resp"
    unset SAML_RESPONSE
    return $resp
  fi
}

assume() {
  credentials
  local role=""
  local session_name=""
  local assume_result=""
  if [ -z $1 ]; then
    role=$AWS_ASSUME_ROLE
  else
    role=$1
  fi
  session_name=$USER
  [[ "$role" =~ ([0-9]+).role\/(.*) ]] && session_name=$session_name-${BASH_REMATCH[2]}
  assume_result=$( $AWS_CLI sts assume-role \
    --role-arn $role \
    --role-session-name ${session_name:0:32} \
    --output json
  )
  if [ $?  = 0 ]; then
    extract_creds $assume_result
  else
    echo "Could not assume role; awscli failed"
    return 1
  fi
}

extract_creds() {
    local IN=""
    local CREDS=""
    if [ -n "$ZSH_VERSION" ]; then
      local IN=${(j: :)@}
      local CREDS=${(j: :)$( echo "$IN" | jq '.Credentials' )}
    else
      local IN=$@
      local CREDS=$( echo "$IN" | jq '.Credentials' )
    fi
    local ROLE_ARN=$( echo "$IN" | jq -r '.AssumedRoleUser.Arn' )
    if [ -z "$CREDS" ]; then
        echo "No creds provided -- could not extract"
        return 1
    fi

    export AWS_ACCESS_KEY_ID=$( echo $CREDS | jq -r '.AccessKeyId' )
    export AWS_SECRET_ACCESS_KEY=$( echo $CREDS | jq -r '.SecretAccessKey' )
    export AWS_SECURITY_TOKEN=$( echo $CREDS | jq -r '.SessionToken' )
    export AWS_SESSION_TOKEN=$AWS_SECURITY_TOKEN
    export EXPIRETIME=$( echo $CREDS | jq -r '.Expiration' )
    if [[ "$ROLE_ARN" =~ ([0-9]+).*.role\/(.*)\/(.*) ]]; then
        export AWS_ROLE_SESSION_NAME="${BASH_REMATCH[2]}/${BASH_REMATCH[3]}"
        export AWS_ROLE=${BASH_REMATCH[2]}
        export AWS_ACCOUNT=${BASH_REMATCH[1]}
    else
        echo "Can't match role ARN from returned credentials"
        return 1
    fi
    local DATEPROG=$( date_prog )
    case $DATEPROG in
        GNU)  date_cmd="date --date "$EXPIRETIME" +%s" ;;
        BSD) date_cmd="date -ujf '%Y-%m-%dT%H:%M:%SZ' '$EXPIRETIME' +%s" ;;
        *) echo "Don't know how to handle OS type $UNAME"; return 1 ;;
    esac

    export EXPIRE=`eval $date_cmd`

    echo "temporary credentials for aws valid until $EXPIRETIME or until this session ends"
}

date_prog() {
  if date --version >/dev/null 2>&1 ; then
    echo GNU
  else
    echo BSD
  fi
}

extract_asserted_roles() {
  AWS_ROLES=( $(
    while [ "$1" ]; do
      if [[ "$1" =~ (arn:aws[^\<]*) ]]; then
          echo ${BASH_REMATCH[1]}
      fi
      shift
    done | sort -t/ -f -k 3))
  export AWS_ROLES
}

select_saml_role() {
  for ((i=0; i < ${#AWS_ROLES[@]}; i++)); do
    if [[ ${AWS_ROLES[$i]} =~ ([0-9]+).role\/(.*) ]]; then
        echo -e "$i" "${BASH_REMATCH[2]}"
    else
        echo "Can't match this role to a regex"
    fi
  done
  echo -n "enter the number of the role you want to authenticate with: "
}

session() {
  check_expired

  if [ -n "$EXPIRE" ]; then
    echo -e "current aws session expires $EXPIRETIME, for account $AWS_ACCOUNT and role $AWS_ROLE"
fi
}

aws_logout() {
   unset AWS_SECRET_ACCESS_KEY
   unset AWS_ACCESS_KEY_ID
   unset AWS_ACCOUNT
   unset AWS_SECURITY_TOKEN AWS_SESSION_TOKEN
   unset AWS_ROLES AWS_ROLE AWS_ROLE_SESSION_NAME
}
