#!/usr/bin/env bash

source ~/.rejash/prompt.bash
source ~/.rejash/keybind.bash
source ~/.rejash/aliases.bash
source ~/.rejash/git_completion.bash

# z {{{
. `brew --prefix`/etc/profile.d/z.sh
function precmd () {
  z --add "$(pwd -P)"
}
# }}}

# history {{{
HISTSIZE=2000
HISTFILESIZE=2000
HISTCONTROL=ignoreboth
HISTIGNORE=ls:la:ll:lla:history:h:pwd
HISTTIMEFORMAT='%y/%m/%d %H:%M:%S  '
# }}}

# completion {{{
set completion-ignore-case on
shopt -s cdspell
# }}}

# load local settings {{{
if [ -f ~/.local_settings ]; then
  . ~/.local_settings
fi
# }}}
