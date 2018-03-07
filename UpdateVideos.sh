#!/bin/bash

rsynclogin="public"
host="shelter.mahoro-net.org"
ressource="karaokevideos"

echo Karaoke Mugen Videos
echo ====================
echo
echo Enter password to update Karaoke Mugen videos
echo The password is not displayed, that is normal.
echo the passowrd is : musubi
echo WARNING : You need at least 170 Gb of free space to download this.

if [ -e "./UpdateVideos.sh" ] 
then
	rsync -ruvh --progress --delete-after --exclude=".tmb/" $rsynclogin@$host::$ressource/videos/ videos/
else
	echo "Error : this script must be launched in its own folder."
	exit 1
fi

