#!/usr/bin/env bash
set -e
set -x
rsync -a -v --stats /Users/kuat/{Desktop,Drive,Movies,Music,Pictures} /Volumes/hgst/macbook/ # --delete-after
