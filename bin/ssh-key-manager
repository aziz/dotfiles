#!/bin/sh

# (c) 2009 Stan. S. Krupoderov
# Feel free to use it under GPLv3

# TODO: see other TODO entries

usage() {
    app=`basename $0`
    cat <<USAGE_
NAME:
    $app is as ssh key management tool

USAGE:
    $app [options] <action> <action parameters> <hostlist>

EXAMPLES:
    $app [options] [-h|--help]
    $app [options] install <new_key> <hostlist>
    $app [options] install_only <new_key> <hostlist>
    $app [options] remove <old_key> <hostlist>
    $app [options] replace <old_key> <new_key> <hostlist>

OPTIONS:
    -c|--create_new_key      - create new passwordless key and install it
    -u|--user        - install for user (by default is current user)
    -r|--root        - act on remote machine as root (you would has key
                              for root on machines from list)
    -s|--sudo        - use sudo for add key (you should has key and
                              passwordless sudo on machines)
    -U|--act_user      - use with -s options if sudo action user other then current

NOTES:
     - 'install_only' action install your key and remove all other keys
     - 'replace' action install your new key, and remove old key passed
     as file name <old_key>
USAGE_
}

error () {
    >&2
    test ! -z "$1" && echo "E: Bad parameters"
    usage
    exit 1
}

create_key() {
    # create new key
    if [ -e $key -a -e `basename $key .pub` ]
    then
  echo "!!! Key already exists, use it. If you need new key, please remove old"
    else
  echo "!!! Passwordless keys is insecure. Just use ssh-keygen and generate normal key with password!"
  echo "NOW, generated passwordless key..."
  # because of RHEL4 don't have option to generate rsa keys for SSHv2
  ssh-keygen -t dsa -N "" -q -f `basename $key .pub`
    fi
}

install_key() {
    key=$1
    host=$2
    key_content=`cat $key`
    test \! -z "$user" && conn="$user@$host" || conn="$host"

    # check public key
    if [ -z "`echo $key | awk '/.pub$/'`" ]
    then
  error "E: that is not public key file, if you sure it is, rename it to filename.pub"
    else
        test "$create_new_key" != "YES" -a ! -r "$key" && \
      error "E: key file $key can't be readed"
  GET_ID="cat ${key}"
    fi
    if [ "$create_new_key" = "YES" ]
    then
        create_key
    fi

    if [ "$install_only_key" != "yes" ]
    then
  echo install_key $1 $2
        # TODO: chown authorized_keys after creation
  install_command="umask 077; mkdir -p .ssh; chmod 700 .ssh ; cat >> .ssh/authorized_keys;"
    else
  echo install_only_key $1 $2
  install_command="umask 077; mkdir -p .ssh; rm .ssh/authorized_keys; cat > .ssh/authorized_keys"
    fi

    ###
    # processing act_as_root and use_sudo
    ###
    if [ "$act_as_root" = "YES" ]
    then
        install_command="su -l -c \"$install_command\" $user"
        conn="root@$host"
    else
        if [ "$use_sudo" = "YES" ]
        then
            test \! -z "$act_user" && conn="$act_user@$host" || conn="$host"
            install_command="sudo su -l -c \"$install_command\" $user"
        fi
    fi

    # install key
    { eval "$GET_ID" ; } | ssh $conn "$install_command" || exit 1
}

remove_key() {
    echo remove_key $1
    key=$1
    host=$2
    key_content=`cat $key| cut -c 1-75`
    test \! -z "$user" && conn="$user@$host" || conn="$host"
    echo "do-remove"
    ssh $conn <<EOF
    umask 077; test -d .ssh || mkdir .ssh ; cd .ssh;
    test -f authorized_keys && \
    echo -n "keys to be deleted: "; awk '/$key_content/' authorized_keys | wc -l;
    sed -i '/$key_content/d' authorized_keys;
    echo -n "keys available: "; cat authorized_keys | wc -l;
EOF
}

replace_key() {
    oldkey=$1
    new_key=$2
    host=$3
    test \! -z "$user" && conn="$user@$host" || conn="$host"
    install_key $new_key $host
    remove_key $old_key $host
}

manage_key() {
    echo manage_key here
}

# set -x
# getopt on the knee
while true ; do
    case "$1" in
        -h|--help)
            shift
            usage
      exit
            ;;
  -u|--user)
      # do for user
      if [ "x$2" != "x" ]
      then
    export user="$2"
      fi
      shift
      shift
      ;;
  -c|--create-new-key)
      # create new random passwordless key
      export create_new_key="YES"
      shift
      ;;
  -r|--root)
      export act_as_root="YES"
      shift
      ;;
  -s|--sudo)
      export use_sudo="YES"
      shift
      ;;
  -U|--act-user)
      if [ "x$2" != "x" ]
      then
    export act_user=$2
      fi
      shift
      shift
      ;;
   *)
      if [ -z "$1" ]
      then
          # all gotten, so go out!
    break
      else
    # unknown paramenters, may be it's actions and hostnames?
    break
      fi
      ;;
    esac
done


# main action
case "$1" in
    remove)
  # remove some [old] key
  shift
  if [ "x$1" != "x" ]
  then
      export old_key=$1
      export action="remove_key $old_key"
  else
      error "E: Bad parameters"
  fi
  shift
  ;;
    install)
  # install new key like it do ssh-copy-id
  shift
  if [ "x$1" != "x" ]
  then
      export new_key=$1
      export action="install_key $new_key"
  else
      error "E: Bad parameters"
  fi
  shift
  ;;
    install_only)
  # install new key like it do ssh-copy-id
  shift
  if [ "x$1" != "x" ]
  then
      export new_key=$1
      export install_only_key="yes"
      export action="install_key $new_key"
  else
      error "E: Bad parameters"
  fi
  shift
  ;;
    replace)
  # install new key and remove old key
  shift
  if [ "x$1" != "x" -a "x$2" != "x" ]
  then
      export old_key=$1
      export new_key=$2
      export action="replace_key $old_key $new_key"
  else
      error "E: Bad parameters"
  fi
  shift
  shift
  ;;
    *)
  usage
  exit 1
  ;;
esac

# process hostlist
for host in $* ; do
    $action $host
done