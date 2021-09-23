
set fish_greeting ""

# --------------- general ---------------
alias !!=" eval $history[1]" # leading space prevents command from showing up in history
alias ls='ls --human-readable --group-directories-first --color=auto --classify --time-style=+"%d-%m-%Y %H:%M   "'
alias grep='grep -n --color=tty -d skip'
alias ag='ag --color-path "38;5;27" --color-line-number "1;38;5;127" --color-match "1;91"'
alias df='df --human-readable'
alias du='du --human-readable --total'
alias hexdump='hexdump -C'
alias tree='tree -C -F -I .git -I node_modules'
alias xx='atool -x'
alias xl='atool -l'
alias xp='apack'
alias rm='rm -r' # probably a bad idea, but we'll see
alias cd='cds'
alias wtf-journal='journalctl -xe --priority err --boot -0'
alias backup-home='rsync -av --delete --delete-excluded --exclude .cache --exclude .local/share/Trash/ --exclude .gem --exclude .npm ~/'
alias killl='kill -9'
alias killll='sudo kill -9'
alias rm-exif='exiftool -overwrite_original -all='

# --------------- git ---------------
alias ga="git add --all ; git status"
alias gap="git add -p"
alias gb="git branch"
alias gc="git commit"
alias gca="git commit --amend --no-edit"
alias gco="git checkout"
alias gd="git diff"
alias gds="git diff --stat --find-renames"
alias gf="git fetch --tags"
alias gl="git ls"
alias gll="git ll"
alias gr="git remote -v"
alias gs="git status"
alias gt="git tree"

# --------------- env ---------------

set -gx LS_COLORS (dircolors | head -n 1 | sed "s/LS_COLORS='//g; s/';//g")
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
if which micro > /dev/null 2>&1
    set -gx EDITOR "micro"
else if which vim > /dev/null 2>&1
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
if which python > /dev/null 2>&1
    if ! python -c 'import virtualfish' > /dev/null 2>&1
        echo "Virtualfish not found"
        echo "Install using 'pip install --user virtualfish'"
    end
end


# --------------- files ---------------
alias e="eval $EDITOR"
alias notes="e ~/notes.txt"
alias projects="e ~/projects.txt"
alias contacts="e ~/contacts.xml"

set -l site_fish ~/.site.fish
if test -f $site_fish
    . $site_fish
end
