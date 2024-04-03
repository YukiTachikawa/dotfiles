#!/bin/bash
set -eu
# 実行場所のディレクトリを取得
THIS_DIR=$(cd $(dirname $0); pwd)

echo "start setup"

# dotfilesのシンボリックリンクを作成
for f in .??*; do
    ln -snfv ~/dotfiles/"$f" ~/
done