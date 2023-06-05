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
