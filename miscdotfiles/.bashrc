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
alias grep='rg'
alias d='emacs'
### Alias end


### bash powerline
#powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
#. /home/jan/.local/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh
### bash powerline end

### z.lua
eval "$(lua $HOME/git/z.lua/z.lua --init bash)"
### z.lua end


PS1='[\u@\h \W]\$ '

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

export PATH="$HOME/.emacs.d/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
