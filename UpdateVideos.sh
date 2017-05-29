#!/bin/bash

echo Toyunda Mugen Videos 
echo ====================
echo
echo Entrez le login et le mot de passe pour mettre a jour votre Toyunda Mugen
echo Ne partagez pas vos login et mots de passe.
echo Le mot de passe ne s'affiche pas, ceci n est pas un bug, n essayez pas de regler votre ecran.
echo \n
echo Le mot de passe est : musubi
echo \n
echo ATTENTION : Vous aurez besoin d'au moins 150 Go de libre pour recuperer les videos.

rsync -ruvh --progress --delete-during --exclude=".git" --exclude="ini/" --exclude="lyrics/" --exclude=".gitignore" --exclude="CONTRIBUTING" --exclude="LICENSE" --exclude="README.md" $rsynclogin@shelter.mahoro-net.org::toyunda .
