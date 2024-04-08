#!/bin/bash

##
# DEFINITION : Permet d’envoyer un mail avec une adresse un sujet et le corp du mail
# PARAMETERS : 
#              $recipient : Mail du destinataire
#              $subject : Sujet du mail
#              $body : Contenu du mail
##
smtp() {
    local recipient="$1"
    local subject="$2"
    local body="$3"

    if [ -z "$recipient" ] || [ -z "$subject" ] || [ -z "$body" ]; then
        echo "Format : smtp {recipient} {subject} {body}"
        return 1
    fi

    mail -s "$subject" "$recipient" <<< "$body"
    echo "E-mail envoyé à \"$recipient\" : Sujet \"$subject\""
}