#!/bin/bash

PASS_FILE="secret/.pass"

hash_password() {
  password="$1"
  hashed_password=$(echo -n "$password" | sha256sum | awk '{print $1}')
  echo "$hashed_password"
}

read_stored_credentials() {
  local stored_username
  local stored_hashed_password

  if [ -f "$PASS_FILE" ]; then
    stored_username=$(head -n 1 "$PASS_FILE")
    stored_hashed_password=$(sed -n '2p' "$PASS_FILE")
  else
    stored_username=""
    stored_hashed_password=""
  fi

  echo -e "$stored_username $stored_hashed_password"
}

read_user_credentials() {
  local entered_username
  local entered_password

  read -p "Entrez votre nom d'utilisateur : " entered_username
  read -s -p "Entrez votre mot de passe : " entered_password

  entered_hashed_password=$(hash_password "$entered_password")

  echo -e "$entered_username $entered_hashed_password"
}

check_credentials() {
    local stored_username="$1";
    local stored_hashed_password="$2";
    local entered_username="$3";
    local entered_hashed_password="$4";

    if 
        [ "$entered_username" != "$stored_username" ] ||
        [ "$entered_hashed_password" != "$stored_hashed_password" ]; 
    then
        echo
        echo "Identifiant ou mot de passe incorrect. Fermeture du programme."
        quit
    fi
}

create_new_password() {
    local create_password

    read -p "Identifiant non trouvé dans le fichier .pass. Voulez-vous créer un nouveau mot de passe ? (oui/non) " create_password
    if [ "$create_password" = "oui" ]; then
        update_password
    else
        echo
        echo "Fermeture du programme."
        quit
    fi
}

update_password() {
    local entered_username
    local entered_password
    local confirm_password
    local stored_hashed_password

    read -p "Entrez votre nom d'utilisateur : " entered_username
    read -s -p "Entrez votre nouveau mot de passe : " entered_password
    echo
    read -s -p "Confirmez votre nouveau mot de passe : " confirm_password
    echo
    if [ "$entered_password" != "$confirm_password" ]; then
        echo "Les mots de passe ne correspondent pas. Fermeture du programme."
        quit
    else
        stored_hashed_password=$(hash_password "$entered_password")
        echo -e "$entered_username $stored_hashed_password"
        echo -e "$entered_username $stored_hashed_password" > "$PASS_FILE"
        echo "Mot de passe sauvegardé avec succès."
    fi
}

authenticate() {
    local stored_username;
    local stored_hashed_password;
    local entered_username;
    local entered_hashed_password;

    read -r stored_username stored_hashed_password < <(read_stored_credentials)

    if [ -n "$stored_username" ] && [ -n "$stored_hashed_password" ]; then
        read -r entered_username entered_hashed_password < <(read_user_credentials)

        check_credentials "$stored_username" "$stored_hashed_password" "$entered_username" "$entered_hashed_password"
    else
        create_new_password
    fi

    echo;
}