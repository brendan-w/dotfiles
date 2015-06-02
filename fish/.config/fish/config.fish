
# --------------- general ---------------
alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep -n --color=tty -d skip'
alias df='df --human-readable'
alias du='du --human-readable --total'


# --------------- git ---------------
alias gl="git log"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --stat"
alias gb="git branch -a"
alias gt="git log --graph --all --pretty=format:'%C(bold yellow)%h%C(reset)%C(bold red)%d%C(reset)%n%C(white)%s%C(reset)%C(dim white) - %an%C(reset)%n'"
alias gap="git add -p"
alias gaa="git add --all ; git status"
