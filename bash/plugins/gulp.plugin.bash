#!/bin/bash

gulp_new_packages() {
  npm search "gulp-" > /tmp/gulp.txt
  diff --changed-group-format='%>' --unchanged-group-format='' ~/.gulp-packages /tmp/gulp.txt
  mv /tmp/gulp.txt ~/.gulp-packages
}
