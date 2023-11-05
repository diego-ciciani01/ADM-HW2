cat series.json |
jq -r 'select(.works) | .works |= map(select(.books_count)) | {id: .id, title: .title, total_books: (.works | map(.books_count | tonumber) | add)}' |
jq -s 'sort_by(-.total_books) | .[:5]' |
awk '{
    printf "{\n"
    printf "  id: %s,\n", $0.id
    printf "  title: %s,\n", $0.title
    printf "  total_books: %s\n", $0.total_books
    printf "}\n"
}'

