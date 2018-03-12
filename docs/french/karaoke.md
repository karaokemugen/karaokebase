# Se lancer

## Réaliser le karaoké en lui-même 

### L'espace de travail

En ouvrant **Aegisub**, vous tombez tout d'abord sur une interface quasiment vide. Avant de se mettre au boulot, il faut la remplir.

Tout d'abord, allez dans **"Vidéo > Ouvrir une vidéo"**, et sélectionnez votre vidéo pour l'ouvrir. Puis, ouvrez votre fichier texte via **"Fichier > Ouvrir des sous-titres"** ou le bouton ![](../img_tutos/IcoOuvrir.PNG).

Vous devriez donc avoir un écran similaire au mien, où je suis en train de réaliser le Karaoké de l'OP2 de *BTOOOM!*

**Il peut y avoir deux différences, en rapport avec l'audio :**

* Si vous n'avez pas la bande audio en haut à droite de l'écran, et si vous n'avez pas de son en jouant votre vidéo via le bouton ![](../img_tutos/IcoLecture.PNG), alors le son n'est pas chargé. Remédiez-y via **"Audio > Ouvrir l'audio de la vidéo"**.

* Si vous n'avez pas le même type de bande audio, c'est normal ! Et je vous conseille d'y remédier en cliquant sur l'icône ![](../img_tutos/IcoSpectre.PNG). Ce type de représentation est plus explicite.

![](../img_tutos/Ecran01.PNG)

Si tout est bon, faites **"Fichier > Enregistrer les sous-titres sous..."** afin de créer un fichier *ASS* (sous-titres) et non plus de *texte plat*. Nommez votre fichier *ASS* avec le même nom que choisi précédemment pour votre karaoké. Par exemple **JAP - Macross Frontier - OP2 - LION.ass**

### Les styles de sous-titres

Il vous faudra ensuite intégrer le "style" de sous-titres *Karaoke Mugen* à votre script. Pour cela, l'idéal est de commencer par définir la résolution de la vidéo au sein du script en allant dans le menu **"Fichier > Propriétés"**, puis de cliquer sur le bouton **"De la vidéo"**.

