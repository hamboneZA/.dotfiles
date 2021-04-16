export PATH=/usr/local/bin:$PATH:$HOME/bin:$HOME/DEV
export HISTSIZE=100000
export PYTHONSTARTUP=~/.pythonrc
export PYTHONPATH=.:$PYTHONPATH
export PROMPT_COMMAND='history -a'

alias ls="ls -G"
alias vi=vim
alias clear-derived-data="rm -r /Users/hamboneZA/Library/Developer/Xcode/DerivedData"

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
