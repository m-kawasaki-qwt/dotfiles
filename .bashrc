# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

umask 0002

" linux 
alias l='ls -l'
alias la='ls -la'
alias ls='ls -ls'
alias lsa='ls -lsa'

# git
alias glog='git log'
alias glogp='git log -p'
alias ga='git add .'
alias gm='git commit -m '
alias gs='git status'
alias gd='git diff'
alias gh='git checkout'
alias gb='git branch'
alias gaddw='git diff -U0 -w --no-color | git apply --cached --ignore-whitespace --unidiff-zero;git checkout .'
alias ggraph='git log --oneline --graph --all'
