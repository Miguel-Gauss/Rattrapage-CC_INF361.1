Nom du script : create_user.sh

Description :

Ce script Bash permet de créer un utilisateur avec des caractéristiques spécifiques tels que :
● Nom d'utilisateur : adama
● Commentaire : "je suis adama"
● Mot de passe par défaut : inf3611 (forcer l'utilisateur à le changer lors de sa première
connexion).
● Durée de validité du compte : 10 jours à partir de sa création.
● Shell par défaut : /bin/bash
● Quota disque : 2 Go.
● Plage horaire de connexion autorisée : uniquement entre 8h00 et 18h00.

Fonctionnalités :

1. Création d'un utilisateur avec un commentaire et un shell par défaut.


2. Définition d'un mot de passe par défaut (inf3611) avec un changement obligatoire au premier login.


3. Limitation de la validité du compte à un nombre défini de jours.


4. Application d'un quota disque spécifié.


5. Restriction des horaires de connexion à une plage horaire précise.



Usage :

Exécutez le script avec les paramètres suivants dans l'ordre :

./create_user.sh <nom_utilisateur> <commentaire> <shell_par_defaut> <duree_validite> <quota_disque>

Exemple :

./create_user.sh adama "je suis adama" /bin/bash 10 2G

Prérequis :

1. Droits administratifs pour exécuter les commandes système.


2. Paquets nécessaires installés (quota, libpam-time).
