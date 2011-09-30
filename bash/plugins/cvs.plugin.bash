#!/bin/bash

function cvs_rm() {
  rm $1
  cvs rm $1
}
