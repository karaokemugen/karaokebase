# Les outils et erreurs récurrentes - Fichiers .ass

## Les outils

- **Aegisub** Multi-plateforme, c'est la référence en matière de logiciel de sous-titres, 100% compatible avec le format ASS.
- **Subtitle Edit** Windows uniquement, il supporte une grande quantité de format de sous-titres en plus de l'ASS, certains des outils présent peuvent servir mais préféré l'utilisation de **Aegisub**.

## Erreurs récurrentes

### Décalage du sous-titre lié aux FPS de la vidéo

Lorsque vous remplacer une vidéo par une autre, il peut arriver qu'un décalage subsiste malgré une synchronisation du karaoké.
Ce décalage est lié aux nombres d'FPS (frames par seconde) de la vidéo, le time original a été produit sur une vidéo en 25 FPS alors que votre nouvelle vidéo est encodé à 23.97 FPS.
Il faut donc convertir votre karaoke de 25 FPS à 23.97 FPS.

## Avec Aegisub :

- Fichier -> Exporter sous...
- Cocher la case "Transformation défilement"
- Indiquer dans "Défilement d'entrée :" le nombre d'FPS de la vidéo original
- Indiquer dans "Sortie :" le nombre d'FPS de la nouvelle vidéo
- Appuyer ensuite sur "Export..." et tester votre nouveau karaoké.

NB : En cas de soucis vous pouvez essayer d'inverser l'entrée et la sortie.

## Avec Subtitle Edit :

- Synchronisation -> Modifier la vitesse de trame (fps)...
- Indiquer dans "Vitesse de départ" le nombre d'FPS de la vidéo original
- Indiquer dans "Vitesse désirée" le nombre d'FPS de la nouvelle vidéo
- Sauvegarder votre fichier.

NB : Vous pouvez charger vos vidéos directement dans la boite de dialogue.

### À rédiger ~