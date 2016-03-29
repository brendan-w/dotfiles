function spell --description 'pipes stuff to aspell'
	echo "$argv" | aspell pipe | tail -n +2
end
