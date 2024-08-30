#!/bin/bash

initdb_file="./initdb.sql"
database_dir="../database"

temp_file=$(mktemp)

# Concat SQL files in the following order:
cat "$database_dir/init.sql" >> "$temp_file"
cat "$database_dir/tables/state.sql" >> "$temp_file"
cat "$database_dir/tables/next_state.sql" >> "$temp_file"
cat "$database_dir/tables/user.sql" >> "$temp_file"
cat "$database_dir/tables/plate.sql" >> "$temp_file"
cat "$database_dir/tables/order.sql" >> "$temp_file"
cat "$database_dir/tables/plate_order.sql" >> "$temp_file"
cat "$database_dir/tables/review.sql" >> "$temp_file"
cat "$database_dir/sample.sql" >> "$temp_file"

# Replace the original initdb.sql with the combined content
mv "$temp_file" "$initdb_file"

# Cleanup the temporary file
rm -f "$temp_file"

echo "SQL files merged into $initdb_file"
