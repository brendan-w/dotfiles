function mkproj --description 'copies the requested template files from ~/dotfiles/.templates'

    set -l TEMPLATES ~/dotfiles/.templates

    if test (count $argv) -ne 1
        echo "Usage: mkproj <type>"
        ls -1 $TEMPLATES
        return
    end

    if test -d "$TEMPLATES/$argv"
        cp -v -r $TEMPLATES/$argv/* $TEMPLATES/$argv/.* ./
    else
        echo "'$argv' is not a template in ~/dotfiles/.templates"
        echo "You want one of these:"
        ls -1 $TEMPLATES
    end
end
