#!/bin/bash

# My Magic Prompt : Le prompt bash pour le cours de scripting bash avancé

##
# DEFINITION : Chargement des scripts sources
##
source_scripts() {
  local folder_scripts=$(echo $(dirname $(realpath ${BASH_SOURCE[0]}))/..)/src

  # Chargement des scripts du dossier 
  for script in $folder_scripts/*; do
      [ -e "$script" ] || continue
      source "$script"
  done
}

##
# DEFINITION : Exécution des commandes intéractives
# PARAMETERS : 
#              $cmd : Commande lancé par l'utilisateur
#              $argv : Liste des arguments de la commande lancé par l'utilisateur
##
cmd() {
  local cmd="$1"
  local argv="$*"

  case "${cmd}" in
    # Sortie du script
    quit | exit ) quit;;
    
    # Liste fichiers et dossiers visible et caché
    ls ) shift; list "$@";;
    
    # Supprimer un fichier
    rm ) shift; remove_file "$@";;
    
    # Supprimer un dossier
    rmd | rmdir ) shift; remove_dir "$@";;
    
    # Majeur ou mineur ?
    age ) shift; age "$@";;
    
    # Changement de password avec une demande de confirmation
    passw ) shift; update_password "$@";;
    
    # Aller dans un dossier
    cd ) shift; move_to "$@";;
    
    # Indique le répertoire actuelle courant
    pwd ) shift; current_folder "$@";;
    
    # Donner l’heure actuelle
    hour ) shift; hour "$@";;

    # Télécharger le code source html d’une page web, et la sauvegarder
    httpget ) shift; httpget "$@";;

    # Envoyer un mail
    smtp ) shift; smtp "$@";;

    # Ouvrir un fichier dans VIM
    open ) shift; open "$@";;

    # Affiche toutes les informations sur moi
    profil ) shift; profil;;

    # Affiche la version du prompt
    version | vers | --v ) shift; version;;

    # Affiche la description du programme
    about ) shift; about;;

    # Listing des commandes dispo
    help ) shift; help;;

    # Commande inconnue
    * ) echo "Commande inconnue, découvrez les commandes disponible avec \"help\"";;
  esac
}

##
# DEFINITION : Fonction de base du script
##
main() {
  local lineCount=1

  # Chargement des scripts 
  source_scripts

  # Authentification du script
  authenticate

  # Lancement des commandes en infini
  while [ 1 ]; do
    date=$(date +%H:%M)
    echo -ne "${date} - [\033[31m${lineCount}\033[m] - \033[33m$PWD\033[m ~ 🔮  ~ "
    read string

    cmd $string
    lineCount=$(($lineCount+1))
  done
}

# Point d'entrée du script
main