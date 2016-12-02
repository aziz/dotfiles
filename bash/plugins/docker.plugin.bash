#!/usr/bin/env bash

# if [ "$(uname)" = "Darwin" ]; then
#   if [ "$(docker-machine 2> /dev/null)" ]; then
#     if [ "$(docker-machine status)" = "Running" ]; then
#       echo "configuring docker machine"
#       eval "$(docker-machine env default)"
#     fi
#   fi
# fi

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
