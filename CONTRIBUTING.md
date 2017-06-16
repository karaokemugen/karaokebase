# Comment créer un karaoké ? 

Vous aurez besoin du logiciel AegiSub

Suivez cet excellent guide de SilvoSwordo du Bakaclub : http://caignard.iiens.net/scripts/Guide%20Kara%200.7.pdf

Une copie de ce guide existe dans le dépôt de l'app Toyunda Mugen, dans le dossier docs.

Par ailleurs, si vous envisagez de timer quoi que ce soit, n'hésitez pas à le signaler dans ce document, histoire d'éviter que plusieurs personnes se retrouvent à timer la même chose (valable surtout pour les œuvres récentes, mais pas que…) 

* [Google Doc sur les times en cours](https://docs.google.com/spreadsheets/d/12KY9uAENP0Fwzn3IMQB-Wgd-qgYOjihphnGuSlHJziU/edit#gid=0)

## Consignes générales de nommage du karaoké

Le nommage du karaoké concerne son titre et le nom de la chanson. Cela se voit sur le nom donné au fichier .kara. Le format est le suivant :

Langue - Série/oeuvre - Type - Titre

Exemple : 

```JAP - Macross Frontier - OP2 - LION```

Pour les karaokés de clips musicaux / PV, la partie Série/oeuvre devient "nom du groupe". Exemple :

```FR - Les Inconnus - MV - Vice et versa```

* La langue est en MAJSUCULES, sur 2 à 4 caractères. Langues valides :
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
    * Enrichissez ce document si vous ajoutez de nouvelles langues !
* Le nom de la série doit obligatoirement être un nom facilement reconnaissable. Il faut préférer le nom international s'il existe, ou un nom facilement connu du public. Exemple, si je vous parle de Spice & Wolf, ne soumettez pas votre kara sous le nom "Ôkami to Kôshinryô" sous peine de cassage de genoux. Personne ne connaît cet animé sous ce titre. Même exemple avec Full Metal Alchemist qu'il n'y a pas besoin d'écrire en japonais "Hagane no Renkinjutsushi" parce que PERSONNE de sensé n'irait taper ça dans un moteur de recherche, bande d'élitistes.
    * Par contre, Suzumiya Haruhi no Yuutsu est toléré, car "Suzumiya Haruhi" est facilement reconnaissable et connu du public.
    * Si vous avez ajouté une nouvelle série, mettez à jour le fichier series_altnames.csv dans le dossier racine ! Il contient la liste des noms alternatifs des séries.
* Le type du karaoké peut être l'un des suivants :
    * AMV : Anime Music Video. Peut-être utilisé pour des clips musicaux tout en animation
    * CM : Publicité
    * ED : Ending d'un animé
    * IN : Insert song
    * OT : Autre/inclassable
    * TRAILER : Vidéo promotionnelle (trailer, bande-annonce, etc.)
    * LIVE : Concerts
    * OP : Opening
    * MV : Vidéo musicale (clips musicaux)
* Le numéro de générique : le premier générique d'ouverture sera qualifié d'OP1, etc. 
    * S'il n'y a qu'un seul générique tout le long de la série ou saison, on omet le numéro et on met simplement OP ou ED selon le cas.
    * Attention toutefois : il arrive souvent, notamment en début de série, que des génériques d'ouverture servent exceptionnellement de générique de clôture. Il ne faut pas pour autant qualifier cet OP d'ED1 et l'ED classique d'ED2 ! Exemple avec la série *Kekkai Sensen*, qui n'a qu'un OP et un ED : l'OP sert d'ED au premier épisode, mais le générique d'ouverture doit taggé OP et le générique de cloture ED, et ne pas mettre "ED2" pour le générique de fin 'classique' sous pretexte qu'il y a eu un autre générique pour un seul épisode.  
* Le titre de la chanson, si vous l'avez. Respectez le plus possible son nom (sauf s'il contient des caractères spéciaux.)

Concernant le nommage relatif à la langue japonaise, consultez les consignes relatives à l'écriture d'un karaoké plus bas, notamment sur les accents.

### Les choses à ne pas faire 

* Mettre des caractères spéciaux dans le titre. Genre ! ? / :... Votre système d'exploitation risque de ne pas apprécier
* Mettre des symboles. Les japonais en raffolent, mais les claviers non. Exemple, ils utilisent souvent le signe "multiplier" pour faire une croix (X). Utiliser un x sera bien meilleur; Autre exemple, Macross Delta. Ne mettez PAS le signe delta sous peine de mort imminente.

## Consignes générales d'écriture d'un karaoké

Ces consignes sont reprises de celles du site Karaokes.moe + quelques ajouts : http://www.otak.moe/karaokes-moe/

- Les mots non japonais doivent être mis en majuscules.
	- Dans le cas d'un karaoké dans une autre langue que le japonais, ce n'est pas conseillé.
