
set fish_greeting ""

# --------------- general ---------------
alias ls='ls --human-readable --group-directories-first --color=auto --classify --time-style=+"%d-%m-%Y %H:%M   "'
alias ll='ls -l'
alias la='ls -la'
alias grep='grep -n --color=tty -d skip'
alias pgrep='pgrep -a'
alias ag='ag --color-path "38;5;27" --color-line-number "1;38;5;127" --color-match "1;91"'
alias df='df --human-readable'
alias du='du --human-readable --total'
alias hexdump='hexdump -C'
alias tree='tree -C -F'
alias xx='atool -x'


# --------------- git ---------------
alias gl="git log"
alias gs="git status"
alias gd="git diff"
alias gds="git diff --stat"
alias gb="git branch -a"
alias gt="git log --graph --all --pretty=format:'%C(bold yellow)%h%C(reset)%C(bold red)%d%C(reset)%n%C(white)%s%C(reset)%C(dim white) - %an%C(reset)%n'"
alias gap="git add -p"
alias gaa="git add --all ; git status"
alias gco="git checkout"


# --------------- env ---------------
set -gx VIRTUALFISH_HOME "$HOME/.virtualenvs" # won't expand ~
set -gx GCC_COLORS "always"
set -gx PAGER "less"
set -gx EDITOR "vim"

set -g theme_display_git yes
set -g theme_display_hg no
set -g theme_display_virtualenv yes
set -g theme_display_ruby no
set -g theme_display_user no

if python -c 'import virtualfish' > /dev/null 2>&1
    eval (python -m virtualfish compat_aliases)
else
    echo "Virtualfish not found"
    echo "Install using 'pip install --user virtualfish'"
end

