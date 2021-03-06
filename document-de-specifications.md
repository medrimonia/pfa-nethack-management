## Introduction

Nethack est un jeu vidéo de type rogue-like écrit en C sous
licence libre. Le premier objectif du projet est de fournir un
ensemble applicatif permettant le développement de bot, une
analyse de ses performances. Le second objectif est de définir
des sous-problèmes du jeu et de créer des bots pouvant évoluer
dans les modes de jeux correspondant à ces problèmes, et ainsi
permettre la validation de modèle théorique par leur application
sur le jeu.

## Matériel

* Doit fonctionner sur une architecture de type Unix.


## Modèle conceptuel


Notre travail ne sera pas constitué uniquement d'écriture de code, il
comportera aussi des démarches telles que la production de statistiques
ainsi que l'étude de certains problèmes théoriques. Plusieurs parties
différentes du travail peuvent être identifiées.

### Modifications du noyau nethack
Les règles du jeux n'étant pas les mêmes pour tous les bots, il est
nécessaire d'apporter des modifications au noyau afin de présenter des
versions simplifiées du problème.

### Le simulateur de partie
Un simulateur de partie devra être proposé, il permettra l'exécution de bot
divers. Celui-ci sera en charge de différentes tâches :
* Traduire la sortie de nethack en un langage simplifié et décrit spécifiant
l'état du jeu. Le bot pourra ainsi traiter les informations sans risquer de
faire face à de l'inconnu.
* Répercuter les choix du bot sur la partie en cours d'exécution sur le
noyau. Signaler les erreurs de celui-ci en interrompant la partie le cas
échéant.
* Rejouer des parties.
* Remplir une base de données avec les résultats des parties jouées

### Les bots
Plusieurs bots devront être présentés, ceux-ci recevront l'état actuel de la
partie et prendront une décision puis la transmettront au simulateur de
partie.

### Le replay
La possibilité doit être fournie de pouvoir rejouer des parties en se servant
du simulateur de partie pour revisualiser une partie donnée.

### La base de données
Les résultats des parties devront être stockés dans une base de données afin
de conserver un historique des résultats

### L'outil Statistique
Il est demandé d'écrire un outil statistique permettant de générer des
diagrammes à partir des résultats conservés dans la base de données.

### Production de statistique
L'outil de statistique devra être utilisé pour créer des diagrammes à partir
des quels des observations seront faites sur l'efficacité des bots.

_Schéma d'architecture à ajouter_


## Besoins fonctionnels

### Communication avec NetHack

Le projet doit fournir une interface permettant à des bots de jouer à NetHack. Elle consiste en un programme central assurant la liaison entre le jeu et les différentes parties du projet (bots, base de données, ...).

Cette interface doit arbitrer les échanges entre les différentes parties du projet. Par exemple, elle doit permettre de prouver que les bots ne puissent pas tricher et gérer gracieusement les erreurs provenant des différents programmes intervenants dans la simulation d'une partie.

### Création de 'modes' de jeu

Le projet devra établir au moins un mode de jeu correspondant à une modification du noyau de NetHack, une liste d'ordres permis aux bots, un ensemble de paramètres introduits à l'exécution et d'informations collectées sur une partie. L'ensemble formant un environnent pour la résolution d'un problème isolé du jeu.

Ces modifications devront pouvoir être extraites pour leur permettre d'être réappliquées sur une version originale du jeu. 

Ce système devra permettre d'exécuter des bots sur le(s) mode(s) établis simplement.

### Collecte de statistiques

Le projet devra alimenter une base de données à partir de parties jouées par des bots et des statistiques recueillies. Elles seront utilisées dans un système d'analyse de statistiques. 

Ce procédé devra être formalisé et flexible pour s'adapter aux évolutions des modes de jeu et de l'interface.

### Analyse et présentation des statistiques 

Un outil d'analyse de statistiques devra être livré. Il permettra de comparer entre autres : les performances des bots en termes de taux de réussite et de rapidité de différents algorithmes. Plus généralement, une mesure de pertinence telle que l'écart-type devra être affichée ou intégrée.

Il est souhaitable qu'il intègre un outil générant des graphiques pour une interprétation plus aisée.

### Outil de replay

Pour le débogue des bots, il est souhaitable de disposer d'un outil permettant de rejouer une partie; soit passivement pour identifier une erreur dans l'algorithme d'un bot; soit activement pour permettre de tester une correction dans l'algorithme d'un bot dans une situation où il avait échoué.

## Démarches et études

Le projet devra se baser sur l'étude de problèmes spécifiques liés au jeu
Nethack. L'objectif attendu par le client n'est pas de fournir des bots étant
capable de jouer à Nethack, mais au contraire de mettre en place un cadre
d'étude de sous-problèmes pouvant être révélés par l'étude du jeu.

Chaque sous-problème sera lié à un "mode" de jeu, c'est-à-dire un
environnement - défini de façon formelle - dans lequel pourront évoluer des
bots spécifiques.
Cet environnement est défini par :
* un jeu d'actions autorisées pour les bots (ce jeu d'action est un
  sous-ensemble du jeu d'action de base)
* la suppression de certaines contraintes telles que la faim, les pièges, etc.
* un sous-ensemble de statistiques prélevée
* un ensemble de paramètre servant à l'évaluation
* des conditions de fin de jeu

Les sous-problèmes suivant feront l'objet d'une étude formelle :
* Exploration d'un niveau
* Recherche de portes secrètes
* Combat

