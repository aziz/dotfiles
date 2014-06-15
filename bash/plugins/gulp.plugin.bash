#!/bin/bash

gulp_new_packages() {
  npm search "gulp-" > /tmp/gulp.txt
  diff ~/.gulp-packages /tmp/gulp.txt
  mv /tmp/gulp.txt ~/.gulp-packages
}
