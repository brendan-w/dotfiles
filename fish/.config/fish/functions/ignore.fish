function ignore --description 'creates .gitignore files'

    # if no arguments, pull a listing of languages
    if test (count $argv) -eq 0
        curl --silent "https://www.gitignore.io/dropdown/templates.json" | grep --only-matching "\"text\":\"[a-zA-Z]*\"" | cut -d\" --field 4 | less
        return
    end

    curl --silent "https://www.gitignore.io/api/"(echo $argv | tr -s ' ' ',') >> .gitignore
end
