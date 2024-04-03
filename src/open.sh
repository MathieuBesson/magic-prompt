#!/bin/bash

open() {
    local fileName="$1"

    if [ -z "$fileName" ]; then
        echo "Format : open {fileName}"
        return 1
    fi

    vim "$fileName"
}