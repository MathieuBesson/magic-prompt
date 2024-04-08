#!/bin/bash

##
# DEFINITION : Donne le contenu d'un fichier
##
display_file_content() {
    local filePath="$1"

    if [ ! -f "$filePath" ]; then
        echo "Le fichier \"$1\" n'existe pas"
        return 1
    fi

    cat "$filePath"
    echo 
}
