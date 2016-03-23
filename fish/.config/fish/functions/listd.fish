function listd --description 'lists the contents of the directory stack'
	echo $dirstack | tr ' ' '\n'
end
