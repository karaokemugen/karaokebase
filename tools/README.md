# Karaoke Mugen Base Tools

These are scripts used for base maintenance and other utilities.

There are also a [bunch of code snippets](https://lab.shelter.moe/karaokemugen/karaokebase/snippets) you might want to take a look at.

## delay.sh

Adds a 1 second delay at the beginning of a line in ASS files. This allows them to appear a bit before the line is to be sung.

This modification is usually applied by timers individually using AegisSub during karaoke timing, but this Bash script allows to run this on many .ass at once.

## export_karaokesmoe.php

Script by @Keul & @nah to export a Postgres Karaoke Mugen database into [AnimeOpening](https://github.com/AniDevTwitter/animeopenings) names.php file.

## Preset_handbrake_karaoke.json

Handbrake preset for encoding videos correctly.

## assStyleCheck

Checks for any missing styles in ASS files (styles not declared but used in Dialogue sections)

## anidb_importer

Imports anidb's XML from its web API and writes a single series.json file

## romajisplit.html

Util by @Ziassan to split a romaji text into different syllables, adding a separator

## changelog.js

Create changelog for CHANGELOG.md. Supply a year-date to make it work.

Example : `node changelog.js 2019-09` or `node changelog.js 2019-09 file.txt`
