#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

for f in .??*; do
    [[ "$f" == ".git" ]] && continue
    [[ "$f" == ".github" ]] && continue
    [[ "$f" == ".config" ]] && continue
    ln -snfv "$f" "$HOME/$f" 
done
 
function link_directory {
    local source_dir="$1"
    local dest_dir="$HOME/${source_dir#$SCRIPT_DIR/}"
    find "$source_dir" -type f ! -path '*.git*' | while IFS= read -r file; do 
        local dest_path="${dest_dir}/${file#$SCRIPT_DIR/}"
        mkdir -p "$(dirname "$dest_path")"
        ln -snfv "$file" "$dest_path"
    done
}

link_directory "${SCRIPT_DIR}/.config"