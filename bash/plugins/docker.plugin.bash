# Note, this might need to be different if you have an older version
# of boot2docker, or its configured for a different IP
if [[ $OS == "darwin" ]]; then
  export DOCKER_HOST=tcp://192.168.59.103:2375
fi
