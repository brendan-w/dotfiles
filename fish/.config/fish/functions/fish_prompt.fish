# name: bobthefish
#
# bobthefish is a Powerline-style, Git-aware fish theme optimized for awesome.
#
# You will probably need a Powerline-patched font for this to work:
#
#     https://powerline.readthedocs.org/en/latest/fontpatching.html
#
# I recommend picking one of these:
#
#     https://github.com/Lokaltog/powerline-fonts
#
# You can override some default options in your config.fish:
#
#     set -g theme_display_git no
#     set -g theme_display_hg yes
#     set -g theme_display_virtualenv no
#     set -g theme_display_ruby no
#     set -g theme_display_user yes
#     set -g default_user your_normal_user

set -g __bobthefish_current_bg NONE

# Powerline glyphs
set __bobthefish_branch_glyph            \uE0A0
set __bobthefish_ln_glyph                \uE0A1
set __bobthefish_padlock_glyph           \uE0A2
set __bobthefish_right_black_arrow_glyph \uE0B0
set __bobthefish_right_arrow_glyph       \uE0B1
set __bobthefish_left_black_arrow_glyph  \uE0B2
set __bobthefish_left_arrow_glyph        \uE0B3

# Additional glyphs
set __bobthefish_detached_glyph          \u27A6
set __bobthefish_superuser_glyph         '$'
set __bobthefish_bg_job_glyph            '%'
set __bobthefish_hg_glyph                \u263F

# Python glyphs
set __bobthefish_superscript_glyph       \u00B9 \u00B2 \u00B3
set __bobthefish_virtualenv_glyph        \u25F0
set __bobthefish_pypy_glyph              \u1D56

# Colors
set __bobthefish_lt_green   addc10
set __bobthefish_med_green  189303
set __bobthefish_dk_green   0c4801

set __bobthefish_lt_red     C99
set __bobthefish_med_red    ce000f
set __bobthefish_dk_red     600
set __bobthefish_ruby_red   af0000

set __bobthefish_slate_blue 255e87
set __bobthefish_med_blue   005faf

set __bobthefish_lt_orange  f6b117
set __bobthefish_dk_orange  3a2a03

set __bobthefish_dk_grey    333
set __bobthefish_med_grey   999
set __bobthefish_lt_grey    ccc

set __bobthefish_dk_brown   4d2600
set __bobthefish_med_brown  803F00
set __bobthefish_lt_brown   BF5E00

# My Colors
set __git_clean_fg fff
set __git_clean_bg $__bobthefish_slate_blue

set __git_staged_fg fff
set __git_staged_bg 000


# ===========================
# Helper methods
# ===========================

# function __bobthefish_in_git -d 'Check whether pwd is inside a git repo'
#   command which git > /dev/null 2>&1; and command git rev-parse --is-inside-work-tree >/dev/null 2>&1
# end

# function __bobthefish_in_hg -d 'Check whether pwd is inside a hg repo'
#   command which hg > /dev/null 2>&1; and command hg stat > /dev/null 2>&1
# end

function __bobthefish_git_branch -d 'Get the current git branch (or commitish)'
  set -l ref (command git symbolic-ref HEAD 2>/dev/null)
  if [ $status -gt 0 ]
    set -l branch (command git show-ref --head -s --abbrev | head -n1 2>/dev/null)
    set ref "$__bobthefish_detached_glyph $branch"
  end
  echo $ref | sed  "s#refs/heads/#$__bobthefish_branch_glyph #"
end

function __bobthefish_hg_branch -d 'Get the current hg branch'
  set -l branch (command hg branch 2>/dev/null)
  set -l book " @ "(command hg book | grep \* | cut -d\  -f3)
  echo "$__bobthefish_branch_glyph $branch$book"
end

function __bobthefish_pretty_parent -d 'Print a parent directory, shortened to fit the prompt'
  echo -n (dirname $argv[1]) | sed -e 's#/private##' -e "s#^$HOME#~#" -e 's#/\(\.\{0,1\}[^/]\)\([^/]*\)#/\1#g' -e 's#/$##'
end

function __bobthefish_git_project_dir -d 'Print the current git project base directory'
  [ "$theme_display_git" = 'no' ]; and return
  command git rev-parse --show-toplevel 2>/dev/null
end

function __bobthefish_hg_project_dir -d 'Print the current hg project base directory'
  [ "$theme_display_hg" = 'yes' ]; or return
  set d (pwd)
  while not [ $d = / ]
    if [ -e $d/.hg ]
      command hg root --cwd "$d" 2>/dev/null
      return
    end
    set d (dirname $d)
  end
end

function __bobthefish_project_pwd -d 'Print the working directory relative to project root'
  echo "$PWD" | sed -e "s#$argv[1]##g" -e 's#^/##'
