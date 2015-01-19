# Note, this might need to be different if you have an older version
# of boot2docker, or its configured for a different IP
if [[ $OS == "darwin" ]]; then
  export DOCKER_HOST=tcp://192.168.59.103:2376
  export DOCKER_CERT_PATH=/Users/allen.bargi/.boot2docker/certs/boot2docker-vm
  export DOCKER_TLS_VERIFY=1
fi
