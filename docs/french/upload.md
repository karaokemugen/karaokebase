# Envoi de votre karaoké à la base

## Je ne sais pas utiliser git

git est un outil de gestion de versions. C'est l'outil le plus adapté pour gérer une base de données comme celle-ci car il permet d'avoir un journal de qui à modifié quoi, quand, et d'être absolument certain d'avoir exactement la même base de karaokés que quelqu'un d'autre.

Chaque modification est archivée et peut être retrouvée. A tout moment, on peut également revenir en arrière si on s'aperçoit qu'on a fait une bétise. Plus d'infos :

- [C'est quoi git](http://putaindecode.io/fr/articles/git/)
- [Tutorial sur git](https://openclassrooms.com/courses/gerez-vos-codes-source-avec-git)
- [Gitkraken](http://www.gitkraken.com) est un excellent outil graphique pour gérer son dépôt git

[Passez sur Discord](https://discord.gg/a8dMYek) (dans le canal #karaoke) et nous verrons comment faire pour ajouter vos karaokés. L'utilisation de git est recommandée cependant.

Si toutefois vous ne souhaitez pas utiliser git pour ajouter vous-même vos karaokés, vous pouvez venir nous voir sur Discord et on s'occupera du reste. Nous avons conscience que tout le monde n'a pas le temps de s'investir.

## Je sais utiliser git

Selon qui vous êtes les choses ne vont pas se passer de la même façon.

### Vous n'êtes pas (encore) dans l'équipe de mainteneurs de Karaoke Mugen

Vous ne souhaitez pas forcément vous investir plus que ça mais vous voulez quand même contribuer.

Sur [la page git de la base](https://lab.shelter.moe/karaokemugen/karaokebase), utilisez le bouton **Fourcher/Fork** pour créer votre propre version de la base et travailler dedans.

Une fois que vous aurez ajouté votre fichier .kara et son fichier .ass à votre base, faites une **pull request** pour la faire ajouter à la base principale (et envoyez un lien vers la vidéo de votre karaoké dans le message de PR)

### Vous êtes déjà mainteneur

Les mainteneurs bénéficient d'un accès au dépôt git de la base ainsi qu'au FTP avec les vidéos. Pour devenir mainteneur il suffit juste de demander sur Discord !

- Uploadez vos vidéos sur Shelter ou renommez-les s'il s'agit simplement d'un changement de nom.
- Ne pushez vos commits qu'une fois les vidéos bien en place !

### Que vous soyez l'un ou l'autre

Vous devez avoir un espace de travail similaire aux autres. La marche à suivre est :

#### Si vous souhaitez avoir tout le dépôt git avec les vidéos chez vous 

- Clonez le dépôt git chez vous
- Placez les vidéos au bon endroit (dans `app/data/videos`, quoi.)

#### Si vous n'avez pas le temps/la place nécessaire pour stocker toutes les vidéos

- Créez un dossier `app/data` dans votre installation de Karaoke Mugen et déposez-y vos fichiers .ass, .kara et vidéo dans les bons dossiers.

#### Ensuite...

- Faites vos modifs, ou ajoutez vos karaokés, en réutilisant un .kara déjà existant comme modèle.
  - S'il s'agit d'un nouveau kara, supprimez les lignes `KID`, `dateadded`, `datemodif`, ainsi que tout ce qui commence par `video`.
  - S'il s'agit d'une modification d'un kara existant, par exemple un renommage, assurez-vous juste que le .kara pointe bien sur les bons fichiers.
- [Configurez Karaoke Mugen](http://mugen.karaokes.moe/docs/user-guide/configuration/) pour utiliser votre dépôt local git avec ses vidéos et générez une nouvelle base avec :

```sh
KaraokeMugen.exe --generate
```

ou si vous utilisez la version git de Karaoke Mugen :

```sh
yarn start --generate
```

- Si la génération ne retourne aucune erreur alors vous pouvez continuer, sinon vérifiez vos fichiers .kara.
- Faites votre commit sous git une fois que vous êtes satisfait
  - S'il s'agit d'un ajout de kara, précisez dans le message de commit le nom complet du ou des karas. Cela permet d'ensuite mieux voir quels ajouts ont été faits d'un mois sur l'autre. Chaque mois [un tag est crée](https://lab.shelter.moe/karaokemugen/karaokebase/tags) pour faire le bilan de ce qu'on a accompli.
- Une fois le commit effectué, pushez votre modification !
- Une série de tests automatique est effectuée par le Lab pour vérifier si votre modification est bonne. Si ce n'est pas le cas, un message d'erreur s'affichera sur Discord dans le canal #karaoke. Vous pouvez également [consulter les derniers **pipelines**](https://lab.shelter.moe/karaokemugen/karaokebase/pipelines) pour voir si le test s'est bien passé ou pas.
  - Si le test ne s'est pas bien passé, ne paniquez pas : quelqu'un vous aidera à y voir plus clair dans le message d'erreur affiché via la console du pipeline.
  - Corrigez l'erreur ou demandez à quelqu'un de la corriger pour vous si vous ne comprenez pas/n'avez pas le temps.
  - Relancez le pipeline ou faites un autre commit.
