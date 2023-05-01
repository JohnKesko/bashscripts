#!/bin/bash

# VSCode default location for extensions
default_location="$HOME/.vscode/extensions"

# Function to display extensions in two columns
list_extensions() {
  extensions=()

  for extension in "${default_location}"/*; do
    extensions+=("$(basename "${extension}")")
  done
  echo
  echo "All extensions:"
  echo
  printf "%-50s %-50s\n" "***" "***"
  printf "%-50s %-50s\n" "-------" "-------"

  for ((i=0; i<${#extensions[@]}; i+=2)); do
    printf "%-50s %-50s\n" "${extensions[i]}" "${extensions[i+1]}"
  done
}

# Function to delete a single extension
delete_single_extension() {
  echo
  read -p "Enter the extension you want to delete: " extension

  if [ -d "${default_location}/${extension}" ]; then
    rm -rf "${default_location}/${extension}"
    echo "Deleted the extension: ${extension}"
  else
    echo "Extension not found: ${extension}"
  fi
}

# Function to delete all extensions
delete_all_extensions() {
  for extension in "${default_location}"/*; do
    rm -rf "${extension}"
  done
  echo "All extensions have been deleted."
}

# Main script
echo
echo "Choose an option:"
echo "1. Delete a single extension"
echo "2. Delete all extensions"
read -p "Enter your choice (1 or 2): " choice

case $choice in
  1)
    list_extensions
    delete_single_extension
    ;;
  2)
    delete_all_extensions
    ;;
  *)
    echo "Invalid option. Exiting."
    ;;
esac
