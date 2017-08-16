# Base de données des times de Karaoke Mugen

Ceci est la base de données des times de Karaoke Mugen. 

## Format d'un time

Un karaoké Karaoke Mugen est composé de 3 éléments rangés dans des dossiers

* Un fichier .kara dans le dossier karas
* Un fichier .ass dans le dossier lyrics
* Un fichier vidéo dans le dossier videos

### Dossier "karas"

C'est le fichier qui contient les informations permettant d'afficher le time dans la liste et que le daemon Karaoke Mugen le gère ensuite. Il reprend le format d'un .ini classique.

Exemple :
```
videofile="ANG - Porter Robinson & Madeon - CLIP - Shelter.mp4"
subfile="ANG - Porter Robinson & Madeon - CLIP - Shelter.ass"
year="2016"
singer="Amy Millan"
tags=""
songwriter="Porter Robinson,Madeon"
lang="eng"
creator="A-1 Pictures"
author="karaokes.moe"
series="Shelter"
```

Les trois éléments obligatoires sont :

* **videofile** : Nom du fichier vidéo, tel quel dans le dossier des Vidéos. Karaoke Mugen lit tout ce que peut lire mpv.
* **subfile** : Nom du fichier de sous-titres tel que trouvable dans le dossier lyrics (en .ass)
	* Cas spécial : dummy.ass qui n'existe pas et est utilisé quand le fichier vidéo contient déjà des sous-titres, soit incrustés (hardsub) soit embarqués (ass dans la piste sous-titres d'un mkv. Dans ce cas, Karaoke Mugen ira extraire le sous-titre à la volée avant la lecture du karaoké pour ajouter le titre de la chanson en bas de l'écran pendant quelques secondes.
* **lang** : code ISO 639-2B de la langue utilisée.

La description des autres éléments se trouvent dans [CONTRIBUTING.md]

### Dossier "lyrics"

Contient le fichier de sous-titres tel que spécifié dans le .kara

Il s'agit d'un .ass généralement crée via AegisSub. Voyez [CONTRIBUTING.md] pour des tutoriels sur comment faire de bons karaokés via ce format.

### Dossier "videos"

Contient le fichier de vidéo tel que spécifié dans le .kara

Les vidéos ne sont pas fournies dans ce dépôt, par souci de place (et ça ferait un dépôt de 170 Go au bas mot). Vous pouvez néanmoins lancer Mettre a jour videos.cmd (Windows) ou UpdateVideos.sh (OSX/Linux) pour récupérer les vidéos par rsync depuis le serveur Shelter.

