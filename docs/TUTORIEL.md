# Créer un Karaoké Toyunda Mugen

Bien le bonjour ! Votre générique préféré n'est pas dans la base Toyunda Mugen et ça vous rend très triste ?

**Deux solutions :** soit vous déposez une *issue* via le [formulaire](https://lab.shelter.moe/toyundamugen/times/issues/new) avec le template "*Suggestion de Kara*", et espérez qu'un mécène fasse le travail... Soit vous le réalisez vous-même ! C'est simple, et on va tout vous expliquer dans ce tutoriel. Allez, c'est parti ! :)

## Se préparer

### Installer Aegisub
Pour réaliser des *Karaokés* et même des *sous-titres* de façon générale, vous aurez besoin du logiciel **Aegisub**. Vous pouvez télécharger une **installation complète** *(full install)* ou une **installation portable** *(portable version)* via la page [Téléchargements](http://www.aegisub.org/downloads) du [site officiel](http://www.aegisub.org).

L'**installation portable** est utile quand vous voulez la mettre sur une clé USB et l'utiliser sur n'importe quel ordinateur sans avoir à installer quoi que ce soit. Dans le doute, prenez l'**installation complète**.


### Trouver une bonne source vidéo
Il pourrait être tentant d'inclure dans la base la première vidéo **YouTube** qui passe. Cependant, la qualité n'est pas forcément au rendez-vous, ou bien le titre est tout simplement introuvable. Dans le cas d'*animés* récents, il serait même préférable d'inclure une vidéo qui soit *creditless* (sans texte de générique), et au minimum en 720p. Il vous faudra donc une source DVD / Blu-Ray.

**Plusieurs solutions s'offrent à vous :**

#### Trouver un *rip* sur les interwebs
Faut-il encore présenter [NyaaTorrents](http://nyaa.si) ? Si vous avez un compte [Asian DVD Club](https://asiandvdclub.org), ça peut aussi vous aider. Et globalement, ***Google est votre ami***.

#### Demander aux potos

Si ce n'est pas déjà fait, rejoignez le Discord [*Le Eden de la Nanami*](https://discordapp.com/invite/a8dMYek) ! Et n'hésitez pas à demander aux habitués du canal *#karaoke* s'ils ont la chanson dans leur base personnelle !

#### Faire un rip vous-même : 

Eh ouais, il faut parfois donner de sa personne. Certains DVD & Blu-Ray français contiennent les génériques sans crédits, mais c'est surtout le cas sur les volumes japonais. Il est possible de s'en procurer via [CD Japan](http://www.cdjapan.co.jp), en occasion sur [Mandarake](https://mandarake.co.jp)  ou encore tout bêtement sur [Amazon Japan](http://amazon.co.jp). 

Une fois que vous avez ça, il vous faut un lecteur DVD ou Blu-Ray pour PC, selon le support à ripper *(merci Captain Obvious !)*. 

Pour vous permettre de lire correctement les disques et de copier-coller les flux qui vous intéressent, je vous conseille le logiciel *DVD Fab Passkey* [(site officiel)](http://fr.dvdfab.cn/passkey-lite.htm) ou *MakeMKV* [(site officiel)](http://www.makemkv.com/)

##### Avec DVD Fab 

DVD Fab est un logiciel, toujours actif en arrière-plan, qui décode *on-the-fly* (comprendre "à la volée") vos disques vidéo. Après que vous ayez inséré un DVD ou un Blu-Ray protégé dans votre lecteur, il mettra une dizaine de secondes à le déchiffrer.

Vous pourrez ensuite soit le lire directement dans VLC (ou autre lecteur vidéo, je juge pas), soit extraire les flux *m2ts* qui vous intéressent d'un simple copier-coller. Les flux *m2ts* sont situés dans **/BDMV/STREAM/** à partir de la racine de votre disque. N'hésitez pas à identifier les fichiers suivant leur taille, et même à les lire, pour trouver le bon et n'extraire que votre générique fétiche.

**Exemple :** bien que *Kazé* y ait intégré un Karaoké inchantable et non désactivable, l'OP de Chunibyô est le fichier **00005.m2ts** (240Mo) du Blu-Ray français.

##### Avec MakeMKV

L'extraction de votre Blu-Ray ou DVD passe par l'appui sur un simple bouton. **Attention :** par défaut, la durée minimale d'une vidéo est considérée de 120 secondes, et se change dans les options. Comme un générique d'animé dure moins que ça, il faudra aller modifier cette option avant de tenter une extraction sinon *MakeMKV* ne verra pas ce que vous recherchez et ne vous proposera pas d'extraire la vidéo.

La vidéo extraite est un *.mkv* par vidéo. *(Attention à ne pas capturer les épisodes lorsque vous sélectionnez les vidéos à extraire ! Regardez la durée qu'ils font pour deviner s'il s'agit d'un générique).*

##### Dans un cas comme dans l'autre...

Le réencodage est **primordial** car les fichiers extraits de façon brute sont très volumineux. Si on gardait les versions brutes, on aurait une base frôlant le tera-octet très rapidement !

Le disque obtenu et le flux extrait, on va donc le **réencoder** pour le **compresser** un peu, et obtenir un bon vieux fichier **MP4** plutôt qu'un flux *m2ts* ou *VOB*, empacté ou non dans un *MKV*. Y a plusieurs écoles, mais je vous conseille de jeter un œil à [MeGUI](https://sourceforge.net/projects/megui/). 

Vous pouvez aussi utiliser [Handbrake](https://handbrake.fr/) ou si la ligne de commande ne vous effraie pas, [FFMpeg](https://www.ffmpeg.org/).

### Trouver les "vraies" paroles
Sujet plus délicat qu'il n'y paraît, tant les transcriptions à l'oreille foisonnent sur Internet. Si plusieurs sources fiables sont d'accord entre elles, on peut se dire que c'est bon. Autrement, il va falloir mener des enquêtes approfondies : bien souvent, en faisant soi-même une transcription à partir du livret officiel du CD où la chanson est parue. L'exercice peut être fastidieux si vous n'avez jamais appris vos kanas japonais, mais reste faisable à l'aide de ce tableau :

![](img_tutos/TableKana.png)

Si vous ne reconnaissez pas un kanji, le site [Japanese character recognition](http://maggie.ocrgrid.org/nhocr/) peut vous aider à le OCR ("numériser") pour le passer dans Google Traduction ou autre.

***Attention à bien respecter ces règles sur la romajisation des paroles :***

* Dans un Karaoké japonais, les mots non japonais doivent être mis en majuscules pour bien les différencier.
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

Pour les Karaokés de clips musicaux / PV, la partie "*Série/œuvre*" devient "*Nom du groupe*".

Exemple : **FR - Les Inconnus - MV - Vice et versa**

* La langue est en MAJSUCULES, sur 2 à 3 caractères. Elle permet de s'y retrouver dans la liste des fichiers. Celles déjà en place :
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
    
* Le nom de la série doit obligatoirement être un nom facilement reconnaissable. Il faut préférer le nom international s'il existe, ou un nom facilement connu du public. Exemple, si je vous parle de *Spice & Wolf*, ne soumettez pas votre kara sous le nom *Ôkami to Kôshinryô* sous peine de cassage de genoux. Personne ne connaît cet animé sous ce titre. Pareil avec *Full Metal Alchemist* qu'il n'y a pas besoin d'écrire en japonais "*Hagane no Renkinjutsushi*" parce que PERSONNE de sensé n'irait taper ça dans un moteur de recherche, bande d'élitistes.
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
    * OP : Opening d'un animé.
    * MV : Vidéo musicale (clips musicaux).
    
* Le numéro de générique : le premier générique d'ouverture sera qualifié d'OP1, etc. 
    * S'il n'y a qu'un seul générique tout le long de la série ou saison, on omet le numéro et on met simplement OP ou ED selon le cas.
    * Attention toutefois : il arrive souvent, notamment en début de série, que des génériques d'ouverture servent exceptionnellement de générique de clôture. Il ne faut pas pour autant qualifier cet OP d'ED1 et l'ED classique d'ED2 ! Exemple avec la série *Kekkai Sensen*, qui n'a qu'un OP et un ED : l'OP sert d'ED au premier épisode, mais le générique d'ouverture doit ête taggé OP et le générique de clôture ED, et ne pas mettre "ED2" pour le générique de fin 'classique' sous prétexte qu'il y a eu un autre générique pour un seul épisode.  
    
* Le titre de la chanson, si vous l'avez. Respectez le plus possible son nom (sauf s'il contient des caractères spéciaux qui sont interdits.)
	- Pour les caractères spéciaux, trouvez des équivalents avec de vrais caractères lisibles par n'importe quel clavier. Exemples :
		+ Les signes de ponctuation ?, : ou encore /. De toutes façons votre système d'exploitation vous l'interdira la plupart du temps.
		+ Le signe de ponctuation ! est aussi vivement déconseillé.
		+ Le symbole mathématique delta (𝚫) de Macross Delta
		+ Le symbole mathématique multiplier (×) couramment utilisé dans beaucoup de titres de séries comme Kiss × Sis peut être remplacé par un simple x (la lettre x comme dans xylophone).
	

## Se lancer

### Réaliser le karaoké en lui-même 

#### L'espace de travail
En ouvrant **Aegisub**, vous tombez tout d'abord sur une interface quasiment vide. Avant de se mettre au boulot, il faut la remplir.

Tout d'abord, allez dans **"Vidéo > Ouvrir une vidéo"**, et sélectionnez votre vidéo pour l'ouvrir. Puis, ouvrez votre fichier texte via **"Fichier > Ouvrir des sous-titres"** ou le bouton ![](img_tutos/IcoOuvrir.PNG).

Vous devriez donc avoir un écran similaire au mien, où je suis en train de réaliser le Karaoké de l'OP2 de *BTOOOM!*

**Il peut y avoir deux différences, en rapport avec l'audio :**

* Si vous n'avez pas la bande audio en haut à droite de l'écran, et si vous n'avez pas de son en jouant votre vidéo via le bouton ![](img_tutos/IcoLecture.PNG), alors le son n'est pas chargé. Remédiez-y via **"Audio > Ouvrir l'audio de la vidéo"**.


* Si vous n'avez pas le même type de bande audio, c'est normal ! Et je vous conseille d'y remédier en cliquant sur l'icône ![](img_tutos/IcoSpectre.PNG). Ce type de représentation est plus explicite.

![](img_tutos/Ecran01.PNG)


Si tout est bon, faites **"Fichier > Enregistrer les sous-titres sous..."** afin de créer un fichier *ASS* (sous-titres) et non plus de *texte plat*. Nommez votre fichier *ASS* avec le même nom que choisi précédemment pour votre karaoké. Par exemple **JAP - Macross Frontier - OP2 - LION.ass**


#### Les styles de sous-titres
Il vous faudra ensuite intégrer le "style" de sous-titres *Toyunda Mugen* à votre script. Pour cela, l'idéal est de commencer par définir la résolution de la vidéo au sein du script en allant dans le menu **"Fichier > Propriétés"**, puis de cliquer sur le bouton **"De la vidéo"**.

Retournez ensuite sur Lab Shelter dans **/docs/samples_lyrics/** pour télécharger le script correspondant à votre résolution de vidéo, si vous ne l'avez pas déjà sur votre machine.

Ensuite, allez dans **"Sous-titres > Gestionnaires de style"**. Cliquez sur **"Importer depuis un script"** et sélectionnez le fichier téléchargé correspondant à votre résolution. Importez le style **"Default"** en cochant la case à sa gauche puis en cliquant sur **"OK"**, confirmez que vous voulez *remplacer le style existant*, et c'est bon !

***Si la résolution sur laquelle vous voulez travailler n'est pas disponible, n'hésitez pas à le signaler sur le Discord !***

Autrement, sélectionnez la résolution la plus proche et vous ajusterez légèrement le style Default plus tard, lorsque vos sous-titres seront presque prêts. Pour cela, dans le **Gestionnaire des Styles**, sélectionnez le style **"Default"** et cliquez sur **"Edition"**.

![](img_tutos/EditeurStyles.PNG)

Laissez les paramètres **"Divers"**, notamment les **"Échelle X%"** et **"Échelle Y%"** qui doivent rester à 100 sous peine d'être rattrapé par la police du bon goût. En revanche, pour adapter votre style à une résolution un peu exotique, n'hésitez pas à changer la taille de la police, mais également celle du contour afin que votre Karaoké reste lisible.

Ce menu peut également vous servir si l'une de vos paroles se retrouve sur deux lignes à un poil d'image près.


#### La synchronisation "simple" (ou *timing*)
On est prêts pour bosser ! Pour toute cette étape, je vous conseille de désactiver le *"Replçage automatique du curseur vidéo au temps de début de la ligne active"* en cliquant sur le bouton ![](img_tutos/IcoAuto.PNG). Ça vous évitera la crise de nerfs.

Le but de cet étape est de synchroniser chaque *ligne* de paroles à l'écran. On ne s'occupera du syllabe-par-syllabe qu'ensuite.

***J'aimerais attirer votre attention sur trois éléments de la "box sous-titres" :***

![](img_tutos/BoxSousTitres.PNG)

*(1) : le temps de début d'apparition de votre sous-titre.*

*(2) : le temps de fin d'apparition de votre sous-titre.*

*(3) : le "CPS" (Character Per Second) de votre sous-titre : le nombre de caractères de votre sous-titre divisé par le nombre de secondes. Il doit être TOUJOURS inférieur à 15.*

Vous l'aurez compris, le but de cet étape, c'est grosso-merdo de renseigner le temps de début d'apparition et de fin d'apparition du sous-titre, en respectant le CPS. 

***Une règle fondamentale du Karaoké Toyunda Mugen est que le Karaoké doit être lisible : ainsi, une ligne de sous-titres apparaîtra  ~1s avant qu'elle ne commence à être chantée.***

*Pour résumer, afin de renseigner chaque ligne, vous allez :*

1°) Lire votre vidéo via le bouton ![](img_tutos/IcoLecture.PNG) en-dessous de la prévisualisation de celle-ci, et faire pause avec ![](img_tutos/IcoPause.PNG). Juste à droite du bouton ![](img_tutos/IcoAuto.PNG).

2°) Vous aurez alors l'information concernant le temps où vous avez fait pause, sous le format *"heure:minute:seconde:centièmeSeconde"*. Recopiez ce temps auquel vous aurez soustrait une seconde dans le "*Temps de début*" de votre ligne concernée. 

3°) Reprenez ensuite la lecture et faites pause peu après la fin du chant de votre ligne courante.

4°) Recopiez le temps où vous avez pause dans le "*Temps de fin*" de votre ligne concernée. 

5°) Sélectionnez la ligne suivante et continuez progressivement votre lecture jusqu'à synchroniser toutes vos lignes ! 

**Notez que si vous progressez trop vite dans votre lecture, le bouton ![](img_tutos/IcoLectureLigne.PNG) vous permet de recommencer la lecture à partir du temps de début d'une ligne. Pratique si vous avez des difficultés avez le curseur sous la prévisualisation de la vidéo ! Vous pouvez aussi utiliser les flèches gauche et droite de votre clavier, qui par défaut vous font respectivement reculer et avancer d'une image au sein de votre vidéo.**

*Si vous êtes un poil perfectionniste, une fois votre synchronisation terminée, vous pouvez utiliser les astuces ci-dessus afin d'ajuster votre premier jet via les "timeplans" : il s'agit de synchroniser les changements de plans de la vidéo avec les sous-titres, le cas échéant. Ça peut éviter des maux de crâne à vos spectacteurs les plus sensibles. L'idée est donc de lire chacun de vos sous-titres, et d'ajuster les temps pour correspondre à l'image près à un changement de plan si cela est possible sans perdre l'avance d'une seconde qui est bien plus importante !*

#### La synchronisation "simple" (ou *timing*)
***À rédiger... Coming soon :D***


### Testez votre Karaoké !

Ouvrez votre lecteur favori et chargez votre vidéo, puis demandez à charger les sous-titres en ajoutant une piste de sous-titre à votre lecteur. Cela vous permettra de tester une dernière fois avant de l'exploiter au sein de Toyunda Mugen.

### Envoyer votre Karaoké (ou pas)

Vous avez la possibilité de partager avec la base *Toyunda Mugen* mais il n'y a aucune obligation à cela. Vous pouvez très bien utiliser votre Karaoké pour vous et c'est tout.

Vous pouvez l'envoyer via [cette page](http://leafa.mahoro-net.org/toyunda-mugen). Un gentil administrateur contrôlera alors votre Karaoké, et si vous avez bien rempli le formulaire, il sera tout propre pour une utilisation dans *Toyunda Mugen*.

Quelques infos sur comment remplir les cases :

* **Pseudo** : Il s'agit de votre pseudo à vous.
* **Vidéo** et **Sous-titre** : Choisissez votre vidéo et votre fichier *ASS* sur votre ordinateur.
* **Langue** : Choisissez la langue du karaoké. Si la langue ne figure pas, contactez quelqu'un sur le Discord [*Le Eden de la Nanami*](https://discordapp.com/invite/a8dMYek).
* **Langue supplémentaire** : Si votre karaoké est en plusieurs langues, comme par exemple l'opening de *Oban Star Racers*, alors précisez-le ici.
* **Type** et **Ordre** : Choisissez un type ainsi qu'un numéro.
* **Titre de l'animé/série/groupe** : Ça devrait être évident.
* **Titre de la chanson** : Ça aussi je crois.
* **Année** : L'année de l'animé, ou de la chanson s'il s'agit d'un karaoké de clip musical.
* **Chanteur** : Le nom du chanteur si vous l'avez. L'ordre est "**prénom** puis **nom**".
* **Tags** : Indiquez des infos supplémentaires : s'il s'agit d'un jeu vidéo, d'un tokusatsu/sentai, etc. Une liste non exhaustive de tags :
	* TAG_SPECIAL : Spécial
	* TAG_GAMECUBE : Gamecube
	* TAG_TOKU : Tokusatsu/Sentai
	* TAG_OVA : OAV
	* TAG_CONCERT : Concert
	* TAG_PARODY : Parodie
	* TAG_HUMOR : Humour
	* TAG_ANIME : Anime
	* TAG_REAL : Non-animé
	* TAG_VIDEOGAME : Jeu vidéo
	* TAG_MOVIE : Film
	* TAG_TVSHOW : Série
	* TAG_SPOIL : Spoilers
	* TAG_LONG : Long (plus de 5 minutes)
	* TAG_PS2 : PS2
	* TAG_PS3 : PS3
	* TAG_PSV : PSVita
	* TAG_PSX : PSOne
	* TAG_PSP : PSP
	* TAG_R18 : Pour adultes
	* TAG_VOCALOID : Vocaloid
	* TAG_XBOX360 : XBOX 360
	* TAG_PC : PC
	* TAG_SEGACD : Mega CD
	* TAG_REMIX : Remix (version alternative, parodique le plus souvent)
* **Compositeur / parolier** : C'est évident. Toujours "**prénom** puis **nom**".
* **Studio d'animation / origine** : Pour un animé, il s'agit d'un studio d'animation, sinon on précise le nom de la boîte de production qui a crée le clip, par exemple.
* **Auteur** : L'auteur du karaoké. Cela peut être vous ou pas, si vous envoyez le kara de quelqu'un d'autre. Il sera ajouté dans le fichier .kara pour référence en tant qu'auteur du karaoké.

Une fois que vous avez choisi d'envoyer, il n'y a plus qu'à attendre que quelqu'un mette à jour la base de Karaokés !