# prompt {{{
export PS1='\w$(__git_ps1) $ '
# }}}

# general keybind {{{
bind C-l:clear-screen # teminal clearing
stty stop undef # don't lock terminal
# }}}

# alias {{{
#cd
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

# df
alias df='df -h'

alias test='./gradlew connectedInstrumentTest'
alias be='bundle exec'
# }}}

# z {{{
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}
# }}}

# export local env paths {{{
if [ -f ~/.local_settings]; then
  . ~/.local_settings
fi
# }}}

# define options {{{
export MAKEOPTS="-j5"
export _JAVA_OPTIONS="-Dfile.encoding=UTF-8"
# }}}
