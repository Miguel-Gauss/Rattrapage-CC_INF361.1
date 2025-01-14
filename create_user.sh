#!/bin/bash

# Script pour créer un utilisateur avec des caractéristiques spécifiques
# Usage : ./create_user.sh <nom_utilisateur> <commentaire> <shell_par_defaut> <duree_validite> <quota_disque>
# Exemple : ./create_user.sh adama "je suis adama" /bin/bash 10 2G

# Vérification du nombre d'arguments
if [ "$#" -ne 5 ]; then
  echo "Usage: $0 <nom_utilisateur> <commentaire> <shell_par_defaut> <duree_validite> <quota_disque>"
  exit 1
fi

# Récupération des arguments
USERNAME=$1
COMMENT=$2
DEFAULT_SHELL=$3
VALIDITY=$4
DISK_QUOTA=$5

# Création de l'utilisateur
useradd -m -c "$COMMENT" -s "$DEFAULT_SHELL" -e "$(date -d "+$VALIDITY days" +%Y-%m-%d)" "$USERNAME"

# Vérification de la création de l'utilisateur
if [ $? -ne 0 ]; then
  echo "Erreur : Impossible de créer l'utilisateur $USERNAME"
  exit 1
fi

# Définir le mot de passe par défaut et forcer le changement au premier login
echo "$USERNAME:inf3611" | chpasswd
passwd -e "$USERNAME"

# Configuration du quota disque
setquota -u "$USERNAME" "$DISK_QUOTA" "$DISK_QUOTA" 0 0 /

# Configuration des horaires de connexion
echo "Restricting login hours for $USERNAME..."
echo "cron.allow:$USERNAME" >> /etc/security/time.conf
echo "login ; tty* ; $USERNAME ; !Wk0800-1800" >> /etc/security/time.conf

echo "Utilisateur $USERNAME créé avec succès !"
