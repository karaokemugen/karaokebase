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
echo WARNING : You will need around 170 Gb of free space to download this entirely.
echo.
echo You can stop the download anytime and resume it by restarting this script.

Updater\rsync -ruvh --progress --delete-after %LOGIN%@%HOST%::%RSYNCRESSOURCE%/videos/ videos/
pause
