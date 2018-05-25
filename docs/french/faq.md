# La bonne grosse FAQ

* ***À compléter au fil des questions posées :D***

## Erreur type "Failed unique constraint KID"

Deux karas dans votre base contiennent le même KID. Il s'agit d'un identifiant unique qui doit être **vraiment unique** au sein de votre base de karas. Vérifiez les derniers karas que vous avez ajoutés / modifiés, et recherchez leur KID dans tous les autres karas (l'outil de recherche de votre OS, ou un simple `grep` peuvent vous aider) pour trouver le coupable.

Cela peut arriver si vous avez repris un .kara existant pour un nouveau karaoké et que vous avez oublié de supprimer sa ligne `kid=`

## Erreur type "Media file not found"

Vérifiez bien que votre vidéo existe et qu'elle porte le bon nom. Méfiez-vous des minuscules/majuscules. Si vous êtes absolument certain que c'est OK mais que ça marche toujours pas, renommez le fichier sous un autre nom puis renommez le encore avec son vrai nom : des caractères parasites peuvent parfois se faufiler et apparaître comme des espaces mais ne sont pas considérés comme de vrais espaces !