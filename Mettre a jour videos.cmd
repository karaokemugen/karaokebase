@ECHO OFF
SETLOCAL
SET CWRSYNCHOME=.\Updater
SET HOME=.\Updater
SET CWOLDPATH=%PATH%
SET PATH=%CWRSYNCHOME%\BIN;%PATH%
SET HOST=shelter.mahoro-net.org
SET RSYNCRESSOURCE=karaokevideos
SET LOGIN=public

echo Toyunda Mugen Videos
echo ====================
echo.
echo Entrez le mot de passe pour mettre a jour votre dossier video de Toyunda Mugen
echo.
echo Le mot de passe est : musubi
echo Le mot de passe ne s'affiche pas, ceci n'est pas un bug, n'essayez pas de regler votre ecran.
echo.
echo ATTENTION : Au moins 150 Go sont requis pour recuperer l'integralite des videos.

Updater\rsync -ruvh --progress --delete-during --exclude=".git" --exclude="ini/" --exclude="lyrics/" --exclude=".gitignore" --exclude="CONTRIBUTING" --exclude="/dev" --exclude="/cygdrive" --exclude="/proc" --exclude="LICENSE" --exclude="README.md" %LOGIN%@%HOST%::%RSYNCRESSOURCE% .
pause