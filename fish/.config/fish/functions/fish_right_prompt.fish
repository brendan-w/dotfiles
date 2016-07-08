function fish_right_prompt
    set_color 268
    date +"%a-%-d %b-%-m "
    set_color 777
    date +"%-I:%M%p"
    set_color normal
end
