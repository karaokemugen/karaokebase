# Base de données des times de Toyunda Mugen

Ceci est la base de données des times de Toyunda Mugen. 

## Format d'un time

Un karaoké Toyunda Mugen est composé de 3 éléments rangés dans des dossiers

* Un fichier .ini dans le dossier ini
* Un fichier .ass dans le dossier lyrics
* Un fichier vidéo dans le dossier videos

### Dossier "ini"

C'est le fichier qui contient les informations permettant d'afficher le time dans la liste et que le daemon Toyunda Mugen le gère ensuite. Il est dérivé du format des .ini de Toyunda d'Epitanime.

Exemple :
```
origin=Bakaclub
aviname=Beck Mongorian Chop Squad - OP - Hit in the USA.avi
file=dummy.ass
```

* **origin** : Facultatif, stipule l'origine d'un karaoke. 
* **aviname** : Nom du fichier vidéo, tel quel dans le dossier des Vidéos. Toyunda Mugen lit tout ce que peut lire mpv.
* **file** : Nom du fichier de sous-titres tel que trouvable dans le dossier lyrics
	* Formats acceptés :
		* ass
		* srt
		* vtt
		* txt (format Toyunda)
	* Cas spécial : dummy.ass qui n'existe pas et est utilisé quand le fichier vidéo contient déjà des sous-titres, soit incrustés (hardsub) soit embarqués (ass dans la piste sous-titres d'un mkv. Dans ce cas, Toyunda Mugen ira extraire le sous-titre à la volée avant la lecture du karaoké pour ajouter le titre de la chanson en bas de l'écran pendant quelques secondes.

### Dossier "lyrics"

Contient le fichier de sous-titres tel que spécifié dans le .ini

Il s'agit d'un .ass généralement crée via AegisSub. Le format txt Toyunda d'Epitanime est aussi accepté (mais vivement déconseillé, ce format est obsolète et devrait périr dans un feu.)

### Dossier "videos"

Contient le fichier de vidéo tel que spécifié dans le .ini

Les vidéos ne sont pas fournies dans ce dépôt, par souci de place (et ça ferait un dépôt de 170 Go au bas mot). Des tas d'openings peuvent se retrouver sur Youtube ou sur des sites de déluge.


