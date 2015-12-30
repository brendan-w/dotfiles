function m --description 'wrapper for man'
	# colored man pages
    set -x LESS_TERMCAP_mb (set_color -o blue)             # begin blinking
    set -x LESS_TERMCAP_md (set_color -o blue)             # begin bold
    set -x LESS_TERMCAP_me (set_color normal)              # end mode
    set -x LESS_TERMCAP_se (set_color normal)              # end standout-mode
    set -x LESS_TERMCAP_so (set_color -b white -o black)   # begin standout-mode - info box
    set -x LESS_TERMCAP_ue (set_color normal)              # end underline
    set -x LESS_TERMCAP_us (set_color -o blue)             # begin underline

    man $argv ; or apropos $argv
end
