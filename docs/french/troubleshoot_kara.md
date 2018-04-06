# Les outils et erreurs récurrentes - Fichiers .kara

## Les outils

Pour l'instant, les fichiers **.kara** doivent être tous créés et remplis manuellement en utilisant votre éditeur de texte préféré (*Notepad++* est l'un d'entre-eux). Des outils sont en cours de développement pour faciliter ce processus, mais en attendant, il faut se débrouiller à la *mano*.

## Erreurs récurrentes

### Pré-requis pour un .kara valide
La [documentation complète](karafile.md) fait foi pour s'assurer de la validité d'un *.kara*, mais rappelons par l'exemple les champs nécessaires à ces derniers :

***videofile=ALL - Dschinghis Khan - MV - Moskau.mp4***
***subfile=ALL - Dschinghis Khan - MV - Moskau.ass***
*subchecksum=3323b862f506468fecadd14fa5d98452*
***title=Moskau***
**series=**
***type=MV***
**order=**
***year=1980***
***singer=Dschinghis Khan***
**tags=TAG_CONCERT,TAG_REAL**
**songwriter=Ralph Siegel**
**creator=Eurovision**
**author=**
***lang=ger***
*KID=d9bb6a76-2b7d-469e-ba44-6acfc463202e*
*dateadded=1507741391*
*datemodif=1522051346*
*videosize=21563860*
*videogain=-3.59*
*videoduration=190*
*version=2*

Les champs **en gras** ci-dessus sont les champs dont la présence est obligatoire lorsque vous créerez "*à la main*" vos fichiers *.kara*. Les autres sont générés par Karaoké Mugen lors de la création de la base de données. Si ces champs n'existent pas, votre base de données ne sera pas générée.

Les champs *en italique* ci-dessus sont les champs qui n'acceptent pas de valeur vide après le "=". Assurez-vous également que le champ soit à jour, notamment pour les extensions des fichiers vidéo et les *checksum* des fichiers de sous-titres. Si ces champs ne sont pas correctement renseignés, votre *push* vers le dépôt Git de la base Karaoke Mugen sera refusé par le *pipeline* de test.

Attention : certains champs sont en ***gras et italique***.
Pour connaìtre les valeurs éligibles à chaque champ, consultez la [documentation complète](karafile.md).
Attention au champ "version", qui doit être soit renseigné par la génération de base de données, soit être à la dernière version du modèle de métadonnées. Actuellement, c'est "2".

Si vous effectuez un *push* vers le dépôt Git de la base Karaoke Mugen, il peut être refusé par le *pipeline* si :
- `videofile` : n'est pas trouvé dans le FTP de Karaoke Mugen. **Attention à l'extension.**
- `subfile` : n'est pas trouvé dans la base de Karaoke Mugen.
- `subchecksum` : n'est pas renseigné ou ne correspond pas au fichier dans le dépôt.
- **Tous les champs** de l'exemple ci-dessus doivent exsiter dans vos fichiers *.kara* finaux. 

#### Forcer Karaoke Mugen à générer ses données

Les champs suivants ne peuvent pas être créés *à la main* et nécessitent donc d'être générés par Karaoke Mugen : ```subchecksum```, ```KID```, ```dateadded```, ```datemodif```, ```videosize```, ```videogain```, ```videoduration``` et ```version```.

Ces données sont générées dans les *.kara* le nécessitant, à chaque fois que l'application regénère sa base de données. Pour rappel, il y  a deux façons de forcer cette regénération :
- **En ligne de commande**, l'option ```--generate```. Alternativement, si vous êtes pressés, l'option ```--validate``` crée les infos dans vos *.kara* sans recréer la base de données, ce qui suffit pour un push mais ne suffit pas pour profiter des modifications au sein de l'appli.
- **Avec l'exécutable**, supprimez votre base de données "```karas.sqlite3```" située dans ```app/db```, et redémarrez l'application. La base de données sera regénérée et actualisée, les données de vos nouveaux *.kara* avec.
