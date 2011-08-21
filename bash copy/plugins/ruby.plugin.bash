#!/bin/bash
function remove_gem {
  gem list | grep $1 | awk '{ print $1; }' | xargs sudo gem uninstall
}

function gemmate {
  GEMDIR=`gem env gemdir`/gems
  mate $GEMDIR/`ls $GEMDIR | grep $1 | sort | tail -1`
}
