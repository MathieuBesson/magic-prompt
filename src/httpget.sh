#!/bin/bash

httpget() {
    local url="$1"
    local fileName="$2"

    if [ -z "$url" ]; then
        echo "Format : httpget {url} {fileName}"
        return 1
    fi

    if [ -z "$fileName" ]; then
        read -p "Nom du fichier : " fileName
        if [ -z "$fileName" ]; then
            echo "Le nom du fichier doit contenir au moins un caractère"
            return 1
        fi
    fi

    curl -s -o "$fileName" "$url"
    echo "Fichier téléchargé ici : '$fileName'."
}