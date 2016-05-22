function on-file-change --description 'watches for file changes in the current directory'
    while inotifywait -r -q -e close_write *
        eval $argv
    end
end