end


# ===========================
# Segment functions
# ===========================

function __bobthefish_start_segment -d 'Start a prompt segment'
  set -l bg $argv[1]
  set -e argv[1]
  set -l fg $argv[1]
  set -e argv[1]

  set_color normal # clear out anything bold or underline...
  set_color -b $bg
  set_color $fg $argv
  if [ "$__bobthefish_current_bg" = 'NONE' ]
    # If there's no background, just start one
    echo -n ' '
  else
    # If there's already a background...
    if [ "$bg" = "$__bobthefish_current_bg" ]
      # and it's the same color, draw a separator
      echo -n "$__bobthefish_right_arrow_glyph "
    else
      # otherwise, draw the end of the previous segment and the start of the next
      set_color $__bobthefish_current_bg
      echo -n "$__bobthefish_right_black_arrow_glyph "
      set_color $fg $argv
    end
  end
  set __bobthefish_current_bg $bg
end

function __bobthefish_path_segment -d 'Display a shortened form of a directory'
  if [ -w "$argv[1]" ]
    __bobthefish_start_segment $__bobthefish_dk_grey $__bobthefish_med_grey
  else
    __bobthefish_start_segment $__bobthefish_dk_red $__bobthefish_lt_red
  end

  set -l directory
  set -l parent

  switch "$argv[1]"
    case /
      set directory '/'
    case "$HOME"
      set directory '~'
    case '*'
      set parent    (__bobthefish_pretty_parent "$argv[1]")
      set parent    "$parent/"
      set directory (basename "$argv[1]")
  end

  [ "$parent" ]; and echo -n -s "$parent"
  set_color fff --bold
  echo -n "$directory "
  set_color normal
end

function __bobthefish_finish_segments -d 'Close open prompt segments'
  if [ -n $__bobthefish_current_bg -a $__bobthefish_current_bg != 'NONE' ]
    set_color -b normal
    set_color $__bobthefish_current_bg
    echo -n "$__bobthefish_right_black_arrow_glyph "
    set_color normal
  end
  set -g __bobthefish_current_bg NONE
end


# ===========================
# Theme components
# ===========================

function __bobthefish_prompt_status -d 'Display symbols for a non zero exit status, root and background jobs'
  set last_status $status

  set -l nonzero
  set -l superuser
  set -l bg_jobs

  # Last exit was nonzero
  if [ $last_status -ne 0 ]
    set nonzero 1
  end

  # if superuser (uid == 0)
  set -l uid (id -u $USER)
  if [ $uid -eq 0 ]
    set superuser 1
  end

  # Jobs display
  set num_jobs (jobs -l | wc -l)
  if [ $num_jobs -gt 0 ]
    set bg_jobs 1
  end

  if [ "$nonzero" -o "$superuser" -o "$bg_jobs" ]
    __bobthefish_start_segment $__bobthefish_ruby_red fff --bold
    if [ "$nonzero" ]
      echo -n -s $last_status ' '
    end

    if [ "$superuser" ]
      echo -n -s $__bobthefish_superuser_glyph ' '
    end

    if [ "$bg_jobs" ]
      echo -n -s $__bobthefish_bg_job_glyph $num_jobs ' '
    end

    set_color normal
  end
end

function  __bobthefish_prompt_ssh -d 'Display a symbol indicating whether the user is in an SSH session'
  if [ -n "$SSH_CLIENT" ]
    __bobthefish_start_segment $__bobthefish_dk_grey $__bobthefish_lt_orange --bold
    echo -n -s (hostname) ' '
  end
end

function __bobthefish_prompt_user -d 'Display actual user if different from $default_user'
  if [ "$theme_display_user" = 'yes' ]
    if [ "$USER" != "$default_user" -o -n "$SSH_CLIENT" ]
      __bobthefish_start_segment $__bobthefish_lt_grey $__bobthefish_slate_blue
      echo -n -s (whoami) '@' (hostname | cut -d . -f 1) ' '
    end
  end
end

function __bobthefish_prompt_hg -d 'Display the actual hg state'
  set -l dirty (command hg stat; or echo -n '*')

  set -l flags "$dirty"
  [ "$flags" ]; and set flags ""

  set -l flag_bg $__bobthefish_lt_green
  set -l flag_fg $__bobthefish_dk_green
  if [ "$dirty" ]
    set flag_bg $__bobthefish_med_red
    set flag_fg fff
  end

  __bobthefish_path_segment $argv[1]

  __bobthefish_start_segment $flag_bg $flag_fg
  echo -n -s $__bobthefish_hg_glyph ' '

  __bobthefish_start_segment $flag_bg $flag_fg --bold
  echo -n -s (__bobthefish_hg_branch) $flags ' '
  set_color normal

  set -l project_pwd  (__bobthefish_project_pwd $argv[1])
  if [ "$project_pwd" ]
    if [ -w "$PWD" ]
      __bobthefish_start_segment 333 999
    else
      __bobthefish_start_segment $__bobthefish_med_red $__bobthefish_lt_red
    end

    echo -n -s $project_pwd ' '
  end
