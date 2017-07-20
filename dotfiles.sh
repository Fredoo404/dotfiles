#!/bin/bash

# file to manage : 
# - .aliases
# - .bash_profile
# - .bash_prompt
# - .bashrc
# - .exports
# - .functions
# - .vimrc
# - .vim
# - .screenrc

execPath=$(cd $(dirname $0); pwd)
workDir=$HOME

files[0]=".aliases"
files[1]=".bash_profile"
files[2]=".bash_prompt"
files[3]=".bashrc"
files[4]=".exports"
files[5]=".functions"
files[6]=".vimrc"
files[7]=".vim"
files[8]=".screenrc"
files[9]=".mac"


usage() {
    echo "usage :"
    echo "-i    Import configuration file to your work environnement (your /home)."
    echo "-e    Export configuration file in this git repo."
}

import_file() {
    for elem in ${files[*]}; do
        cp -rf $execPath/$elem $workDir
    done
}

export_file() {
    for elem in ${files[*]}; do
        cp -rf $workDir/$elem $execPath
    done
}

while getopts hei OPT; do
    case "$OPT" in
        h)
            usage
            exit 0
            ;;
        e)
            export_file
            exit 0
            ;;
        i)
            import_file
            exit 0
            ;;
        *)
            echo "Unrecognized options"
            ;;
    esac
done
