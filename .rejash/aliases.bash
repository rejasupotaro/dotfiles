#!/usr/bin/env bash

# reload
alias reload='source ~/.bash_profile'
# cd
function cdls() {
  \cd $1;
  ls;
}
alias cd='cdls'

# ls
case "${OSTYPE}" in
  darwin*)
    alias ls="ls -G"
    alias ll="ls -lG"
    alias la="ls -laG"
    ;;
  linux*)
    alias ls='ls --color'
    alias ll='ls -l --color'
    alias la='ls -la --color'
    ;;
esac

# grep
alias grep='grep --color=auto'

# rm
alias rmdir='rm -rf'

# java
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

# vim
alias vimshell='vim -c VimShell'
alias vimfiler='vim -c VimFiler'

# reload
alias reload='source ~/.bash_profile'

# cd
alias ..='cd ..'         # Go up one directory
alias ...='cd ../..'     # Go up two directories
alias ....='cd ../../..' # Go up three directories
alias -- -='cd -'        # Go back

function cdls() {
  \cd $1;
  ls;
}
alias cd='cdls'

# ls
case "${OSTYPE}" in
  darwin*)
    alias ls="ls -G"
    alias ll="ls -lG"
    alias la="ls -laG"
    ;;
  linux*)
    alias ls='ls --color'
    alias ll='ls -l --color'
    alias la='ls -la --color'
    ;;
esac

# grep
alias grep='grep --color=auto'

# rm
alias rmdir='rm -rf'

# java
alias javac='javac -J-Dfile.encoding=UTF-8'
alias java='java -Dfile.encoding=UTF-8'

# vim
alias vimshell='vim -c VimShell'
alias vimfiler='vim -c VimFiler'
