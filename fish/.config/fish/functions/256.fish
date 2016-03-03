function 256 --description 'prints all 256 colors'
	for i in (seq 0 255);
        echo -n "$i "
        tput setaf $i;
        tput setab $i;
        echo -n "                              "
        set_color normal;
        echo ""
    end
end
