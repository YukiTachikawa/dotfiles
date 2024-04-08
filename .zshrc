# alias code="/mnt/c/Users/takashi/AppData/Local/Programs/Microsoft\ VS\ Code/bin/code"
setopt no_beep
# export BROWSER='"/mnt/c/Program Files (x86)/Microsoft/Edge/Application/msedge.exe"'

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"


# zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# CUDA
if [ -d "/usr/local/cuda-12.4" ]; then
    export PATH="/usr/local/cuda-12.4/bin:$PATH"
    export LD_LIBRARY_PATH="/usr/local/cuda-12.4/lib64:$LD_LIBRARY_PATH"
fi

eval "$(starship init zsh)"
