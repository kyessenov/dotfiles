#!/bin/bash

title=""
artist=""
album=""
stat="stopped"
url=""

while [ "$1" '!=' "" ]
do
  case "$1" in
    title)
      title="$2"
      ;;
    artist)
      artist="$2"
      ;;
    album)
      album="$2"
      ;;
    status)
      stat="$2"
      ;;
    file)
      file="$2"
      ;;
    url)
      url="$2"
      ;;
    *)
      ;;
  esac
  shift
  shift
done

if [ "$stat" '=' 'playing' ]
then
  osascript -e "display notification \"${title//\"/}\" with title \"${artist//\"/}\""
fi

