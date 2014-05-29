autoload -U colors && colors
PROMPT="%{$fg[white]%}%~%{$fg[white]%}$%{$reset_color%} "

case $TERM in (*xterm*|*rxvt*|(dt|k|E)term)
  precmd () { print -Pn "\e]0;%n@%M//%/\a" }
  preexec () { print -Pn "\e]0;%n@%M//%/\ $1\a" }
  ;;
esac

setopt INTERACTIVE_COMMENTS      
setopt AUTO_LIST
setopt AUTO_MENU

fpath=(~/.zsh/completion $fpath) 

autoload -U compinit
compinit

#zstyle ':completion::complete:*' use-cache on
#zstyle ':completion::complete:*' cache-path .zcache
#zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'
zstyle ':completion:*' menu select
zstyle ':completion:*:*:default' force-list always
eval $(dircolors -b)
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
compdef pkill=kill
compdef pkill=killall
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:*:*:processes' force-list always
zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:descriptions' format $'\e[01;33m -- %d --\e[0m'
zstyle ':completion:*:messages' format $'\e[01;35m -- %d --\e[0m'
zstyle ':completion:*:warnings' format $'\e[01;31m -- No Matches Found --\e[0m'

zle_highlight=(region:bg=magenta 
              special:bold      
              isearch:underline)

user-complete(){
   case $BUFFER in
       "cd --" )                  # "cd --" 替换为 "cd +"
           BUFFER="cd +"
           zle end-of-line
           zle expand-or-complete
           ;;
       "cd +-" )                  # "cd +-" 替换为 "cd -"
           BUFFER="cd -"
           zle end-of-line
           zle expand-or-complete
           ;;
       * )
           zle expand-or-complete
           ;;
   esac
}
zle -N user-complete
bindkey "\t" user-complete

alias -g ls='ls -X --color=auto'
alias -g ll='ls -l'
alias -g grep='grep --color=auto'
alias -g vi='vi -p'
zstyle ':completion:*:ping:*' hosts 192.168.128.1{38,} www.g.cn \
      192.168.{1,0}.1{{7..9},}
export PATH="${PATH}:/home/${USER}/bin:/sbin:/usr/sbin:/home/${USER}/opt/bin:"
export HISTFILE=/home/${USER}/.zhistory
export HISTSIZE=4096
setopt appendhistory
