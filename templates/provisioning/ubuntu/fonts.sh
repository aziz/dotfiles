#!/usr/bin/env bash

mkdir /tmp/adodefont
cd /tmp/adodefont
wget -O source_code_pro.zip https://github.com/adobe-fonts/source-code-pro/archive/1.017R.zip
unzip source_code_pro.zip
mkdir -p ~/.fonts
cp source-code-pro-1.017R/OTF/*.otf ~/.fonts/
fc-cache -f -v
