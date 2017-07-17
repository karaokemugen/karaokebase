#!/bin/bash

rsynclogin="public"
host="shelter.mahoro-net.org"
ressource="karaokevideos"

echo Toyunda Mugen Videos
echo ====================
echo
echo "Entrez le mot de passe pour mettre a jour votre Toyunda Mugen"
echo "Le mot de passe ne s'affiche pas, ceci n'est pas un bug, n'essayez pas de regler votre ecran."
echo "Le mot de passe est : musubi"
echo "ATTENTION : Vous aurez besoin d'au moins 150 Go de libre pour recuperer les videos."

if [ -e "./UpdateVideos.sh" ] 
then
	rsync -ruvh --progress --delete-during --exclude=".git" --exclude="karas/" --exclude="lyrics/" --exclude=".gitignore" --exclude="CONTRIBUTING.md" --exclude="LICENSE.md" --exclude="README.md" $rsynclogin@$host::$ressource .
else
	echo "Erreur : le script doit être lancé depuis son propre dossier !"
	exit 1
fi

