#!/usr/bin/env bash

bind C-l:clear-screen # teminal clearing

stty stop undef # don't lock terminal

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
