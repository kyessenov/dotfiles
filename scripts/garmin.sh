#!/bin/bash
# Upload files from Garmin to Google Drive.
set -ex
rsync -av -i --stats --progress \
	/mnt/chromeos/removable/GARMIN/GARMIN/ACTIVITY/ /mnt/chromeos/GoogleDrive/MyDrive/Training/Garmin/
