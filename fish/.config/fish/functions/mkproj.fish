function mkproj --description 'copies the requested template files from ~/dotfiles/.templates'

    set -l TEMPLATES ~/dotfiles/.templates

    if test (count $argv) -ne 1
        echo "Usage: mkproj <type>"
        ls -1 $TEMPLATES
        return
    end

	if [ -d "$TEMPLATES/$argv" ]
		cp -r "$TEMPLATES/$argv/*" ./
	else
		echo "'$argv' is not a template in ~/dotfiles/.templates"
	end

end
