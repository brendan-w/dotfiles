function to_audio --description "converts video files to audio (using the same encoding)"

	if test (count $argv) -eq 2
		ffmpeg -i $argv[1] -vn -codec copy $argv[2]
	else
		echo "Usage:"
		echo \t"to_audio <in-file> <out-file>"
	end
end
