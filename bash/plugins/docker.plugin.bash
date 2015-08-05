#!/usr/bin/env bash

if [ "$(uname)" = "Darwin" ]; then

  export DOCKER_HOST=tcp://192.168.59.103:2376
  export DOCKER_CERT_PATH=$HOME/.boot2docker/certs/boot2docker-vm
  export DOCKER_TLS_VERIFY=1

  docker-enter() {
    boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
    boot2docker ssh -t sudo "/var/lib/boot2docker/docker-enter \"$1\""
  }

fi

# Kill all running containers.
alias dockerkillall='docker kill $(docker ps -q)'

# Delete all stopped containers.
alias dockercleanc='printf "\n>>> Deleting stopped containers\n\n" && docker rm $(docker ps -a -q)'

# Delete all untagged images.
alias dockercleani='printf "\n>>> Deleting untagged images\n\n" && docker rmi $(docker images -q -f dangling=true)'

# Delete all stopped containers and untagged images.
alias dockerclean='dockercleanc || true && dockercleani'

# list running docker containers and their ips
# if you name them meaningfully it'll be nicer
docker-ip() {
  for i in $(docker ps -q); do
    echo -n "$i"
    docker inspect --format ' {{ .Name }} {{ .NetworkSettings.IPAddress }}' "$i"
  done
}
