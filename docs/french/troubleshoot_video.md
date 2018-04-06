# Les outils et erreurs récurrentes - Fichiers vidéo

## Les outils

Pour faire de l'encodage vidéo, de multiples outils existent.
- **Handbrake** est le plus simple d'utilisation, avec une interface relativement lisible et des options par défaut correctes.
- **MediaCoder** est un peu plus brouillon mais regorge d'options supplémentaires : comme la possibilité de garder certains flux et réencoder d'autres. Attention, il s'agit d'un *freenium* : certaines options ne sont accessibles que via la version payante du logiciel,
- **MeGUI** est beaucoup plus complexe d'utilisation mais optimise les encodages.
- **FFMPEG** est utilisable en ligne de commande, ce qui le rend très puissant mais long à maîtriser.

## Erreurs récurrentes

### Métadonnées faussées

Il est déjà arrivé que des vidéos aient une métadonnée "duration" complètement fausse par rapport à la réalité. Si cela arrive à nouveau, il est possible de régler le problème en recapsulant les flux vidéo et audio concernés dans un container MP4, en utilisant FFMPEG et la ligne de commande suivante :
```ffmpeg -i video_1.mp4 -vcodec copy -acodec copy video_1_fixed.mp4```

### Vidéos beaucoup trop lourdes

Bien qu'un [standard](material.md#les-formats-vidéos-à-respecter) ait été convenu sur le tard afin d'éviter que la base de vidéos ne pèse trop lourd, beaucoup de vidéos ne respectent pas ce dernier. Il faudra donc se servir des outils cités en première partie de ce tutoriel pour faire respecter la loi liant résolution et bitrate. De même, un plan d'extermination des AVI et WEBM sera mené... un jour.

Pour rappel, la convention "SLIMFAST" admet les correspondances suivantes :

| Résolution vidéo (axe Y) | Bitrate maximum | Poids fichier approximatif, pour 1 min 30 |
| -------------------------------- | ---------------------- | ------------------------------------------------------ |
| 1080p | 8000Kbps | 80Mo |
| 720p | 4000Kbps | 40Mo |
| 480p | 3000Kbps | 30Mo |
| 360p | 2000Kbps | 20Mo |
