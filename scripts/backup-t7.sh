#!/usr/bin/env bash
# Sync files from Google Drive to external drive.
set -ex
rsync -av --progress --stats -i \
	--delete-after \
	--exclude "*.gdoc" \
	--exclude "*.gsheet" \
	--exclude "*.gmap" \
	--exclude "*.gdraw" \
	--exclude "*.gform" \
	--exclude "*.gslides" \
	"$@" \
	/mnt/chromeos/GoogleDrive/MyDrive/ /mnt/chromeos/removable/t7/Drive/
