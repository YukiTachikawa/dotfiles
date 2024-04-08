#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
 
for dotfile in .??*; do 
    [[ "$dotfile" == ".git" ]] && continue 
    ln -snfv  $SCRIPT_DIR/$dotfile ~/$dotfile 
done
 