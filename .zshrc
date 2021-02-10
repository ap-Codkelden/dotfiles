# . /etc/environment

source /home/rino/bureau/prompt_bureau_setup.zsh

# key bindings
# setup key accordingly

[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}" up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}" down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}" backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}" forward-char

bindkey "\e[3~" delete-char
bindkey ';5C' emacs-forward-word
bindkey ';5D' emacs-backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[6~" down-line-or-history 

# instead of rebuild cache use
zstyle ":completion:*:commands" rehash 1

# sound?
# alsactl restore

zmodload zsh/zprof

# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl true
zstyle ':completion:*' verbose true
zstyle ":completion:*:commands" rehash 1

zstyle :compinstall filename '~/.zshrc'

autoload -Uz compinit
compinit
autoload zmv

# autoload predict-on
# zle -N predict-on
# zle -N predict-off
# bindkey '^Z'   predict-on
# bindkey '^X^Z' predict-off
# zstyle ':predict' verbose true
dot() {
  if [[ $LBUFFER = *.. ]]; then
    LBUFFER+=/..
  else
    LBUFFER+=.
  fi
}
autoload -U dot
zle -N dot
bindkey . dot

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
EDITOR=nano
setopt appendhistory notify
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt extendedglob
setopt autocd
unsetopt beep nomatch
bindkey -e
# End of lines configured by zsh-newuser-install

autoload -U promptinit && promptinit

PATH=/home/rino/.local/bin:/usr/local/texlive/2020/bin/x86_64-linux:$PATH
MANPATH=/usr/local/texlive/2020/texmf-dist/doc/man:$MANPATH
INFOPATH=/usr/local/texlive/2020/texmf-dist/doc/info:$INFOPATH

# Aliases 

alias ls='ls --color'
alias rm='rm -I'
alias ping="LC_MESSAGES=C ping"
alias pacman="LC_ALL=C pacman"

# environment
# GTK_IM_MODULE=xim 
# QT_IM_MODULE=xim

# export LC_ALL=C
export LANG=uk_UA.UTF-8
export LC_CTYPE=uk_UA.UTF-8

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