- Les particules doivent être retranscrite wa, wo, he (et non wa, o, e)
- Les voyelles longues comme "ou" sont notées ainsi et non avec un macron ou un accent circonflexe.
- Ne pas mettre de majuscules au début des phrases (sauf dans un karaoke non japonais)
- Ne pas mettre de ponctuation.
- Mettre une majuscule pour les noms propres.
- Utilisez des vidéos de bonne qualité. 720p minimum, favoriser le Blu-ray Creditless.
- Affichez les sous-titres avec au moins une demi-seconde d’avance. Idéalement 900ms.
- Affichez les sous-titres EN HAUT de l'écran. Pas de sous-titres en bas, ça empêcherait certains de lire votre karaoké !
- Evitez les polices trop fantaisistes ou difficiles à lire. Voici un style de base parfaitement utilisable :
```
Style: Default,Arial,20,&H00FFFFFF,&H000088EF,&H00000000,&H00666666,-1,0,0,0,100,100,0,0,1,3,0,8,10,10,10,1
```
Adaptez bien sûr la taille de la police selon la taille de votre vidéo (si votre .ass n'a pas de paramètre PlayResX/PlayResY)

## Que dois-je fournir ?

- Un fichier de sous-titres .ass contenant votre kara
- Une vidéo au format .avi, .mp4, .webm, .mov ou .mkv

On s'occupe de créer le .kara derrière ainsi que de nommer les fichiers correctement.

## Comment vous envoyer mon kara ?

http://mei.do/toyundamugen

Une fois validé, le karaoké sera ajouté à ce dépôt. Vous pourrez alors le modifier au besoin.

## Et si je veux générer moi-même le .kara ?

Le .kara est un fichier ini de base. Il faut deux infos primordiales :

```
videofile="nom_du_fichier.mp4"
subfile="nom_du_karaoke.ass"
```

Les autres variables optionnelles sont (séparées par des virgules si plusieurs éléments, le tout entouré par des guillemets "") :

Evitez autant que possible les caractères spéciaux dans les noms.

* year= : L'année de production de l'opening. Attention, ce n'est pas l'année de production de la série. Par exemple pour One Piece des openings peuvent avoir des années différentes !
* singer= : Chanteur/euse
* tags= : Série de tags pour caractériser le karaoké comme "Humour", "Animé", "Série TV", etc. Voir plus bas
* songwriter= : Compositeur et/ou parolier
* additional_languages= : Autres langues que celle d'origine. Par exemple Oban Star Racers OP qui est en français et en japonais.
* creator= : Entité créatrice de la vidéo. Par exemple le studio d'animation ou la chaîne de télévision, l'éditeur d'un jeu vidéo, etc.
* author= : Auteur du karaoké.
* series= : Liste séparée par des virgules des séries contenues dans la vidéo. La série est normalement indiquée dans le nom du .kara sauf dans le cas où il s'agit d'une vidéo musicale / clip (dans ce cas le nom du fichier .kara contient le nom de l'artiste). Aussi utile pour les AMVs.

### Tags autorisés 

Si les champs décrits au dessus sont libres, le champ "tags" doit obéir à une nomenclature précise afin de pouvoir être traduits par le logiciel Toyunda Mugen.

* Tokusatsu/Sentai : série TV japonaise de toku ou de sentai
* OAV : Original Animation Video
* Concert : Concert live d'une chanson
* Parodie : Parodie d'une chanson (paroles changées, images changées, etc.)
* Humour : Kara amusant (ou pas.)
* Anime : Série animée. **Par défaut si les tags Jeu vidéo ou Non-anime sont absents.**
* Non-anime : Tout ce qui n'est pas animation (avec des vrais morceaux de gens en 3D dedans.)
* Film : Film (d'animation ou réel)
* Série TV : Série télévisée. **Par défaut si les tags Jeu vidéo ou Film sont absents (ou le type est MV).**
* Spoilers : La vidéo contient des gros spoilers de ouf.
* Long : Vidéo longue. **Automatiquement ajouté si la vidéo dure plus de 150 secondes**
* R18 : Vidéo contenant des images non montrables en publique (du SESKE.)
* Vocaloid : Chansons chantées par des Vocaloid
* Bande-annonce : Trailer, etc.

Tags de support pour les jeux vidéo :

* Gamecube
* PSX
* PS2
* PS3
* PSVita
* PSP
* XBOX 360
* PC

## Je veux aider à maintenir la base des karaokés !

C'est sûr que plus on est nombreux, plus ça va vite de maintenir cette base à jour !

Discutons-en sur Discord (voir plus bas). On prend toutes les bonnes volontés !

## J'ai besoin d'aide !

Venez sur le discord de l'Eden de la Nanami : 

https://discord.gg/a8dMYek

Et dirigez-vous sur le salon #karaoke !
