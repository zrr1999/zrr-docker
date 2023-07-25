source etc/profile
setopt no_nomatch
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fpath+=~/.zfunc
fpath+=$(brew --prefix)/share/zsh/site-functions
zstyle ':completion:*' menu select
autoload -Uz compinit

source ~/.zi.zsh
source ~/.atuin.zsh

# session-wise fix
ulimit -n 4096
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# config homebrew
export HOMEBREW_NO_AUTO_UPDATE=true
export HOMEBREW_NO_INSTALL_FROM_API=1
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/

# add some alias
alias j='z'
alias grep='rg'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias wget='http --download'
tree () {
    local depth=3
    (($+1)) && {
        local depth=$1
    }
    ls --tree --depth $depth
}

alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'
