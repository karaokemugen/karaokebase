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
echo WARNING : You need at least 190 Gb of free space to download this.
echo IMPORTANT : A dry run will be launched first. Make sure it is okay before continuing.
echo If you see ALL your media files are going to be deleted, CTRL+C NOW to abort
echo If it is all right, hit enter to continue.
echo You will be prompted for the password twice.

if [ -e "./UpdateVideos.sh" ] 
then
	rsync -ruvh --dry-run --progress --delete-after --exclude=".tmb/" $rsynclogin@$host::$ressource/videos/ videos/
	read -p "Press enter to continue"
	rsync -ruvh --progress --delete-after --exclude=".tmb/" $rsynclogin@$host::$ressource/videos/ videos/
else
	echo "Error : this script must be launched in its own folder."
	exit 1
fi

