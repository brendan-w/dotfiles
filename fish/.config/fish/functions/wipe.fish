function wipe --description "clears the contents of a file"
    for f in $argv
        if test -e $f
            echo -n > $f
        else
            echo "No such file: $f"
        end
    end
end
