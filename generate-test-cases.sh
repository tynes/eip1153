#!/bin/sh
if [ -z $1 ]; then
    echo "$1 must specify output file"
    exit 1
fi


> $1

for f in ./src/etk-test-cases/**/*.etk
do
  grep "^#.*" ${f} >> $1
  echo `eas ${f}` >> $1
  echo >> $1
done
