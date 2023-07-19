#!/usr/bin/env bash

CONFIG_FILE='dotfiles_config'
echo "Starting script to save dotfiles.."

echo "Check config file.."
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Error: Config file ('$CONFIG_FILE') not found!"
    exit 1
fi
echo "Config file is fine!"

echo "Start to save dotfiles.."
while IFS="" read -r file || [ -n "$file" ]
do
    echo "Searching file: $file"
    if [ -e "$file" ]; then
        filename=$(basename "$file")
        ln -s "$file" "./$filename"
        echo "Symlink to '$file' was successfully created as '$filename'"
    else
        echo "Error: The file or folder '$file' was not found. Symlink not created."
    fi
done <$CONFIG_FILE
echo "End of script"