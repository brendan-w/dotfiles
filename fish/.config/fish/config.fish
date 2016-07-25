
set fish_greeting ""

# print my reminders
if command -s remind > /dev/null 2>&1 ; and test -f ~/.reminders
    remind ~/.reminders | sed '/^\s*$/d' | tail -n+2
end

# --------------- general ---------------
alias !!=" eval $history[1]" # leading space prevents command from showing up in history
alias ls='ls --human-readable --group-directories-first --color=auto --classify --time-style=+"%d-%m-%Y %H:%M   "'
alias grep='grep -n --color=tty -d skip'
alias pgrep='pgrep -a'
alias ag='ag --color-path "38;5;27" --color-line-number "1;38;5;127" --color-match "1;91"'
alias df='df --human-readable'
alias du='du --human-readable --total'
alias hexdump='hexdump -C'
alias tree='tree -C -F -I .git'
alias xx='atool -x'
alias xl='atool -l'
alias rm='rm -r' # probably a bad idea, but we'll see
alias cd='cds'
alias s='pushd .' # save cwd onto the stack
alias p='popd' # pop cwd off the stack
alias wtf='journalctl -xe --priority err --boot -0'

# --------------- git ---------------
alias gl="git log"
alias gs="git status"
alias gd="git diff"
alias gr="git remote -v"
alias gds="git diff --stat --find-renames"
alias gb="git branch -a"
alias gt="git log --graph --all --pretty=format:'%C(bold dim cyan)%h%C(bold red)%d %C(dim white)%s%n'"
alias gap="git add -p"
alias gaa="git add --all ; git status"
alias gco="git checkout"


# --------------- env ---------------

set -gx VIRTUALFISH_HOME ~/.virtualenvs
set -gx GCC_COLORS "always"
set -gx PAGER "less -r"
set -gx TERMINAL "terminator" # used by i3-sensible-terminal (will fall back if not found)

# enable 256 color mode
if test $TERM = "xterm"
    set -gx TERM "xterm-256color"
end

if test -f ~/.pythonrc.py
    set -gx PYTHONSTARTUP ~/.pythonrc.py
end

# editor
if command -s emacs > /dev/null 2>&1
    set -gx EDITOR "emacs --no-window-system --no-desktop"
else if command -s vim > /dev/null 2>&1
    set -gx EDITOR "vim"
else
    set -gx EDITOR "nano"
end

set -g theme_display_git yes
set -g theme_display_hg no
set -g theme_display_virtualenv yes
set -g theme_display_ruby no
set -g theme_display_user no

# virtual-fish
# test for python first
if command -s python > /dev/null 2>&1
    if python -c 'import virtualfish' > /dev/null 2>&1
        eval (python -m virtualfish compat_aliases)
    else
        echo "Virtualfish not found"
        echo "Install using 'pip install --user virtualfish'"
    end
end


# --------------- files ---------------
alias e="eval $EDITOR"
alias notes="e ~/notes.txt"
alias projects="e ~/projects.txt"
alias contacts="e ~/contacts.xml"
