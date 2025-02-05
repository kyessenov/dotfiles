#!/usr/bin/env bash
# Sync files from T7 to HGST drive.
set -ex
rsync -av --stats -i \
	--delete-after \
	--exclude "/HGSTBackup" \
	"$@" \
	/mnt/chromeos/removable/t7/ /mnt/chromeos/removable/hgst/ | tee /mnt/chromeos/removable/hgst/HGSTBackup/$(date +%F).log

