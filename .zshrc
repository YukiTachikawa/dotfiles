setopt no_beep

if [ -d "/mnt/c" ]; then 
    # export BROWSER='"/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"'
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ `uname` != "Darwin" ]; then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# CUDA
if [ -d "/usr/local/cuda-12.4" ]; then
    export PATH="/usr/local/cuda-12.4/bin:$PATH"
    export LD_LIBRARY_PATH="/usr/local/cuda-12.4/lib64:$LD_LIBRARY_PATH"
fi

# zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
    autoload -Uz compinit
    compinit
fi

setopt auto_cd #一致するディレクトリに cdなしで移動できる
setopt correct #コマンドのスペルを修正(正しい可能性のある候補を表示)
setopt correct_all #コマンドラインの引数のスペルを修正
setopt hist_ignore_dups #直前と同じコマンドは履歴に追加しない
setopt share_history  #他のzshで履歴を共有する
setopt inc_append_history #即座に履歴を保存する
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000

# https://github.com/microsoft/terminal/issues/755#issuecomment-530905894
bindkey -e
# Control + backspace
bindkey '^H' backward-kill-word
bindkey '\[3\;5~' kill-word
# Control + arrows
bindkey ";5C" forward-word
bindkey ";5D" backward-word

eval "$(starship init zsh)"