end

function __bobthefish_prompt_git -d 'Display the actual git state'
  set -l dirty   (command git diff --no-ext-diff --quiet --exit-code; or echo -n '*')
  set -l staged  (command git diff --cached --no-ext-diff --quiet --exit-code; or echo -n '~')
  set -l stashed (command git rev-parse --verify --quiet refs/stash >/dev/null; and echo -n '$')
  set -l ahead   (command git rev-list --left-right '@{upstream}...HEAD' 2>/dev/null | awk '/>/ {a += 1} /</ {b += 1} {if (a > 0) nextfile} END {if (a > 0 && b > 0) print "±"; else if (a > 0) print "+"; else if (b > 0) print "-"}')

  set -l new (command git ls-files --other --exclude-standard);
  [ "$new" ]; and set new '…'

  set -l flags   "$dirty$staged$stashed$ahead$new"
  [ "$flags" ]; and set flags " $flags"

  set -l flag_bg $__git_clean_bg
  set -l flag_fg $__git_clean_fg
  if [ "$dirty" -o "$staged" ]
    set -l flag_bg $__git_staged_bg
    set -l flag_fg $__git_staged_fg
  end

  __bobthefish_path_segment $argv[1]

  __bobthefish_start_segment $flag_bg $flag_fg --bold
  echo -n -s (__bobthefish_git_branch) $flags ' '
  set_color normal

  set -l project_pwd  (__bobthefish_project_pwd $argv[1])
  if [ "$project_pwd" ]
    if [ -w "$PWD" ]
      __bobthefish_start_segment 333 999
    else
      __bobthefish_start_segment $__bobthefish_med_red $__bobthefish_lt_red
    end

    echo -n -s $project_pwd ' '
  end
end

function __bobthefish_prompt_dir -d 'Display a shortened form of the current directory'
  __bobthefish_path_segment "$PWD"
end

function __bobthefish_virtualenv_python_version -d 'Get current python version'
  set -l python_version (readlink (which python))
  switch "$python_version"
    case 'python2*'
      echo $__bobthefish_superscript_glyph[2]
    case 'python3*'
      echo $__bobthefish_superscript_glyph[3]
    case 'pypy*'
      echo $__bobthefish_pypy_glyph
  end
end

function __bobthefish_prompt_virtualfish -d "Display activated virtual environment (only for virtualfish, virtualenv's activate.fish changes prompt by itself)"
  [ "$theme_display_virtualenv" = 'no' -o -z "$VIRTUAL_ENV" ]; and return
  set -l version_glyph (__bobthefish_virtualenv_python_version)
  if [ "$version_glyph" ]
    __bobthefish_start_segment $__bobthefish_med_blue $__bobthefish_lt_grey
    echo -n -s $__bobthefish_virtualenv_glyph $version_glyph
  end
  __bobthefish_start_segment $__bobthefish_med_blue $__bobthefish_lt_grey --bold
  echo -n -s (basename "$VIRTUAL_ENV") ' '
  set_color normal
end

function __bobthefish_prompt_rubies -d 'Display current Ruby (rvm/rbenv)'
  [ "$theme_display_ruby" = 'no' ]; and return
  set -l ruby_version
  if type rvm-prompt >/dev/null
    set ruby_version (rvm-prompt i v g)
  else if type rbenv >/dev/null
    set ruby_version (rbenv version-name)
    # Don't show global ruby version...
    [ "$ruby_version" = (rbenv global) ]; and return
  end
  [ -z "$ruby_version" ]; and return

  __bobthefish_start_segment $__bobthefish_ruby_red $__bobthefish_lt_grey --bold
  echo -n -s $ruby_version ' '
  set_color normal
end


# ===========================
# Apply theme
# ===========================

function fish_prompt -d 'bobthefish, a fish theme optimized for awesome'
  __bobthefish_prompt_status
  __bobthefish_prompt_ssh
  __bobthefish_prompt_user
  __bobthefish_prompt_rubies
  __bobthefish_prompt_virtualfish

  set -l git_root (__bobthefish_git_project_dir)
  set -l hg_root  (__bobthefish_hg_project_dir)
  if [ (echo "$hg_root" | wc -c) -gt (echo "$git_root" | wc -c) ]
    __bobthefish_prompt_hg $hg_root
  else if [ "$git_root" ]
    __bobthefish_prompt_git $git_root
  else
    __bobthefish_prompt_dir
  end
  __bobthefish_finish_segments
end
