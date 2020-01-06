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
echo WARNING : You will need around 310 Gb of free space to download this entirely
echo and if you are using Karaoke Mugen 3.0 or higher, we recommend that you launch
echo Karaoke Mugen with the option "--updateMedias".
echo.
echo You can stop the download anytime and resume it by restarting this script.
echo.
echo IMPORTANT : A dry run will be launched first. Make sure it's okay before continuing.
echo You will be prompted for the password twice.
REM If date is newer than July 1st 2018, rename videos to medias
SET FirstDate=2018-06-30

REM These indexes assume %DATE% is in format:
REM   Abr MM/DD/YYYY - ex. Sun 01/25/2015
SET TodayYear=%DATE:~6,4%
SET TodayMonth=%DATE:~3,2%
SET TodayDay=%DATE:~0,2%




SET DESTDIR=medias

Updater\rsync --dry-run -ruvh --progress --delete-after %LOGIN%@%HOST%::%RSYNCRESSOURCE%/medias/ %DESTDIR%

echo If you see ALL your media files are going to be deleted, CTRL+C NOW to abort
echo If it is all right, hit enter to continue.
pause
Updater\rsync -ruvh --progress --delete-after %LOGIN%@%HOST%::%RSYNCRESSOURCE%/medias/ %DESTDIR%/
pause