Retournez ensuite sur Lab Shelter dans [**/docs/samples_lyrics/**](../sample_lyrics) pour télécharger le script correspondant à votre résolution de vidéo, si vous ne l'avez pas déjà sur votre machine.

Ensuite, allez dans **"Sous-titres > Gestionnaires de style"**. Cliquez sur **"Importer depuis un script"** et sélectionnez le fichier téléchargé correspondant à votre résolution. Importez le style **"Default"** en cochant la case à sa gauche puis en cliquant sur **"OK"**, confirmez que vous voulez *remplacer le style existant*, et c'est bon !

***Si la résolution sur laquelle vous voulez travailler n'est pas disponible, n'hésitez pas à le signaler sur le Discord !***

Autrement, sélectionnez la résolution la plus proche et vous ajusterez légèrement le style Default plus tard, lorsque vos sous-titres seront presque prêts. Pour cela, dans le **Gestionnaire des Styles**, sélectionnez le style **"Default"** et cliquez sur **"Edition"**.

![](../img_tutos/EditeurStyles.PNG)

Laissez les paramètres **"Divers"**, notamment les **"Échelle X%"** et **"Échelle Y%"** qui doivent rester à 100 sous peine d'être rattrapé par la police du bon goût. En revanche, pour adapter votre style à une résolution un peu exotique, n'hésitez pas à changer la taille de la police, mais également celle du contour afin que votre Karaoké reste lisible.

Ce menu peut également vous servir si l'une de vos paroles se retrouve sur deux lignes à un poil d'image près.

### La synchronisation "simple" (ou *timing*)

On est prêts pour bosser ! Pour toute cette étape, je vous conseille de désactiver le *"Replaçage automatique du curseur vidéo au temps de début de la ligne active"* en cliquant sur le bouton ![](../img_tutos/IcoAuto.PNG). Ça vous évitera la crise de nerfs.

Le but de cet étape est de synchroniser chaque *ligne* de paroles à l'écran. On ne s'occupera du syllabe-par-syllabe qu'ensuite.

***J'aimerais attirer votre attention sur trois éléments de la "box sous-titres" :***

![](../img_tutos/BoxSousTitres.PNG)

*(1) : le temps de début d'apparition de votre sous-titre.*

*(2) : le temps de fin d'apparition de votre sous-titre.*

*(3) : le "CPS" (Character Per Second) de votre sous-titre : le nombre de caractères de votre sous-titre divisé par le nombre de secondes. Il doit être TOUJOURS inférieur à 15.*

Vous l'aurez compris, le but de cet étape, c'est grosso-merdo de renseigner le temps de début d'apparition et de fin d'apparition du sous-titre, en respectant le CPS.

***Voici les étapes afin de renseigner chaque ligne :***

1. Lisez votre vidéo via le bouton ![](../img_tutos/IcoLecture.PNG) en-dessous de la prévisualisation de celle-ci, et faites pause avec ![](../img_tutos/IcoPause.PNG). Juste à droite du bouton ![](../img_tutos/IcoAuto.PNG). Vous aurez alors l'information concernant le temps où vous avez fait pause, sous le format *"heure:minute:seconde:centièmeSeconde"*.
1. En étant placé sur la bonne ligne, maintenez *CTRL+3* pour que ce temps devienne celui du début de votre ligne.
1. Reprenez ensuite la lecture et faites pause à la fin du chant de votre ligne courante.
1. En étant placé sur la bonne ligne, maintenez *CTRL+4* pour que ce temps devienne celui de la fin de votre ligne.
1. Sélectionnez la ligne suivante et continuez progressivement votre lecture jusqu'à synchroniser toutes vos lignes !

**Notez que si vous progressez trop vite dans votre lecture, le bouton ![](../img_tutos/IcoLectureLigne.PNG) vous permet de recommencer la lecture à partir du temps de début d'une ligne. Pratique si vous avez des difficultés avec le curseur sous la prévisualisation de la vidéo ! Vous pouvez aussi utiliser les flèches gauche et droite de votre clavier, qui par défaut vous font respectivement reculer et avancer d'une image au sein de votre vidéo.**

*Si vous êtes un poil perfectionniste, une fois votre synchronisation terminée, vous pouvez utiliser les astuces ci-dessus afin d'ajuster votre premier jet via les "timeplans" : il s'agit de synchroniser les changements de plans de la vidéo avec les sous-titres, le cas échéant. Ça peut éviter des maux de crâne à vos spectacteurs les plus sensibles. L'idée est donc de lire chacun de vos sous-titres, et d'ajuster les temps pour correspondre à l'image près à un changement de plan si cela est possible sans perdre l'avance d'une seconde qui est bien plus importante !*

### La synchronisation "par syllabe" (ou *time en k*)

C'est bon, toutes vos lignes sont synchronisées au petits oignons ? Parfait, le vrai *fun* commence ! Car un vrai Karaoké, c'est aussi guider vos potes qui ne connaissent pas la chanson, il est temps de réaliser la synchronisation syllabe-par-syllabe de vos lignes !

**L'idée**, c'est d'afficher d'abord votre ligne de sous-titre en orange, puis de mettre les syllabes en blanc au rythme de la chanson. Pour ça, on va utiliser des **balises**, ou plus précisément des balises ***{\k}***. Si vous êtes un newbie complet en informatique, je vous laisse consulter la [page Wikipédia](https://fr.wikipedia.org/wiki/Langage_de_balisage) qui saura mieux vous définir que moi ce qu'est une balise.

Chaque syllabe de nos lignes de Karaokés sera donc séparée par une balise {\kX}, où "X" est le nombre de centièmes de seconde s'écoulant avant l'affichage en orange de tout le texte suivant la balise, et ce jusqu'à la suivante (le cas échéant). Concrètement, ça signifie que ma première ligne de Karaoké va passer de "**akaku somatta rashinban**" à quelque chose comme ""**{\k92}{\k11}a{\k26}ka{\k19}ku {\k24}so{\k24}mat{\k23}ta {\k11}ra{\k23}shi{\k28}n{\k23}ba{\k13}n**".

**Ne prenez pas peur !** Je vous vois imaginer devoir mesurer avec minutie chaque centiseconde de chaque parole, mais n'ayez crainte : Aegisub dispose d'un **Assistant Karaoké** ! Et on va l'activer immédiatement en appuyant sur ![](../img_tutos/IcoKaraoke.PNG).

Vous constaterez alors deux changements dans votre interface, en haut à droite : votre texte apparaît maintenant mot-par-mot sur votre spectre sonore, et ce même texte pré-découpé apparaît en bas du-dit spectre. Vous remarquerez au passage qu'il est possible d'effectuer un zoom horizontal et/ou vertical du spectre via les ascenseurs à droite de ce dernier. N'hésitez pas à en abuser selon le contexte.

![](../img_tutos/Ecran02.PNG)

La première étape pour *timer en k* une ligne via l'assistant Karaoké, c'est **délimiter les syllabes**. Pour ça, on va concentrer sur notre ligne recopiée en-dessous du spectre audio. Si vous placez votre souris dessus, vous verrez un curseur sur le long de la case. C'est donc sur cette partie de l'écran que vous délimiterez les syllabes, en cliquant à chaque intersection vous semblant nécessaire.

Quelques règles pour se faire :

![](../img_tutos/TableKana.png)

* Dans le cas de Karaokés japonais, on entend par "syllabe" l'équivalent d'un Kana (voir tableau ci-dessous).

* Dans le cas de lettres dédoublées *(ex : somatta)*, deux solutions selon ce qu'on entend : soit on découpe **"so | mat | ta"** si on estime que le "*a*" n'est pas prononcé deux fois, soit **so | ma | t | ta** dans le cas inverse. Le "*t*" seul servira alors à marquer la 2e prononciation du a.

* On peut admettre que certaines syllabes sont parfois difficiles à distinguer les unes des autres. Ne pas hésiter, dans certains cas, à en englober deux d'un coup (ex : **"shin"** devrait être découpé en **"shi | n"** mais on peut admettre que non).

* ***IMPORTANT :*** il faut placer une découpe tout au début de votre phrase pour représenter la seconde "d'attente" avant que votre phrase ne commence à être chantée. On y reviendra.

*Allez, un petit exemple pour la route :* ![](../img_tutos/ExTimeK.PNG)

Une fois que votre découpe vous satisfait, vous pouvez cliquer sur ![](../img_tutos/IcoTimeOK.PNG). En revanche, si vous vous trompez sur une seule découpe, vous êtes obligé d'effacer l'intégralité de la découpe de la ligne via ![](../img_tutos/IcoTimeNOK.PNG).

Une fois validé, vous voyez quelques changements sur l'interface : le découpage syllabique est effectué sur le spectre, là où vous l'avez effectué plus tôt, et des balises **{\k}** ont été générées avec des temps plus ou moins aléatoires.

![](../img_tutos/Ecran03.PNG)

La première chose à faire alors, c'est de modifier manuellement la première balise *k* via l'interface texte, et la passer de **"{\k0}"** à **"{\k100}"** Ou une valeur différente, si vous avez fait le malin. **L'astuce**, c'est de retirer ensuite un peu plus de cent centièmes de seconde à toutes les balises suivantes, puisque Aegisub a généré des temps aléatoires pour un total correspondant tout de même à la durée de la ligne active.

Ensuite, il ne vous reste plus qu'à, à l'oreille via les boutons ![](../img_tutos/IcoLecture.PNG), ![](../img_tutos/IcoPause.PNG) et ![](../img_tutos/IcoLectureLigne.PNG) que vous connaissez déjà par cœur, et via le spectre audio... À faire joujou avec les lignes jaunes pointillées du spectre pour faire correspondre chaque zone de ce dernier à une syllabe ! Notez qu'une barre blanche s'affiche lors de la lecture pour vous indiquer ou en est la vidéo, mais qu'elle ne reste malheureusement pas affichée lors de la pause.

N'hésitez pas à utiliser les flèches droite et gauche du clavier lorsque vous êtes sur le spectre audio pour bien réécouter chaque syllabe, et ajuste les lignes jaunes avec précision.

Cette étape est longue et laborieuse, et vous ne serez pas forcément en rythme lors de vos premières réalisations, mais ne perdez pas espoir : la rapidité comme la précision viennent à force d'entraînement. Promis juré, petit scarabée.

#### Pour les Karaokés non-japonais

Les langues latines ayant des coupes moins franches au niveau du découpage par syllabe, il se peut que vous préfériez un remplissage "progressif" de la couleur blanche sur la couleur orange. Parfait : la balise **{\kf}** est là pour ça !

Une fois l'intégralité de votre Karaoké timé selon le processus ci-dessus, allez dans **"Edition > Rechercher et remplacer"**, et cherchez **"{\k"** (oui oui, sans fermer le crochet) pour le remplacer par **"{\kf"** (idem, ne fermez pas le crochet). Cliquez sur **"Remplacer tout"** et hop, la magie opère et votre Karaoké a désormais un remplissage syllabique progressif ! C'est beau.

### Autres types de balises

Si vous corrigez certains Karaokés, vous pourrez trouver d'autres balises. La liste ci-dessous répertorie les plus fréquentes et n'est en rien exhaustive. Contrairement à celle du [site officiel Aegisub (en anglais)](http://docs.aegisub.org/3.2/ASS_Tags/).

* **{\fad(xxx,yyy)}** : cette balise indique un temps d'apparition et/ou disparition progressif du texte le suivant. **"xxx"** étant le temps d'apparition et **"yyy"** le temps de disparition. Les temps sont une fois encore, en centièmes de seconde.

* **{\anX}** : cette balise change le "point d'attache" des lignes de sous-titres. Le point d'attache est originellement défini dans le style de la ligne active, mais peut aussi être changé au sein de celle-ci via cette balise. "X" dépend de là où vous voulez faire appararaître votre sous-titre, selon la grille ci-dessous. Dans le style Karaoke Mugen, il est par défaut *8*, mais ce peut être différent sur de vieux Karaokés !

![](../img_tutos/PointAttache.PNG)

* ***Liste à compléter au fil des demandes récurrentes***

### Application du script

***Une règle fondamentale du Karaoké Karaoke Mugen est que le Karaoké doit être lisible : ainsi, une ligne de sous-titres apparaîtra  ~1s avant qu'elle ne commence à être chantée.***

Une fois la synchronisation terminée, il suffit d'appliquer un script, qui permettra à la fois de faire apparaître chaque ligne 1 seconde plus tôt et d'ajouter un effet de fondue aux phrases.

1. Insérez une ligne tout en haut : *clic droit > Insérer (avant)*
1. Mettez dans le champ *Texte* le code suivant : ```!retime("line",($lstart<1000) and -$lstart or -1000,100)!{\fade(255,0,255,0,!($lstart<1000) and ($lstart-150) or 850!,!1000 + $ldur!,!1100 + $ldur!)\k!($lstart<1000) and ($lstart-100)/10 or 90!}```
1. Ajoutez ceci dans le champ *Effet* : ```template pre-line all keeptags```
1. Cochez "Commentaire"
1. Appliquez-le en allant dans : Automatisme > Appliquer le modèle karaoké

Si tout est bon vous obtenez ça : ![Capture_d_écran_2017-09-24_à_14.18.26](/uploads/c8a24da60f1178ec1208e0c674c8d340/Capture_d_écran_2017-09-24_à_14.18.26.png) (réparer la capture d'écran)