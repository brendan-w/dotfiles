function cds --description "changes directories, and lists its contents"

    cd $argv

    if [ (ls -1 | wc -l) -gt 100 ]
        echo "more than 100 files, skipping \"ls\""
    else
        ls
    end

end
