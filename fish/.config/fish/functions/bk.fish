function bk --description 'moves up in the directory tree'
	if [ (count $argv) -ne 1 ]
		cd ../
	else
		for i in (seq $argv[1])
			cd ../
		end
	end
end
