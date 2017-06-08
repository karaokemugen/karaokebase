# Comment créer un karaoké ? 

Vous aurez besoin du logiciel AegiSub

Suivez cet excellent guide de SilvoSwordo du Bakaclub : http://caignard.iiens.net/scripts/Guide%20Kara%200.7.pdf

Une copie de ce guide existe dans le dépôt de l'app Toyunda Mugen, dans le dossier docs.

## Consignes générales de nommage du karaoké

Le nommage du karaoké concerne son titre et le nom de la chanson. Cela se voit sur le nom donné au fichier .kara. Le format est le suivant :

Langue - Série - Type - Titre

Exemple : 

```JAP - Macross Frontier - OP2 - LION```

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
    * JPOP : Cas spécial, utilisé pour les clips de J-Music (va être abandonné prochainement)
    * Enrichissez ce document si vous ajoutez de nouvelles langues !
* Le nom de la série doit obligatoirement être un nom facilement reconnaissable. Il faut préférer le nom international s'il existe, ou un nom facilement connu du public. Exemple, si je vous parle de Spice & Wolf, ne soumettez pas votre kara sous le nom "Ôkami to Kôshinryô" sous peine de cassage de genoux. Personne ne connaît cet animé sous ce titre. Même exemple avec Full Metal Alchemist qu'il n'y a pas besoin d'écrire en japonais "Hagane no Renkinjutsushi" parce que PERSONNE de sensé n'irait taper ça dans un moteur de recherche, bande d'élitistes.
    * Par contre, Suzumiya Haruhi no Yuutsu est toléré, car "Suzumiya Haruhi" est facilement reconnaissable et connu du public.
* Le type du karaoké peut être les suivants :
    * AMV : Anime Music Video. Peut-être utilisé pour des clips musicaux tout en animation
    * ANIMETAL OP : Opening style Animétal
    * CLIP : Clip musical, pour tous les clips avec des personnes en 3D (opposé à de l'animation 2D)
    * CM : Publicité
    * ED : Ending d'un animé
    * GAME AMV : AMV de jeu vidéo (contient de l'animation 2D)
    * GAME ED : Ending de jeu vidéo
    * GAME IN : Insert song de jeu vidéo
    * GAME OP : Opening de jeu vidéo
    * GAME OT : "Autre" de jeu vidéo (images du jeu sur de la musique par exemple)
    * GAME PV : Vidéo promotionnelle de jeu vidéo (trailer, bande-annonce, etc.)
    * GC GAME OP : Exemple d'opening de jeu version Gamecube. Utile quand préciser le support du jeu est nécessaire pour le diférencier.
    * IN : Insert song d'un animé
    * IN LIVE : Insert song d'une série TV live (avec des vrais gens en 3D dedans.)
    * LIVE : Concerts
    * MOVIE ED : Ending de film d'animation
    * MOVIE ED LIVE : Concert de fin de film d'animation
    * MOVIE IN : Insert song de film d'animation
    * MOVIE IN LIVE : Insert song de film live (avec des vrais gens en 3D dedans.)
    * MOVIE OP : Opening de film d'animation
    * OAV ED : Ending d'OAV
    * OAV OP : Opening d'OAV
    * OP : Opening d'animé
    * OP LIVE : Opening d'animé (version concert live)
    * OT : Autre / inclassable
    * PV : Vidéo promotionnelle
    * R18 GAME OP : Opening d'un jeu interdit aux mineurs
    * REMIX ED LIVE : Parodie live d'un ending d'animé.
    * REMIX GAME OP : Parodie d'un opening de jeu vidéo.
    * REMIX OP : Parodie d'un opening d'animé
    * REMIX OP LIVE : Parodie live d'un opening d'animé.
    * SPECIAL ED : Ending d'animé spécial
    * SPECIAL OP : Opening d'animé spécial
    * THEME : Thème musical
    * TOKU OP : Opening de tokusatsu / sentai
    * VOCA : Chanté par des vocaloid
    * VOCA AMV : AMV d'une série chantée par du vocaloid
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
- Afficher les sous-titres avec au moins une demi-seconde d’avance. Idéalement 900ms.
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

Une fois validé, le karaoké sera ajouté à ce dépôt.

## Et si je veux générer moi-même le .kara ?

Le .kara est un fichier ini de base. Il faut deux infos primordiales :

```
videofile="nom_du_fichier.mp4"
subfile="nom_du_karaoke.ass"
```

Les autres variables optionnelles sont (séparées par des virgules si plusieurs éléments) :

* year= : L'année de production de l'opening. Attention, ce n'est pas l'année de production de la série. Par exemple pour One Piece des openings peuvent avoir des années différentes !
* singer= : Chanteur/euse
* tags= : Série de tags pour caractériser le karaoké comme "Humour", "Animé", "Série TV", etc.
* songwriter= : Compositeur et/ou parolier
* additional_languages= : Autres langues que celle d'origine. Par exemple Oban Star Racers OP qui est en français et en japonais.
* creator= : Entité créatrice de la vidéo. Par exemple le studio d'animation, la chaîne de télévision, etc.
* author= : Auteur du karaoké.

## Je veux aider à maintenir la base des karaokés !

C'est sûr que plus on est nombreux, plus ça va vite de maintenir cette base à jour !

Discutons-en sur Discord (voir plus bas). On prend toutes les bonnes volontés !

## J'ai besoin d'aide !

Venez sur le discord de l'Eden de la Nanami : 

https://discord.gg/a8dMYek

Et dirigez-vous sur le salon #karaoke !
