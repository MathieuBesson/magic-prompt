#!/bin/bash

##
# DEFINITION : Ouvre un fichier directement dans l’éditeur VIM même si le fichier n’existe pas
##
open() {
    local fileName="$1"

    if [ -z "$fileName" ]; then
        echo "Format : open {fileName}"
        return 1
    fi

    vim "$fileName"
}