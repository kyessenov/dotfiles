#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo Linking home files
find $DIR -d 1 -name ".*" -not -name ".git" -not -name ".gitignore" |\
  while read fname; do
    ln -s $fname ~
  done

echo Linking config files
for f in $DIR/config/*; do
  ln -s $f ~/.config
done
