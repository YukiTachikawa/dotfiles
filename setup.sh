#!/bin/bash
set -eu
echo "start setup"

# dotfilesのシンボリックリンクを作成
DOT_FILES=(.bashrc .zshrc)
for file in ${DOT_FILES[@]}
do
    ln -snfv $HOME/$file $HOME/$file
done
 