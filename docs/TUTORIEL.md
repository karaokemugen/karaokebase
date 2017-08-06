# Créer un Karaoké Toyunda Mugen

Bien le bonjour ! Votre générique préféré n'est pas dans la base Toyunda Mugen et ça vous rend très triste ?

**Deux solutions :** soit vous déposez une *issue* via le [formulaire](https://lab.shelter.moe/toyundamugen/times/issues/new) avec le template "*Suggestion de Kara*", et espérez qu'un mécène fasse le travail... Soit vous le réalisez vous-même ! C'est simple, et on va tout vous expliquer dans ce tutoriel. Allez, c'est parti ! :)

## Se préparer

### Installer Aegisub
Pour réaliser des *Karaokés* et même des *sous-titres* de façon générale, vous aurez besoin du logiciel **Aegisub**. Vous pouvez télécharger une **installation complète** *(full install)* ou une **installation portable** *(portable version)* via la page [Téléchargements](http://www.aegisub.org/downloads) du [site officiel](http://www.aegisub.org).


### Trouver une bonne source vidéo
Il pourrait être tentant d'inclure dans la base la première vidéo **YouTube** qui passe. Cependant, la qualité n'est pas forcément au rendez-vous, ou bien le titre est tout simplement introuvable. Dans le cas d'*animés* récents, il serait même préférable d'inclure une vidéo qui soit *creditless* (sans crédits), et au minimum en 720p. Il vous faudra donc une source DVD / Blu-Ray.

**Plusieurs solutions s'offrent à vous :**

* **Trouver un *rip* sur les interwebs** : faut-il encore présenter [NyaaTorrents](http://nyaa.si) ? Si vous avez un compte [Asian DVD Club](https://asiandvdclub.org), ça peut aussi vous aider. Et globalement, ***Google est votre ami***.

* **Demander aux potos** : si ce n'est pas déjà fait, rejoignez le Discord [*Le Eden de la Nanami*](https://discordapp.com/invite/a8dMYek) ! Et n'hésitez pas à demander aux habitués du canal *#karaoke* s'ils ont la chanson dans leur base personnelle !

* **Faire un rip vous-mêmes** : eh ouais, il faut parfois donner de sa personne. Certains DVD & Blu-Ray français contiennent les génériques sans crédits, mais c'est surtout le cas sur les volumes japonais. Il est possible de s'en procurer via [CD Japan](http://www.cdjapan.co.jp), en occasion sur [Mandarake](https://mandarake.co.jp)  ou encore tout bêtement sur [Amazon Japan](http://amazon.co.jp). Une fois que vous avez ça, il vous faut un lecteur DVD ou Blu-Ray pour PC, selon le support à ripper *(merci Captain Obvious !)*. Pour vous permettre de lire correctement les disques et de copier-coller les flux qui vous intéressent, je vous conseille le logiciel *DVD Fab Passkey* [(site officiel)](http://fr.dvdfab.cn/passkey-lite.htm)... [(et lien moins officiel)](https://mega.nz/#!tR5GVCRA!1HacBl2VOq-ee-oFOaZ285KXCr-NEJV5KSj8EceHL4A). Le disque obtenu et le flux extrait, on va le **réencoder** pour le **compresser** un peu, et obtenir un bon vieux fichier **MP4** plutôt qu'un flux *m2ts* ou *VOB*. Y a plusieurs écoles, mais je vous conseille de jeter un œil à [MeGUI](https://sourceforge.net/projects/megui/). 


### Trouver les "vraies" paroles
Sujet plus délicat qu'il n'y paraît, tant les transcriptions à l'oreille foisonnent sur Internet. Si plusieurs sources fiables sont d'accord entre-elles, on peut se dire que c'est bon. Autrement, il va falloir mener des enquêtes approfondies : bien souvent, en faisant soi-même une transcription à partir du livret officiel du CD où la chanson est parue. L'exercice peut être fastidieux si vous n'avez jamais appris vos kanas japonais, mais reste faisable à l'aide de ce tableau :

![](img_tutos/TableKana.png)

Si vous ne reconnaissez pas un kanji, le site http://maggie.ocrgrid.org/nhocr/ peut vous aider à le OCR ("numériser") pour le passer dans Google Traduction ou autre.

***Attention à bien respecter ces règles sur la romajisation des paroles :***

* Les mots non japonais doivent être mis en majuscules (si Karaoké non-japonais, ce n'est pas conseillé).
* Les particules doivent être retranscrite wa, wo, he (et non wa, o, e).
* Les voyelles longues comme "ou" sont notées ainsi et non avec un macaron ou un accent circonflexe.
* Ne pas mettre de majuscules au début des phrases (sauf dans un karaoke non japonais).
* Ne pas mettre de ponctuation.
* Mettre une majuscule pour les noms propres.

### Nommer son matériel
Vous devez maintenant avoir une vidéo et un fichier texte correspondant aux paroles de cette dernière. Le nommage de tous vos fichiers concernera le titre et le nom de la chanson. 

Le format est le suivant : 
***Langue - Série/oeuvre - Type - Titre***

Exemple : **JAP - Macross Frontier - OP2 - LION**


Pour les karaokés de clips musicaux / PV, la partie Série/oeuvre devient "nom du groupe".

Exemple : **FR - Les Inconnus - MV - Vice et versa**

* La langue est en MAJSUCULES, sur 2 à 4 caractères. Elle permet de s'y retrouver dans la liste des fichiers. Celles déjà en place :
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
    
* Le nom de la série doit obligatoirement être un nom facilement reconnaissable. Il faut préférer le nom international s'il existe, ou un nom facilement connu du public. Exemple, si je vous parle de *Spice & Wolf*, ne soumettez pas votre kara sous le nom *Ôkami to Kôshinryô* sous peine de cassage de genoux. Personne ne connaît cet animé sous ce titre. Pareil avec **Full Metal Alchemist* qu'il n'y a pas besoin d'écrire en japonais "*Hagane no Renkinjutsushi*" parce que PERSONNE de sensé n'irait taper ça dans un moteur de recherche, bande d'élitistes.
    * Par contre, *Suzumiya Haruhi no Yuutsu* est toléré, car "Suzumiya Haruhi" est facilement reconnaissable et connu du public. Même chose pour *Kidou Senki Gundam*.
    * Si vous avez ajouté une nouvelle série, mettez à jour le fichier **series_altnames.csv** dans le dossier racine ! Il contient la liste des noms alternatifs des séries.
    
* Le type du karaoké peut être l'un des suivants :
    * AMV : Anime Music Video. Peut être utilisé pour des clips musicaux tout en animation.
    * CM : Publicité.
    * ED : Ending d'un animé.
    * IN : Insert song.
    * OT : Autre/inclassable.
    * TRAILER : Vidéo promotionnelle (trailer, bande-annonce, etc.).
    * LIVE : Concerts.
    * OP : Opening.
    * MV : Vidéo musicale (clips musicaux).
    
* Le numéro de générique : le premier générique d'ouverture sera qualifié d'OP1, etc. 
    * S'il n'y a qu'un seul générique tout le long de la série ou saison, on omet le numéro et on met simplement OP ou ED selon le cas.
    * Attention toutefois : il arrive souvent, notamment en début de série, que des génériques d'ouverture servent exceptionnellement de générique de clôture. Il ne faut pas pour autant qualifier cet OP d'ED1 et l'ED classique d'ED2 ! Exemple avec la série *Kekkai Sensen*, qui n'a qu'un OP et un ED : l'OP sert d'ED au premier épisode, mais le générique d'ouverture doit taggé OP et le générique de cloture ED, et ne pas mettre "ED2" pour le générique de fin 'classique' sous prétexte qu'il y a eu un autre générique pour un seul épisode.  
    
* Le titre de la chanson, si vous l'avez. Respectez le plus possible son nom (sauf s'il contient des caractères spéciaux.)


#### Les choses à ne pas faire
* Mettre des caractères spéciaux dans le titre. Genre ! ? / : ... Votre système d'exploitation risque de ne pas apprécier.
* Mettre des symboles. Les japonais en raffolent, mais les claviers non. Exemple, ils utilisent souvent le signe "multiplier" pour faire une croix (X). Utiliser un x sera bien meilleur. Autre exemple, *Macross Delta*. Ne mettez PAS le signe delta sous peine de mort imminente.



## Se lancer

### L'espace de travail
En ouvrant **Aegisub**, vous tombez tout d'abord sur une interface quasiment vide. Avant de se mettre au boulot, il faut la remplir.

Tout d'abord, allez dans **"Vidéo > Ouvrir une vidéo"**, et sélectionnez votre vidéo afin de l'ouvrir. Puis, ouvrez votre fichier texte via **"Fichier > Ouvrir des sous-titres"** ou le bouton ![](img_tutos/IcoOuvrir.PNG).

Vous devriez donc avoir un écran similaire au mien, où je suis en train de réaliser le Karaoké de l'OP2 de *BTOOOM!*

**Il peut y avoir deux différences, en rapport avec l'audio :**

* Si vous n'avez pas la bande audio en haut à droite de l'écran, et si vous n'avez pas d'audio en jouant votre vidéo via le bouton ![](img_tutos/IcoLecture.PNG), alors le son n'est pas chargé. Remédiez-y via **"Audio > Ouvrir l'audio de la vidéo"**.

* Si vous n'avez pas le même type de bande audio que moi, c'est normal ! Et je vous conseille d'y remédier en cliquant sur l'icône ![](img_tutos/IcoSpectre.PNG). Ce type de représentation est plus simple selon moi, surtout pour le Karaoké.

![](img_tutos/Ecran01.PNG)


Si tout est bon, **"Fichier > Enregistrer les sous-titres sous..."** afin de créer un fichier *ASS* (sous-titres) et non plus de *texte plat*.

### Les styles de sous-titres
Il vous faudra ensuite intégrer le "style" de sous-titres Toyunda Mugen à votre script. Pour cela, l'idéal est de commencer par définir la résolution de la vidéo au sein du script en allant dans le menu **"Fichier > Propriétés"**, puis de cliquer sur le bouton **"De la vidéo"**.

Retournez ensuite dans Lab Shelter pour télécharger le script correspondant correspondant à votre résolution de vidéo, si vous ne l'avez pas déjà sur votre machine.

Ensuite, allez dans **"Sous-titres > Gestionnaires de style"**. Cliquez sur **"Importer depuis un script"** et sélectionner le fichier téléchargé correspondant à votre résolution. Importez le style **"Default"** en cochant la case à sa gauche puis en cliquant sur **"OK"**, confirmez que vous voulez *remplacer le style existant*, et c'est bon !

### La synchronisation "simple" (ou *timing*)
On est prêts pour bosser ! Pour toute cette étape, je vous conseille de désactiver le *"Replçage automatique du curseur vidéo au temps de début de la ligne active"* en cliquant sur le bouton ![](img_tutos/IcoAuto.PNG). Ça vous évitera une crise de nerfs.