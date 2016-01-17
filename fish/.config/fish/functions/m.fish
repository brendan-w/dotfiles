function m --description 'wrapper for man'
	# colored man pages
    set -xl LESS_TERMCAP_mb (set_color -o blue)             # begin blinking
    set -xl LESS_TERMCAP_md (set_color -o blue)             # begin bold
    set -xl LESS_TERMCAP_me (set_color normal)              # end mode
    set -xl LESS_TERMCAP_se (set_color normal)              # end standout-mode
    set -xl LESS_TERMCAP_so (set_color -b white -o black)   # begin standout-mode - info box
    set -xl LESS_TERMCAP_ue (set_color normal)              # end underline
    set -xl LESS_TERMCAP_us (set_color -o blue)             # begin underline

    man $argv ; or apropos $argv
end
