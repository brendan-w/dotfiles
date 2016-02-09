function ignore --description 'creates .gitignore files'

    # if no arguments, pull a listing of languages
    if test (count $argv) -eq 0
        set url "https://www.gitignore.io/dropdown/templates.json"
        curl --silent $url | grep --only-matching "\"text\":\"[a-zA-Z]*\"" | cut -d\" --field 4 | sort | eval $PAGER
        return
    end

    curl --silent "https://www.gitignore.io/api/"(echo $argv | tr -s ' ' ',') >> .gitignore
end
