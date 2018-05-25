# Nommer son matériel

Vous devez maintenant avoir une vidéo et un fichier texte correspondant aux paroles de cette dernière. Le nommage de tous vos fichiers concernera le titre et le nom de la chanson.

Le format que l'on utilise habituellement est le suivant : (il n'est PAS obligatoire si vous faites un karaoké juste pour vous et ne contribuez pas à la base !)

***Langue - Série/oeuvre - Type - Titre***

Exemple : **JAP - Macross Frontier - OP2 - LION**

Pour les Karaokés de clips musicaux / MV et LIVE, la partie "*Série/œuvre*" devient "*Nom du groupe*".

Exemple : **FR - Les Inconnus - MV - Vice et versa**

* La langue est en MAJSUCULES, sur 2 à 3 caractères. Elle permet de s'y retrouver dans la liste des fichiers. Celles déjà en place (liste non exhaustive) :
  * ALL : allemand
  * ANG : anglais
  * CHI : chinois
  * COR : corréen
  * EPO : espéranto
  * ESP : espagnol
  * FIC : fictive (langue qui n'existe pas)
  * FR : français
  * HEB : hébreu
  * ITA : italien
  * JAP : japonais
  * LAT : latin
  * POR : portugais
  * RUS : russe
  * SUE : suèdois
  * *Enrichissez ce document si vous ajoutez de nouvelles langues !*
* S'il s'agit d'une vidéo musicale (`MV`) ou d'un concert (`LIVE`), la série n'a pas toujours sens, du coup c'est le nom du chanteur/euse/groupe qui est mis à la place. Exemple : `JAP - World Order - MV - BOY MEETS GIRL` pour le vidéoclip du groupe japonais World Order. **NOTE : S'il s'agit d'un MV ou LIVE reprenant une chanson d'un jeu ou animé, et non une chanson originale de J-Music, on peut mettre plutôt le nom de la série dont c'est tiré si on préfère.**
* Le nom de la série peut être un nom facilement reconnaissable ou le nom original.
  * Si vous avez ajouté une nouvelle série, [mettez à jour le fichier **series.json**](altnames.md) dans le dossier racine ! Il contient la liste des noms alternatifs des séries. Par exemple le nom japonais de *Fullmetal Alchemist* peut être indiqué dans ce fichier. Cela permet au moteur de recherche de Karaoké Mugen de retrouver la série en japonais.
* Le type du karaoké peut être l'un des suivants :
  * `AMV` : Anime Music Video. Peut être utilisé pour des clips musicaux tout en animation crée par des fans.
  * `CM` : Publicité.
  * `ED` : Ending d'un animé.
  * `IN` : Insert song.
  * `OT` : Autre/inclassable.
  * `TRAILER` : Vidéo promotionnelle (trailer, bande-annonce, etc.).
  * `LIVE` : Concerts.
  * `OP` : Opening d'un animé.
  * `MV` : Vidéo musicale (clips musicaux).
* Le numéro de générique : le premier générique d'ouverture sera qualifié d'OP1, etc. 
  * S'il n'y a qu'un seul générique tout le long de la série ou saison, on omet le numéro et on met simplement OP ou ED selon le cas.
  * Attention toutefois : il arrive souvent, notamment en début de série, que des génériques d'ouverture servent exceptionnellement de générique de clôture. Il ne faut pas pour autant qualifier cet OP d'ED1 et l'ED classique d'ED2 ! Exemple avec la série *Kekkai Sensen*, qui n'a qu'un OP et un ED : l'OP sert d'ED au premier épisode, mais le générique d'ouverture doit ête taggé OP et le générique de clôture ED, et ne pas mettre "ED2" pour le générique de fin 'classique' sous prétexte qu'il y a eu un autre générique pour un seul épisode.
* Le titre de la chanson, si vous l'avez. Respectez le plus possible son nom (sauf s'il contient des caractères spéciaux qui sont interdits dans les noms de fichier.)
  * Pour les caractères spéciaux, trouvez des équivalents avec de vrais caractères lisibles par n'importe quel clavier. Exemples :
    * Les signes de ponctuation ?, :, ; ou encore /. De toutes façons votre système d'exploitation vous l'interdira la plupart du temps.
    * Le signe de ponctuation ! est aussi vivement déconseillé.
    * Le symbole mathématique delta (𝚫) de Macross Delta
    * Le symbole mathématique multiplier (×) couramment utilisé dans beaucoup de titres de séries comme Kiss × Sis peut être remplacé par un simple x (la lettre x comme dans xylophone).

**NOTE :** Les noms de fichiers ne doivent contenir **AUCUN ACCENT** sous peine de cassage de genoux même si on vous les a déjà cassés. Si vous tenez absolument à retranscrire les caractères spéciaux, indiquez-les à l'intérieur du fichier .kara (voir plus loin)
