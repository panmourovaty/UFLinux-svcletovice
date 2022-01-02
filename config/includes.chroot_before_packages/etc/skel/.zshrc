HISTFILE=~/.zsh_history
HISTSIZE=10000000
SAVEHIST=10000000
setopt SHARE_HISTORY
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
autoload -U compinit promptinit
promptinit
compinit
eval "$(/usr/local/bin/starship init zsh)"
alias apt-get="sudo apt-get"
alias apt="sudo apt"
