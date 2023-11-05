cat series.json | jq -r 'select(.works) | .works |= map(select(.books_count)) | {id: .id, title: .title, total_books: (.works | map(.books_count | tonumber) | add)}' | jq -s 'sort_by(-.total_books) | .[:5]'

