# Compte rendu de la réunion exceptionnelle avec le RP et le client du 03/12/2012

## Commentaire sur la demande du client et du RP d'opérer un changement de direction

* Le RP insiste sur le fait que cette demande a du sens et espère qu'il n'y a
pas de malentendu.
* Il est normal de substituer du code par un autre code : essayer d'être au plus
près d'où l'API se connecte.
* Cette substitution de code est en corrélation avec notre architecture de
projet

## Discussion au sujet de la communication entre le bot et le jeu

Pourquoi s'embêter à réinventer un langage pour la communication des bots
alors qu'il est possible de reprendre celui déjà existant ?

Question d'Arthur : est-il judicieux de faire un traducteur en "langage bot" ou pas ?
Doit-on manipuler des "ordres bots" ou des caractères ?

Réponses des RP et client :

* Les plus du langage complexe bot :
	* lisibilité et compréhension facile pour un humain ;
	* vérification des cas d'erreur intégré au langage ;
	* avoir des logs qui servent de replay (même s'il est possible de séparer
	  log et replay) ;
	* extensible : pouvoir faire des ordres de très haut niveau (un ordre
	  correspond à une suite d'instruction).

* Les plus de reprendre le langage existant :
	* faire des ordres court ;
	* pas besoin de faire un parseur ;
	* facile à étendre, pas besoin de rajouter de nouveaux "ordres robots"
	  complexes si jamais on veut étendre le langage des ordres possibles.

Le choix du RP se porterait sur des ordres riches car les vérifications sont
faites au niveau des messages envoyés par le bot. Cela enlève les cas d'erreur
tels que des boucle infinie où le bot envoie de mauvais ordres et le
noyau répond par des messages d'erreur.
Le bots devrait être capable de se rendre compte qu'il fait n'importe quoi
pour essayer de se remettre en symbiose avec le noyau.

Remarque du client : comment on (le bot) se synchronise avec le noyau en cas
d'erreur ? Il faudrait que, lorsqu'un séquence d'ordre du bot est envoyée au
noyau, tout soit traité jusqu'à ce que le bot ait la possibilité d'envoyer un
nouvel ordre.

Proposition du RP : le bot_handler fait d'abord une identité entre les "ordres
bot" et les ordres noyau, puis au fur et à mesure on ajoute de nouveaux "ordres
bot". Ainsi on aurait d'abord des bots qui envoient des ordres sous la forme
comprise par le noyau Nethack avant de complexifier et d'ajouter un langage
formé de mots tels que "MOVE SOUTH".

## Général

Il pourrait être envisageable de remplacer le code perl par du C++ si on
estime que cela est réalisable.

Le client est satisfait si le prototype est disponible pour fin décembre et si
on bascule, par la suite, sur une solution en C, plus propre.
Le prototype est presque utilisable actuellement.

Le RP est enchanté du fait qu'il sera possible de comparer le prototype (en perl)
et la version finale (en C) puisque le prototype est bientôt terminé.  
Si on a de la chance on pourra dire à la fin : "Mr Renault s'est trompé !"  
Amener une caméra pour immortaliser cet événement.

Le RP nous fait remarquer qu'il faut détailler d'avantage les techniques
d'implémentation dans le document de spécification. Quelqu'un qui lit ce
document doit comprendre les choix que nous avons effectué, notamment les
langages utilisés.
Le RP est cependant globalement content du doc de spécification.


Prochain rendez-vous RP : le lundi 17/12/2012 à 16h30.
