# Trouver de quoi faire un karaoké

## Trouver une bonne source vidéo

Il pourrait être tentant d'inclure dans la base la première vidéo **YouTube** qui passe. Cependant, la qualité n'est pas forcément au rendez-vous, ou bien le titre est tout simplement introuvable. Dans le cas d'*animés* récents, il serait même préférable d'inclure une vidéo qui soit *creditless* (sans texte de générique), et au minimum en 720p. Il vous faudra donc une source DVD / Blu-Ray.

**Plusieurs solutions s'offrent à vous :**

### Trouver un *rip* sur les interwebs

Une source d'openings et d'endings est le subreddit [/r/AnimeOpenings](http://reddit.com/r/animeopenings) Pour le reste il y a MasterCa... euh, des sites comme Nyaa ou Asian DVD Club.

### Demander aux potos

Si ce n'est pas déjà fait, rejoignez le Discord [*Le Eden de la Nanami*](https://discordapp.com/invite/a8dMYek) ! Et n'hésitez pas à demander aux habitués du canal *#karaoke* s'ils ont la chanson dans leur base personnelle !

### Faire un rip vous-même

Eh ouais, il faut parfois donner de sa personne. Certains DVD & Blu-Ray français contiennent les génériques sans crédits, mais c'est surtout le cas sur les volumes japonais. Il est possible de s'en procurer via [CD Japan](http://www.cdjapan.co.jp), en occasion sur [Mandarake](https://mandarake.co.jp)  ou encore tout bêtement sur [Amazon Japan](http://amazon.co.jp).

Une fois que vous avez ça, il vous faut un lecteur DVD ou Blu-Ray pour PC, selon le support à ripper *(merci Captain Obvious !)*. 

Pour vous permettre de lire correctement les disques et de copier-coller les flux qui vous intéressent, je vous conseille le logiciel *DVD Fab Passkey* [(site officiel)](http://fr.dvdfab.cn/passkey-lite.htm) ou *MakeMKV* [(site officiel)](http://www.makemkv.com/)

#### Avec DVD Fab

DVD Fab est un logiciel, toujours actif en arrière-plan, qui décode *on-the-fly* (comprendre "à la volée") vos disques vidéo. Après que vous ayez inséré un DVD ou un Blu-Ray protégé dans votre lecteur, il mettra une dizaine de secondes à le déchiffrer.

Vous pourrez ensuite soit le lire directement dans VLC (ou autre lecteur vidéo, je juge pas), soit extraire les flux *m2ts* qui vous intéressent d'un simple copier-coller. Les flux *m2ts* sont situés dans **/BDMV/STREAM/** à partir de la racine de votre disque. N'hésitez pas à identifier les fichiers suivant leur taille, et même à les lire, pour trouver le bon et n'extraire que votre générique fétiche.

**Exemple :** bien que *Kazé* y ait intégré un Karaoké inchantable et non désactivable, l'OP de Chunibyô est le fichier **00005.m2ts** (240Mo) du Blu-Ray français.

#### Avec MakeMKV

L'extraction de votre Blu-Ray ou DVD passe par l'appui sur un simple bouton. **Attention :** par défaut, la durée minimale d'une vidéo est considérée de 120 secondes, et se change dans les options. Comme un générique d'animé dure moins que ça, il faudra aller modifier cette option avant de tenter une extraction sinon *MakeMKV* ne verra pas ce que vous recherchez et ne vous proposera pas d'extraire la vidéo.

La vidéo extraite est un *.mkv* par vidéo. *(Attention à ne pas capturer les épisodes lorsque vous sélectionnez les vidéos à extraire ! Regardez la durée qu'ils font pour deviner s'il s'agit d'un générique).*

#### Dans un cas comme dans l'autre...

Le réencodage est **primordial** car les fichiers extraits de façon brute sont très volumineux. Si on gardait les versions brutes, on aurait une base frôlant le tera-octet très rapidement !

Le disque obtenu et le flux extrait, on va donc le **réencoder** pour le **compresser** un peu, et obtenir un bon vieux fichier **MP4** plutôt qu'un flux *m2ts* ou *VOB*, empacté ou non dans un *MKV*. Y a plusieurs écoles, mais je vous conseille de jeter un œil à [MeGUI](https://sourceforge.net/projects/megui/). 

Vous pouvez aussi utiliser [Handbrake](https://handbrake.fr/) ou si la ligne de commande ne vous effraie pas, [FFMpeg](https://www.ffmpeg.org/).

### Les formats vidéos à respecter

Que vous ayez trouvé une source sur Internet ou que vous ayez effectué une extraction vous-mêmes, vous serez **obligé** de passer par la case réencodage si votre vidéo ne respecte pas les conditions suivantes :

* Votre conteneur doit être le **MP4** ou éventuellement le MKV (mais on privilégie vraiment le MP4). Par pitié, ne nous envoyez pas de AVI : on n'est plus en 2008 !
* Votre codec vidéo est libre, mais on privilégiera le **h264** ou le h265 qui sont les codecs habituels du MP4.
* Vous devrez respecter le tableau de relation ***résolution / bitrate vidéo maximum*** suivant, tout en gardant à l'esprit que si votre générique est plutôt fixe, il peut largement aller en-dessous :

| **Résolution vidéo (axe Y)** | **Bitrate maximum** | **Poids fichier approximatif, pour 1 min 30** |
| -------------------------------- | ---------------------- | ------------------------------------------------------ |
| 4K | 10000 Kbps | 100Mo |
| 1080p | 8000Kbps | 80Mo |
| 720p | 4000Kbps | 40Mo |
| 480p | 3000Kbps | 30Mo |
| 360p | 2000Kbps | 20Mo |

* Votre codec audio est libre, mais on vous encourage à retenir le **AAC** ou le **AC3** et de garder le paramètre de qualité par défaut.

## Trouver les "vraies" paroles

Sujet plus délicat qu'il n'y paraît, tant les transcriptions à l'oreille foisonnent sur Internet. Si plusieurs sources fiables sont d'accord entre elles, on peut se dire que c'est bon. Autrement, il va falloir mener des enquêtes approfondies : bien souvent, en faisant soi-même une transcription à partir du livret officiel du CD où la chanson est parue. L'exercice peut être fastidieux si vous n'avez jamais appris vos kanas japonais, mais reste faisable à l'aide de ce tableau :

![](../img_tutos/TableKana.png)

Si vous ne reconnaissez pas un kanji, le site [Japanese character recognition](http://maggie.ocrgrid.org/nhocr/) peut vous aider à le OCR ("numériser") pour le passer dans Google Traduction ou autre.

***Attention à bien respecter ces règles sur la romajisation des paroles :***

* Dans un Karaoké japonais, les mots non japonais doivent être mis en majuscules pour bien les différencier.
* Les particules doivent être retranscrite wa, wo, he (et non wa, o, e).
* Les voyelles longues comme "ou" sont notées ainsi et non avec un macaron ou un accent circonflexe.
* Ne pas mettre de majuscules au début des phrases (sauf dans un karaoke non japonais).
* Ne pas mettre de ponctuation.
* Mettre une majuscule pour les noms propres.
