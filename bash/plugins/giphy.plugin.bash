#!/usr/bin/env bash


function giphy {
  tag="$(echo "$*" | sed 's/ /+/')"
  random_api_url="http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=$tag"
  gif_url="$(curl "$random_api_url" 2> /dev/null | jq '.data.image_url' -r)"
  echo $gif_url
  curl "$gif_url" 2> /dev/null | imgcat
}


