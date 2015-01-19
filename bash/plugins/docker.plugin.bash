# Note, this might need to be different if you have an older version
# of boot2docker, or its configured for a different IP
if [[ $OS == "darwin" ]]; then
  export DOCKER_HOST=tcp://192.168.59.103:2376
  export DOCKER_CERT_PATH=/Users/allen.bargi/.boot2docker/certs/boot2docker-vm
  export DOCKER_TLS_VERIFY=1

  docker-enter() {
    boot2docker ssh '[ -f /var/lib/boot2docker/nsenter ] || docker run --rm -v /var/lib/boot2docker/:/target jpetazzo/nsenter'
    boot2docker ssh -t sudo "/var/lib/boot2docker/docker-enter \"$1\""
  }

fi

