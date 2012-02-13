#!/bin/bash

# Set the path nginx
export NGINX_PATH='/usr/local/sbin/nginx'

nginx_reload () {
  FILE="${NGINX_PATH}/logs/nginx.pid"
  if [ -e $FILE ]; then
    echo "Reloading NGINX..."
    PID=`cat $NGINX_PATH/logs/nginx.pid`
    sudo kill -HUP $PID
  else
    echo "Nginx pid file not found"
    return 0
  fi
}

nginx_stop () {
  FILE="${NGINX_PATH}/logs/nginx.pid"
  if [ -e $FILE ]; then
    echo "Stopping NGINX..."
    PID=`cat $NGINX_PATH/logs/nginx.pid`
    sudo kill -INT $PID
  else
    echo "Nginx pid file not found"
    return 0
  fi
}

nginx_start () {
  FILE="${NGINX_PATH}/sbin/nginx"
  if [ -e $FILE ]; then
    echo "Starting NGINX..."
    sudo $NGINX_PATH/sbin/nginx
  else
    echo "Couldn't start nginx"
  fi
}

nginx_restart () {
  FILE="${NGINX_PATH}/logs/nginx.pid"
  if [ -e $FILE ]; then
    echo "Stopping NGINX..."
    PID=`cat $NGINX_PATH/logs/nginx.pid`
    sudo kill -INT $PID
    sleep 1
    echo "Starting NGINX..."
    sudo $NGINX_PATH/sbin/nginx
  else
    echo "Nginx pid file not found"
    return 0
  fi
}