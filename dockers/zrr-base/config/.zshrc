source /etc/profile
export LC_ALL=C.UTF-8
export LANG=C.UTF-8
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
ZSH_DISABLE_COMPFIX=true

source $ZSH/oh-my-zsh.sh

# zplug configuration
export ZPLUG_HOME=$(brew --prefix)/opt/zplug
source $ZPLUG_HOME/init.zsh
zplug "plugins/git", from:oh-my-zsh
zplug "zplug/zplug", hook-build:'zplug --self-manage'
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "wting/autojump"
zplug "zrr1999/zsh-ssh"
zplug "Game4Move78/zsh-bitwarden"
zplug "rapgenic/zsh-git-complete-urls"
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
autoload -Uz compinit
zstyle ':completion:*' menu select
fpath+=~/.zfunc

# session-wise fix
ulimit -n 4096
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles/

alias grep='rg'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
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