Chaque problème fera l'objet d'une approche algorithmique et probabiliste.

### Recherche de portes secrètes

Dans le jeu original, une action permet d'effectuer des recherches dans
l'environnement du personnage. Cette recherche peut entrainer la découverte de
portes secrètes ou de passages secrets. Plusieurs études liées à cette
particularité du jeu peuvent être effectuées :
* Avec limite de temps :
	* Comment trouver le plus de portes cachées, le plus vite possible ?
	* Comment trouver le plus de portes cachées, dans la limite de temps donnée ?
	* etc.
* Sans limite de temps :
	* Comment mettre le moins de temps possible pour trouver toutes les portes ?
	* etc.

Le mode de jeu correspondant à la recherche des portes secrètes est défini
selon les contraintes suivantes :
* Les actions autorisées par le personnage sont limitées aux déplacements, à
  l'action de recherche, à l'ouverture de portes, au changement de niveau.
* Les contraintes suivantes sont supprimées :
	* la faim,
	* les pièges,
	* les monstres,
	* les objets.
* Les statistiques suivantes sont prélevées :
	* nombre total de portes secrètes,
	* nombre de portes secrètes trouvées,
	* nombre de tours total,
* La proportion des portes secrètes trouvées et le temps mis pour trouver ces
  portes seront évalués.
* La fin du jeu aura lieu après une limite de temps donnée ou une fois que
  toutes les portes secrètes auront été trouvées.


### Exploration d'un niveau

Ce problème correspond au problèmes de recherche de la sortie d'un labyrinthe.

Différents points peuvent être étudiés :
* Comment sortir le plus rapidement d'un niveau ?
* Comment sortir du niveau en ayant exploré le plus de cases possibles ?
* etc.

## Besoins non fonctionnels

Nous avons identifié les spécifications suivantes en terme de contraintes logicielles non fonctionnelles.

### Choix des sous-problèmes étudiés

* Les bots sont spécialisés dans la résolution d'un problème précis. L'objectif n'est pas de créer un programme sachant jouer à NetHack dans sa version originale.
* Les sous-problèmes étudiés doivent être suffisamment vastes pour envisager plusieurs approches possibles.

### Modifications noyau

* Les modifications devront être minimales et justifiées. Des modifications locales d'un nombre de lignes limités sont attendues sous la forme d'un fichier diff.
* Les modifications doivent répondre à un besoin d'exécution et ne doivent pas permettre aux bots de tricher.
* L'ensemble logiciel doit pouvoir être installé facilement ; si des dépendances extérieures ont été nécessaires, elles doivent être listées et leur installation documentée.

### Interface et création de bots

* L'interface doit permettre d'introduire de nouveaux bots aisément. Pour cela, le protocole de communication entre le bot et l'interface doit être spécifié. Des "starter packs" dans différents langages devront être fournis pour illustrer la démarche de création d'un bot.
* Elle doit permettre de simuler de façon autonome un grand nombre de parties.
* La stratégie employée par les bots doit être explicite. Leur fonctionnement doit soit pouvoir être déduit de leur code, soit documenté par ailleurs.

### Interprétation des statistiques et validation des stratégies

* Le déroulement de parties doit fournir des statistiques, dans un format lisible et standard.
* La production statistique doit pouvoir permettre de valider ou d'infirmer la pertinence de choix stratégiques des bots.
* La différence de performance entre les bots doit pouvoir être expliquée à l'aide de raisonnements ou d'exemples.                                                                                                 

## Sous-ensemble et priorités d'implémentation

* Étudier le code source de NetHack et identifier les mécanismes de créations d'objets, de monstres, etc., afin d'évaluer la difficulté de création des modes.
* Fournir un moyen de communication entre les bots, le jeu et un système de collecte de données sur les parties jouées.
* Fournir une première version (éventuellement instable) présentant l'ensemble des fonctionnalités.
* Produire des statistiques sur les données collectées.
* Mettre en place au moins deux starter packages dont un en python
* Développer la fiabilité du logiciel et fournir des versions améliorées des bots.
* Être capable d'avoir un certain contrôle sur la génération de niveaux adaptés aux problèmes à résoudre.
* Le développement d'autres modes et d'autres bots se fera pendant le temps restant.

**Diagramme de Gantt à ajouter**


##Information de maintenance

* De nouveaux modes pourront être ajoutés plus tard dans la vie du logiciel, il convient donc de faire attention à rester libre à l'ajout de mode et de faciliter la création de ceux-ci.
* De nouveaux bots dans d'autres langages sont susceptibles d'être développés, écrire un starter package doit donc rester simple.


## Glossaire

* Starter package : Bot volontairement simpliste pouvant servir de base à la création d'un bot sans avoir à réimplémenter les entrées/sorties avec l'interface.
* Mode : Configuration spécifique du jeu adaptée à un problème précis. Comprend :
    * Un ensemble de modifications du noyau
    * Un jeu d'actions possibles avec certaines règles
    * Un ensemble de paramètre servant à l'évaluation
    * Des conditions de fin de jeu
* Rogue-like : jeu inspiré du jeu vidéo "Rogue". Le joueur incarne un
aventurier explorant des souterrains dans lesquels il affronte des monstres
tout en se frayant un chemin vers les niveaux inférieurs.
* Bot : programme informatique automatisant des actions dans un jeu ou
simulant un joueur humain
