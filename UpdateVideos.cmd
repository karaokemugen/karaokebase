@ECHO OFF
SETLOCAL
SET CWRSYNCHOME=.\Updater
SET HOME=.\Updater
SET CWOLDPATH=%PATH%
SET PATH=%CWRSYNCHOME%\BIN;%PATH%
SET HOST=shelter.mahoro-net.org
SET RSYNCRESSOURCE=karaokevideos
SET LOGIN=public

echo Karaoke Mugen Videos
echo ====================
echo.
echo Enter the password to update Karaoke Mugen videos folders.
echo.
echo The password is : musubi
echo The password doesn't display on your screen. That's normal.
echo.
echo WARNING : You will need around 190 Gb of free space to download this entirely.
echo.
echo You can stop the download anytime and resume it by restarting this script.
echo.
echo IMPORTANT : A dry run will be launched first. Make sure it's okay before continuing.
echo If you see ALL your media files are going to be deleted, CTRL+C NOW to abort
echo If it is all right, hit enter to continue.
echo You will be prompted for the password twice.
Updater\rsync --dry-run -ruvh --progress --delete-after %LOGIN%@%HOST%::%RSYNCRESSOURCE%/videos/ videos/
pause
Updater\rsync -ruvh --progress --delete-after %LOGIN%@%HOST%::%RSYNCRESSOURCE%/videos/ videos/
pause