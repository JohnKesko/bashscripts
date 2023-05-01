#!/bin/bash

# VSCode default location for extensions
default_location="$HOME/.vscode/extensions"

# Function to delete the selected extension
delete_selected_extension() {
  local selected_extension=$1
  if [ -d "${default_location}/${selected_extension}" ]; then
    rm -rf "${default_location}/${selected_extension}"
    echo "Deleted the extension: ${selected_extension}"
  else
    echo "Extension not found: ${selected_extension}"
  fi
}

# Function to delete a single extension
delete_single_extension() {
  extensions=()

  for extension in "${default_location}"/*; do
    extensions+=("$(basename "${extension}")")
  done

  # Display extensions in two columns
  echo
  echo "Select the extension you want to delete:"
  echo
  printf "%-4s %-50s %-4s %-50s\n" "No." "Extension" "No." "Extension"
  printf "%-4s %-50s %-4s %-50s\n" "----" "--------" "----" "--------"

  for ((i=0; i<${#extensions[@]}; i+=2)); do
    printf "%-4d %-50s %-4d %-50s\n" "$((i+1))" "${extensions[i]}" "$((i+2))" "${extensions[i+1]}"
  done

  # Read user input
  echo
  read -p "Enter the number of the extension to delete: " index

  if [[ $index -ge 1 && $index -le ${#extensions[@]} ]]; then
    selected_extension="${extensions[$((index-1))]}"
    delete_selected_extension "$selected_extension"
  else
    echo "Invalid selection. Please choose a valid number from the list."
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
echo
read -p "Enter your choice (1 or 2): " choice

case $choice in
  1)
    delete_single_extension
    ;;
  2)
    delete_all_extensions
    ;;
  *)
    echo "Invalid option. Exiting."
    ;;
esac
