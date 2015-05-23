function bugzap --description "deletes temporary files from other OS's"

	# set these
	set directories ".fseventsd" ".Spotlight-V100" ".Trash-1000" ".Trashes"
	set files "._.Trashes" ".DS_Store" "Thumbs.db"


	# test for the "zap" command to remove the files
	# otherwise, this script simply prints the files it finds
	if [ (count $argv) -eq 1 ]
		if [ $argv = "zap" ]
			set dir_exec -exec rm -rf \{\} \;
			set file_exec -delete
			set echo_prefix "deleted    "
		else
			# help
			echo "Usage:"
			echo ""
			echo \t"bugzap          lists files/dirs to be zapped"
			echo \t"bugzap zap      deletes files/dirs"
			return
		end
	else
		set echo_prefix ""
	end

	# run the finds

	for dir in $directories
		# stderr to /dev/null, since find tries to operate on non-existant directory contents
		find ./ -type d -name "$dir" -exec echo $echo_prefix\{\} \; $dir_exec 2> /dev/null
	end

	for file in $files
		find ./ -type f -name "$file" -exec echo $echo_prefix\{\} \; $file_exec
	end

end
