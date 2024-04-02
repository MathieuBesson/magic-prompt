#!/bin/bash
source ./quit.sh
source ./list.sh
source ./remove-file.sh
source ./remove-dir.sh
source ./age.sh
source ./authenticate.sh
source ./current_folder.sh
source ./go_to.sh
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
    cd ) shift; go_to "$@";;
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


# prompt par mot de passe et login


# help : listing des commandes dispo
# about : une description de votre programme
# version ou --v ou vers :  affiche la version de votre prompt
# profil : permet d’afficher toutes les informations sur vous même.
# First Name, Last name, age, email

# ls : liste fichiers et dossiers visible et caché
# rm : supprimer un fichier
# rmd ou rmdir : supprimer un dossier
# age : vous demande votre âge et vous dit si vous êtes majeur ou mineur
# quit : permet de sortir du prompt
# passw : permet de changer le password avec une demande de confirmation
# cd : aller dans un dossier que vous venez de créer ou de revenir à un dossier 
# précédent
# pwd : indique le répertoire actuelle courant
# hour : permet de donner l’heure actuelle
# * : indiquer une commande inconnu


# httpget : permet de télécharger le code source html d’une page web et de l’enregistrer dans un fichier spécifique. Votre prompt doit vous demander quel sera le nom du fichier.
# smtp : vous permet d’envoyer un mail avec une adresse un sujet et le corp du mail
# open : ouvrir un fichier directement dans l’éditeur VIM même si le fichier n’existe pas


# Pour faire valider votre exercice, il devra être sur gitlabs …

# Vous devez réaliser la documentation du prompt dans un README.md avec markdown

# Vous devez respecter “la structure de base d’un script Bash” vu dans ce cours.