function mkproj --description 'copies the requested template files from ~/dotfiles/.templates'

	if [ -d ~/dotfiles/.templates/$argv ]
		cp -r ~/dotfiles/.templates/$argv/* ./
	else
		echo "'$argv' is not a template in ~/dotfiles/.templates"
	end

end
