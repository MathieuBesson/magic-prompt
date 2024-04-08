#!/bin/bash

source src/display_file_content.sh

##
# DEFINITION : Affiche la version du prompt
##
version() {
    display_file_content "ressource/version.txt"
}
