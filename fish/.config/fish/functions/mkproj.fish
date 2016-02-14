function mkproj --description 'copies the requested template files from ~/dotfiles/.templates'

    set -l TEMPLATES ~/dotfiles/.templates

    if test (count $argv) -ne 1
        echo "Usage: mkproj <type>"
        ls -1 $TEMPLATES
        return
    end

    if test -d "$TEMPLATES/$argv"
        cp -r $TEMPLATES/$argv/* $TEMPLATES/$argv/.* ./

        # if there's a gitignore, use ignore() to expand it
        if test -e .gitignore
            set -l langs (cat .gitignore)
            wipe .gitignore # wipe the fake gitignore
            ignore $langs # download the appropriate ignore rules
        end
    else
        echo "'$argv' is not a template in ~/dotfiles/.templates"
    end
end
