#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
 
for dotfile in .??*; do 
    [[ "$dotfile" == ".git" ]] && continue 
    ln -snfv  "$SCRIPT_DIR"/"$dotfile" ~/"$dotfile"
done
 

DOT_DIRECTORY="${PWD}"
declare -a DIRECTORIES=(".config")
for child_directory in $DIRECTORIES; do
  cd "${DOT_DIRECTORY}/${child_directory}"

  for directory in $(find . -type d); do
    mkdir -p "${HOME}/${child_directory}/${directory}"
  done

  for file in $(find . -type f | grep -v .git); do
      ln -snfv "${DOT_DIRECTORY}/${child_directory}/${file:2}" "${HOME}/${child_directory}/${file:2}"
  done
done