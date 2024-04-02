#!/bin/bash

age() {
    read -p "Veuillez entrer votre âge : " age_input
    if ! [[ "$age_input" =~ ^[0-9]+$ ]]; then
        echo "L'âge doit être un nombre."
    else
        if [ "$age_input" -ge 18 ]; then
            echo "Vous êtes majeur."
        else
            echo "Vous êtes mineur."
        fi
    fi
}