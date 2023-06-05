source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autolight -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zi wait lucid proto"ssh" light-mode for \
    zsh-users/zsh-history-substring-search \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    z-shell/H-S-MW \
    davidde/git \
    wting/autojump \
    zrr1999/zsh-ssh \
    Game4Move78/zsh-bitwarden \
    as"theme" depth"1" romkatv/powerlevel10k \
    rapgenic/zsh-git-complete-urls
