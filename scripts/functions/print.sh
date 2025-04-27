#! /usr/bin/env bash

function print_highlighted() {
    local input="$*"
    local padding=1  # spaces padding on each side of the text inside the box

    # Calculate the total length of the text line with padding and hashes
    local text_length=${#input}
    local total_length=$(( text_length + padding * 2 + 2 ))  # 2 for the hashes on each side

    # Create the top and bottom border line of hashes
    local border_line
    border_line=$(printf '%*s' "$total_length" '' | tr ' ' '#')

    # Create the middle line with hashes and padded text
    # Pad text with spaces on both sides
    local middle_line="#"
    middle_line+="$(printf '%*s' "$padding" '')"
    middle_line+="$input"
    middle_line+="$(printf '%*s' "$padding" '')"
    middle_line+="#"

    # Output the box
    echo "$border_line"
    echo "$middle_line"
    echo "$border_line"
}
