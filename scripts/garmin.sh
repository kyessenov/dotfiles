#!/bin/bash
GARMIN="/Volumes/GARMIN"

SOURCE=$GARMIN"/Garmin/ACTIVITY/"
DEST=$HOME"/Drive/Training/Garmin/"

rsync -t -r -v ${SOURCE} ${DEST} 
