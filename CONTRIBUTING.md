# Comment créer un karaoké ? 

Nous avons écrit un document à ce sujet que vous trouverez ici :

[Tutorial de karaoké](https://lab.shelter.moe/karaokemugen/karaokebase/blob/master/docs/tutorial.md)

# J'ai des karaokés, je voudrais les voir dans la base de karaokés !

Si vos fichiers sont déjà prêts, vous avez plusieurs solutions.

## Utiliser le formulaire web

Il existe un [formulaire d'envoi des karaokés](http://leafa.mahoro-net.org/karaoke-mugen/) mais celui-ci n'est pas optimal car il demande un travail d'intégration à l'administrateur avant de pouvoir attérir dans la base.

## Utiliser git

Cette partie concerne les mainteneurs de la base de karaokés mais pas que. Si vous n'êtes pas mainteneur de la base, vos corrections sont les bienvenues via des pull requests git.

Les mainteneurs bénéficient d'un accès au dépôt git de la base ainsi qu'au FTP avec les vidéos. Si vous souhaitez devenir mainteneur et ne profiter d'aucun avantage si ce n'est une satisfaction personnelle à contribuer, lisez la section juste en dessous. Si vous êtes déjà mainteneur, continuez :

- Clonez le dépôt git chez vous
- Placez les vidéos au bon endroit (dans videos, quoi.)
- Faites vos modifs, ou ajoutez vos karaokés, en réutilisant un .kara déjà existant comme modèle.
- S'il s'agit d'un nouveau kara, supprimez les lignes `KID`, `dateadded`, `datemodif`, ainsi que tout ce qui commence par `video`.
- [Configurez Karaoke Mugen](http://mugen.karaokes.moe/docs/user-guide/configuration/) pour utiliser votre dépôt local git avec ses vidéos et générez une nouvelle base avec :

```sh
karaokemugen-app --generate
```

- Si la génération ne retourne aucune erreur alors vous pouvez continuer, sinon vérifiez vos fichiers .kara.
- Uploadez vos vidéos sur Shelter ou renommez-les s'il s'agit simplement d'un changement de nom.
- Faites votre commit une fois que vos vidéos sont prêtes !

# Je veux aider à maintenir la base des karaokés !

C'est sûr que plus on est nombreux, plus ça va vite de maintenir cette base à jour !

Discutons-en sur Discord (voir plus bas). On prend toutes les bonnes volontés !

Il y a notamment des karaokés dont il faut vérifier le titre, mais aussi les paroles.

Si rien de tout cela ne vous botte, il y a toujours le boulot de tag les karaokés, c'est à dire remplir leurs .kara d'informations comme l'année de l'animé, le studio de production, le chanteur ou le compositeur, etc.


# J'ai besoin d'aide !

Venez sur [le discord de l'Eden de la Nanami](https://discord.gg/a8dMYek)

Et dirigez-vous sur le salon #karaoke !
