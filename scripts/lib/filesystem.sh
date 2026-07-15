#!/usr/bin/env bash

# @name: filesystem.sh
# @description: Fonctions utilitaires pour la gestion des fichiers et répertoires.
# @version: 1.0.0

directory_exists() {

    local directory="$1"

    [[ -d "$directory" ]]

}

file_exists() {

    local file="$1"

    [[ -f "$file" ]]

}

create_directory() {

    local directory="$1"

    mkdir -p "$directory"

}

create_file() {

    local file="$1"

    touch "$file"

}


