#!/bin/bash

rsynclogin="public"
host="shelter.mahoro-net.org"
ressource="karaokevideos"

echo Karaoke Mugen Videos
echo ====================
echo
echo "Entrez le mot de passe pour mettre a jour votre Karaoke Mugen"
echo "Le mot de passe ne s'affiche pas, ceci n'est pas un bug, n'essayez pas de regler votre ecran."
echo "Le mot de passe est : musubi"
echo "ATTENTION : Vous aurez besoin d'au moins 200 Go de libre pour recuperer les videos."

if [ -e "./UpdateVideos.sh" ] 
then
	rsync -ruvh --progress --delete-during --exclude=".git" --exclude=".git*" --exclude="karas/" --exclude="docs/" --exclude="lyrics/" --exclude="/dev" --exclude="/cygdrive" --exclude="Mettre a jour videos.cmd" --exclude="UpdateVideos.sh" --exclude="*.md" --exclude="*.csv" --exclude="/proc"  $rsynclogin@$host::$ressource .
else
	echo "Erreur : le script doit être lancé depuis son propre dossier !"
	exit 1
fi

