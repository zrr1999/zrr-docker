if [[ ! -f $HOME/.zi/bin/zi.zsh ]]; then
  print -P "%F{33}▓▒░ %F{160}Installing (%F{33}z-shell/zi%F{160})…%f"
  command mkdir -p "$HOME/.zi" && command chmod go-rwX "$HOME/.zi"
  command git clone -q --depth=1 --branch "main" https://github.com/z-shell/zi "$HOME/.zi/bin" && \
    print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
    print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi
source "$HOME/.zi/bin/zi.zsh"
autoload -Uz _zi
(( ${+_comps} )) && _comps[zi]=_zi

zi wait lucid light-mode for \
    zsh-users/zsh-history-substring-search \
    z-shell/H-S-MW \
    davidde/git \
    skywind3000/z.lua \
    zrr1999/zsh-ssh \
    Game4Move78/zsh-bitwarden \
    rapgenic/zsh-git-complete-urls

zi lucid light-mode for \
    zsh-users/zsh-autosuggestions \
    zsh-users/zsh-completions \
    z-shell/brew-completions \
    as"theme" depth"1" romkatv/powerlevel10k

zicompinit
