[Version française ci-dessous](#french version)

# English version

## How to create a karaoke

There's a tutorial describing how to make one here :

* [Karaoke Tutorial](docs/french/tutorial.md) (in french for now)

## I already have some karaoke files, I would like to add them to this database

If your files are ready, you can do add them in different ways.

### I don't know how to use git

[Come to our Discord server](https://discord.gg/a8dMYek) (in the #karaoke channel) and we'll see how we can help you upload your files or teach you how to use git.

### I know how to use git

You can either become a member of the database team or send your modifications via git pull requests.

Database team members have write access to this git repository as well as to the FTP server where videos are stored. If you'd like to become part of the team and get absolutely no advantages other than personal satisfaction for contributing to this, read the section below. If you're in the team already, read the following :

- Clone this git repository
- Run the `UpdateVideos` script or bring in your own folder if you've already downloaded it elsewhere.
- Put your new videos in place in that folder
- Make any modification or add new karaoke songs by reusing an already existing `.kara` file as a template.
- If you're adding a new song, remove lines starting with `KID`, `date` and `video`
- [Configure Karaoke Mugen](http://mugen.karaokes.moe/docs/user-guide/configuration/) (in french for now) to use your local git repository and its videos and then validate your folders :

```sh
KaraokeMugen.exe --validate
```

or if you're using Karaoke Mugen's git version :

```sh
npm start -- --validate
```

- If validation returns no errors then you can go on. If it does, verify your `.kara` files.
- Via FTP, upload your videos on Shelter or simply rename them if it only needs renaming.
- Commit & push once your videos are in place on Shelter !

## I want to help maintain the karaoke database

The more we are, the faster we can achieve a fully completed database.

[Let's talk about it on Discord!](https://discord.gg/a8dMYek) (in the #karaoke channel) We welcome everyone with open arms.

Some karaokes need to be verified / retimed when they're clearly not in sync, for example.

If you don't feel like you can do that, we still need some karaokes to be tagged and properly filled up with metadata. It means put in the missing information like the anime's production year, its animation studio, the singer and songwriter(s), etc.

## I need help

Again, [come to the Discord server l'Eden de la Nanami](https://discord.gg/a8dMYek)

And go to the #karaoke channel!


# French version

## Comment créer un karaoké ? 

Nous avons écrit un document à ce sujet que vous trouverez ici :

[Tutorial de karaoké](docs/french/tutorial.md)

## J'ai déjà des karaokés, comment vous les envoyer ?

[Consultez la section sur l'envoi de karaokés](docs/french/upload.md) de la documentation.

## Je veux aider à maintenir la base des karaokés !

C'est sûr que plus on est nombreux, plus ça va vite de maintenir cette base à jour !

[Discutons-en sur Discord](https://discord.gg/a8dMYek). On prend toutes les bonnes volontés !

Il y a notamment des karaokés dont il faut vérifier le titre, mais aussi les paroles.

Si rien de tout cela ne vous botte, il y a toujours le boulot de tag les karaokés, c'est à dire remplir leurs .kara d'informations comme l'année de l'animé, le studio de production, le chanteur ou le compositeur, etc.

## J'ai besoin d'aide !

Venez sur [le discord de l'Eden de la Nanami](https://discord.gg/a8dMYek)

Et dirigez-vous sur le salon #karaoke !
