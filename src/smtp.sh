#!/bin/bash

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