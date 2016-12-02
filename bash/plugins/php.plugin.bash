#!/usr/bin/env bash

if [ -e $(brew --prefix php-version)/php-version.sh ]; then
  source $(brew --prefix php-version)/php-version.sh && php-version 5
fi
