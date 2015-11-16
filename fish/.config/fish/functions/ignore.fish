function ignore --description 'creates .gitignore files'
	curl --silent "https://www.gitignore.io/api/"(echo $argv | tr -s ' ' ',') > .gitignore
end
