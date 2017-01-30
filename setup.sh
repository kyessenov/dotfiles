#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo Linking home files
find $DIR -maxdepth 1 -name ".*" -not -name ".git*" |\
  while read fname; do
    ln -s $fname ~
  done

echo Linking config files
mkdir ~/.config
for f in $DIR/config/*; do
  ln -s $f ~/.config
done
