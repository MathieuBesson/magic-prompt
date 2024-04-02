#!/bin/bash
source ./quit.sh
source ./list.sh
source ./remove_file.sh
source ./remove_dir.sh
source ./age.sh
source ./authenticate.sh
source ./current_folder.sh
source ./move_to.sh
source ./hour.sh

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

    # Commande inconnue
    * ) echo "Command not recognized";;
  esac
}

main() {
  local lineCount=1

  authenticate

  while [ 1 ]; do
    date=$(date +%H:%M)
    echo -ne "${date} - [\033[31m${lineCount}\033[m] - \033[33mmy-magic-prompt\033[m ~ 🔮  ~ "
    read string

    cmd $string
    lineCount=$(($lineCount+1))
  done
}

main