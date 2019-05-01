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
echo WARNING : You will need around 250 Gb of free space to download this entirely.
echo IMPORTANT : A dry run will be launched first. Make sure it is okay before continuing.
echo If you see ALL your media files are going to be deleted, CTRL+C to abort
echo If it is all right, hit enter to continue.
echo You will be prompted for the password twice.
DESTDIR=videos

if [ -e "./UpdateMedias.sh" ] 
then
	if [ `date +%s` -ge 1530396000 ] 
	then
		 DESTDIR=medias
		 if [ -e "./videos" ] && [ ! -e "./medias" ] 
		 then
			mv videos medias
		 fi
		 if [ -e "./videos" ] && [ -e "./medias" ] 
		 then
			mv -f videos/* medias/
		 fi
	fi
	rsync -ruvh --dry-run --progress --delete-after $rsynclogin@$host::$ressource/videos/ $DESTDIR
	read -p "Press enter to continue"
	rsync -ruvh --progress --delete-after $rsynclogin@$host::$ressource/videos/ $DESTDIR
else
	echo "Error : this script must be launched in its own folder."
	exit 1
fi

