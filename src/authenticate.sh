#!/bin/bash

PASS_FILE="secret/.pass"

##
# DEFINITION : Hash un mot de passe avec sha256sum
# PARAMETERS : 
#              $password : Mot de passe de l'utilisateur
# RETURN : Le mot de passe hashé
##
hash_password() {
    local password="$1"

    if [ -z "$password" ] ; then
        echo "Format : hash_password {password}"
        return 1
    fi

    hashed_password=$(echo -n "$password" | sha256sum | awk '{print $1}')
    echo "$hashed_password"
}

##
# DEFINITION : Lecture des credentials depuis le fichier de sauvegarde
# RETURN : Le combo username mot de passe hashé 
##
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

##
# DEFINITION : Lecture des credentials le prompt utilisateur
# RETURN : Le combo username mot de passe hashé 
##
read_user_credentials() {
    local entered_username
    local entered_password

    read -p "Entrez votre nom d'utilisateur : " entered_username
    read -s -p "Entrez votre mot de passe : " entered_password

    entered_hashed_password=$(hash_password "$entered_password")

    echo -e "$entered_username $entered_hashed_password"
}

##
# DEFINITION : Comparaison des crédentials utilisateur et des credentials stockés
# PARAMETERS : 
#              $stored_username : Username stocké
#              $stored_username : Mot de passe stocké hashé
#              $entered_username : Username utilisateur
#              $entered_hashed_password : Mot de passe utilisateur hashé
# RETURN : Le combo username mot de passe hashé 
##
check_credentials() {
    local stored_username="$1";
    local stored_hashed_password="$2";
    local entered_username="$3";
    local entered_hashed_password="$4";

   if [ -z "$stored_username" ] || [ -z "$stored_hashed_password" ] || [ -z "$entered_username" ] || [ -z "$entered_hashed_password" ]; then
        echo "Format : check_credentials {stored_username} {stored_hashed_password} {entered_username} {entered_hashed_password}"
        return 1
    fi

    if 
        [ "$entered_username" != "$stored_username" ] ||
        [ "$entered_hashed_password" != "$stored_hashed_password" ]; 
    then
        echo
        echo "Identifiant ou mot de passe incorrect. Fermeture du programme."
        quit
    fi
}

##
# DEFINITION : Créer un nouveau mot de passe
##
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

##
# DEFINITION : Met à jour un mot de passe
##
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

##
# DEFINITION : Authentifie un utilisateur
##
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