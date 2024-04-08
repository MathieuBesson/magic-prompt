#!/bin/bash

##
# DEFINITION : Télécharge le code source html d’une page web
# PARAMETERS : 
#              $url : URL à téléccharger
#              $file_name : Fichier cible du téléchargement
##
httpget() {
    local url="$1"
    local file_name="$2"

    if [ -z "$url" ] || [ -z "$file_name" ]; then
        echo "Format : httpget {url} {file_name}"
        return 1
    fi

    if [ -z "$file_name" ]; then
        read -p "Nom du fichier : " file_name
        if [ -z "$file_name" ]; then
            echo "Le nom du fichier doit contenir au moins un caractère"
            return 1
        fi
    fi

    curl -s -o "$file_name" "$url"
    echo "Fichier téléchargé ici : '$file_name'."
}