#!/usr/bin/env bash
set -e
set -x
rsync -a -v --stats /Users/kuat/{Drive,Movies,Music,Photos,Pictures/Lightroom/Lightroom\ 5\ Catalog.lrcat} /Volumes/hgst/macbook/ --delete-after
