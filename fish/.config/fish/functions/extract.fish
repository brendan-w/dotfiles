function extract --description 'decompresses various archives'

	for file in $argv

		if [ -f $file ]
			switch $file
				case '*.tar.bz2';  tar xjf $file
				case '*.tar.gz';   tar xzf $file
				case '*.bz2';      bunzip2 $file
				case '*.rar';      unrar x $file
				case '*.gz';       gunzip $file
				case '*.tar';      tar xf $file
				case '*.tbz2';     tar xjf $file
				case '*.tgz';      tar xzf $file
				case '*.zip';      unzip $file
				case '*.Z';        uncompress $file
				case '*.7z';       7z x $file
				case '*';     echo "unrecognized file type"
			end
		else
			echo "'$file' skipped because it is not a file"
		end
	end

end
