#!/bin/bash
function remove_gem {
  gem list | grep $1 | awk '{ print $1; }' | xargs sudo gem uninstall
}

function gemmate {
  GEMDIR=`gem env gemdir`/gems
  mate $GEMDIR/`ls $GEMDIR | grep $1 | sort | tail -1`
}

function cat_colorless {
  cat $1 | sed -r "s/\x1B\[([0-9]{1,3}((;[0-9]{1,3})*)?)?[m|K]//g"
}

