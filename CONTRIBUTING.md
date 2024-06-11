# contributing

## How to create a karaoke

There's a tutorial describing how to make one here :

* [Karaoke Tutorial](https://docs.karaokes.moe/contrib-guide/)

**Remember to follow this repository's karaoke making rules**

* [See rules on the wiki](https://gitlab.com/karaokemugen/bases/karaokebase/-/wikis/rules)

## I already have some karaoke files, I would like to add them to this database

If your files are ready, you can add them in different ways.

### I just want to send my files and let you handle the rest

You can use [our submission form](https://kara.moe/import). Please fill in all fields if possible so we won't have to search for the data ourselves, unless you don't know of course.

### I can use git and would like to contribute to the database myself

You can either become a member of the database team or send your modifications via git pull requests.

Database team members have write access to this git repository as well as to the FTP server where videos are stored. If you'd like to become part of the team and get absolutely no advantages other than personal satisfaction for contributing to this, read the section below. If you're in the team already, read the following :

* [Download and install Karaoke Mugen](http://mugen.karaokes.moe)
* Make any modification or add new karaoke songs by using the System Panel interface in Karaoke Mugen.
* Commit & push using the Karaoke Mugen git tool in System Panel. It'll also push any new or modified media to the FTP.

## I want to help maintain the karaoke database

The more we are, the faster we can achieve a fully completed database ~~and world domination through karaoke~~.

[Let's talk about it on Discord!](https://karaokes.moe/discord) (in the #karaoke channel) We welcome everyone with open arms.

Some karaokes need to be verified / retimed when they're clearly not in sync, for example. Sometimes we also change a time's style to meet our visibility standards (we remove special effects, weird, fantasy fonts, etc.)

If you don't feel like you can do that, we still need some karaokes to be tagged and properly filled up with metadata. It means put in the missing information like the anime's production year, its animation studio, the singer and songwriter(s), etc.

## I need help

Again, [come to the Discord server](https://karaokes.moe/discord)

And go to the #karaoke channel!

## For the maintainers

CI is automatic at each push, you may want to skip some steps if they are not useful in the context:

* If you change files that are not the database (such as these .md documents), you can append `[skip-ci]` to your commit message to skip database deploy.

