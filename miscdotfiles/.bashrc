#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


### Add to PATH

#needed for powerline
#export PATH=$PATH:$HOME/.local/bin

### Add to PATH end

### Alias start
alias ls='ls --color=auto'
alias v="nvim"
alias :q='exit'
### Alias end


### bash powerline
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
. /usr/share/powerline/bindings/bash/powerline.sh
### bash powerline end

PS1='[\u@\h \W]\$ '
