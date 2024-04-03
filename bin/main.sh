#!/bin/bash

# My Magic Prompt : Le prompt bash pour le cours de scripting bash avancé

source src/quit.sh
source src/list.sh
source src/remove_file.sh
source src/remove_dir.sh
source src/age.sh
source src/authenticate.sh
source src/current_folder.sh
source src/move_to.sh
source src/hour.sh
source src/httpget.sh
source src/smtp.sh
source src/open.sh
source src/profil.sh
source src/version.sh
source src/about.sh
source src/help.sh

cmd() {
  cmd=$1
  argv=$*

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

main() {
  local lineCount=1

  # authenticate

  while [ 1 ]; do
    date=$(date +%H:%M)
    echo -ne "${date} - [\033[31m${lineCount}\033[m] - \033[33m$PWD\033[m ~ 🔮  ~ "
    read string

    cmd $string
    lineCount=$(($lineCount+1))
  done
}

main