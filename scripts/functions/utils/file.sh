#! /usr/bin/env bash

append_lines() {
    local source_file="$1"
    local target_file="$2"
    local tmp_file

    # Check if source file exists
    if [[ ! -f "$source_file" ]]; then
        echo "Source file not found: $source_file"
        return 1
    fi

    # Check if target file exists
    if [[ ! -f "$target_file" ]]; then
        echo "Target file not found: $target_file"
        return 1
    fi

    # Create a temporary file for safe editing
    tmp_file=$(mktemp) || { echo "Failed to create temp file"; return 1; }

    # Copy target_file content to tmp_file initially
    cp "$target_file" "$tmp_file"

    # Process each line in source_file
    while IFS= read -r line || [[ -n "$line" ]]; do
        # Skip empty lines (optional)
        [[ -z "$line" ]] && continue

        # Remove all exact matches of the line from the tmp_file
        # Using grep -vFx to exclude the line
        grep -vFx -- "$line" "$tmp_file" > "${tmp_file}.new" && mv "${tmp_file}.new" "$tmp_file"

        # Append the line at the end of tmp_file
        echo "$line" >> "$tmp_file"
    done < "$source_file"

    sudo mv "$tmp_file" "$target_file"

    echo "Appended content of $source_file to $target_file"
}
