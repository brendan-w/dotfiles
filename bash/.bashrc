#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions if they're available
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# --------------- general ---------------
alias ls='ls --human-readable --group-directories-first --color=auto --classify --time-style=+"%d-%m-%Y %H:%M   "'
alias ll='ls -l'
alias la='ls -al'
alias grep='grep -n --color=tty -d skip'
alias pgrep='pgrep -a'
alias ag='ag --color-path "38;5;27" --color-line-number "1;38;5;127" --color-match "1;91"'
alias df='df --human-readable'
alias du='du --human-readable --total'
alias hexdump='hexdump -C'
alias tree='tree -C -F'
alias xx='atool -x'
alias xl='atool -l'


# --------------- git ---------------
alias gl="git log"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --stat --find-renames"
alias gb="git branch -a"
alias gt="git log --graph --all --pretty=format:'%C(bold yellow)%h%C(reset)%C(bold red)%d%C(reset)%n%C(white)%s%C(reset)%C(dim white) - %an%C(reset)%n'"
alias gap="git add -p"
alias gaa="git add --all ; git status"
alias gco="git checkout"


#PS1='[\u@\h \W]\$ '
. ~/.bash_prompt
