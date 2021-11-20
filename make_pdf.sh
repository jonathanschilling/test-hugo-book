#!/bin/bash

# automatically generate PDFs for each Markdown page in this project
# based on https://pandoc.org/demos.html

for i in `find content/ -name "*.md"`
do
  from=$i
  to=`echo $from | sed -e 's/md$/pdf/g'`
  echo $from " >> " $to
  pandoc \
    -N \
    --template=template.tex \
    --variable fontsize=12pt \
    --variable version=2.0 \
    $from \
    --pdf-engine=lualatex \
    --toc \
    -o $to
done
