# juliaworks
documentation perso et travaux divers en lien avec le langage Julia


## LE "WHAT" ?

Ce repo contient un mémo expliquant comment installer Julia sur un poste sous Windows, et comment le configurer pour qu'il puisse se connecter à une base de données DB2 for i.


## LE "WHY" ?

J'ai découvert l'existence du langage Julia dans le courant de l'année 2022. 
Projet récent et Open source, développé par une équipe de chercheurs du MIT, Julia est annoncé comme étant, en résumé :
"... aussi souple d'écriture que du Python, et presque aussi performant que du C...".

Cela m'a intrigué, d'autant que j'ai été confronté à plusieurs reprises à des problématiques de volumétrie - en lien avec des bases de données DB2 for i - pour lesquelles mes langages de prédilection (NodeJS et PHP) n'étaient pas vraiment adaptés. J'ai donc eu envie de tester Julia, et de m'assurer qu'il était possible de le faire dialoguer avec une base de données DB2 for i.

La première documentation fournie dans ce repo est donc un mémo récapitulant les étapes d'installation et de configuration. 


## PREMIERES IMPRESSIONS :

- l'installation et la configuration de Julia est très simple, même quand il faut configurer un proxy, ce qui est souvent le cas en entreprise
- l'utilisation conjointe de Julia et de DB2 for i est très simple également, et le package Dataframes facilite grandement la récuparation des datasets
- le langage Julia a une syntaxe claire et logique, et  un modèle objet simplifié, qui ne devrait pas trop dérouter les développeurs venant de langages comme le RPG

Bref, tous les indicateurs semblent être au vert, il reste maintenant à trouver des cas d'usage pour aider la communauté IBM i à s'approprier ce bel outil qu'est le langage Julia. 


