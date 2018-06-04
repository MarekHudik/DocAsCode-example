#!/bin/bash

BASE=`pwd`

docker run -w /foo \
   -v $BASE:/foo \
   marekhudik/document-as-code \
pandoc --self-contained --standalone --number-sections --table-of-contents main.md -o output.html --template github-markdown --include-before-body intro.html
