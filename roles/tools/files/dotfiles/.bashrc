#!/bin/bash

# shellcheck disable=SC1090

# Include .bashrc in .config dir
if [[ -f ~/.config/bashrc/.bashrc ]] ; then
    source ~/.config/bashrc/.bashrc 
fi
