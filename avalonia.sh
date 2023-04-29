#!/bin/bash

# Avalonia projects default location
default_location="$HOME/Development/3_csharp/Avalonia"

# Functions to create a Avalonia project
create_new_avalonia() {
    dotnet new avalonia.mvvm -o "$save_location/$nameOfMyProject"
}

create_new_avalonia_latest() {
    dotnet new avalonia.mvvm -o "$save_location/$nameOfMyProject" -av 11.0.0-preview5
}

create_new_avalonia_community() {
    dotnet new avalonia.mvvm -o "$save_location/$nameOfMyProject" -m CommunityToolkit
}

create_new_avalonia_community_latest() {
    dotnet new avalonia.mvvm -o "$save_location/$nameOfMyProject" -m CommunityToolkit -av 11.0.0-preview5
}

# Function to delete a Project in the default directory.
# Function to delete a Project in the default directory.
delete_project() {
    file_count=$(find "$default_location" -maxdepth 1 -type d | wc -l)

    if [[ $file_count -eq 1 ]]; then
        echo "The folder '$default_location' is empty."
        echo
    else
        echo "List of projects in: $default_location"
        echo
        ls "$default_location"
        read -p "Enter the name of the project you want to delete: " project_to_delete
        read -p "Are you sure you want to delete '$project_to_delete'? [y/yes | n/no]: " confirm_delete

        if [[ "$confirm_delete" == "y" ]] || [[ "$confirm_delete" == "yes" ]]; then
            rm -rf "$default_location/$project_to_delete"
            echo "Project '$project_to_delete' deleted."
            echo
        else
            echo "Project deletion canceled."
        fi
    fi
}

# Main menu
while true; do
    echo "Choose an action:"
    echo "1) Create a new Avalonia project"
    echo "2) Delete an existing Avalonia project"
    echo "0) Exit"
    read -p "Enter your choice: " menu_choice
    echo

    case $menu_choice in
        1)
            # Code for creating a new Avalonia project
            # Read what the name of the project should be
            read -p "Name of the project: " nameOfMyProject
            echo

            # Avalonia projects default location
            default_location="$HOME/Development/3_csharp/Avalonia"
            echo
            # Check which path the project should be in
            echo "Default path is: $default_location. "
            echo -n "Change path? If not, press enter (otherwise, provide a new path): "
            read custom_location
            echo

            # Set the path
            if [[ -z "$custom_location" ]]; then
                save_location="$default_location"
            else
                save_location="$custom_location"
            fi

            echo "Choose a project type:"
            echo "1) new-avalonia (Default MVVM Project using the stable version)"
            echo "2) new-avalonia-latest (MVVM Project using the latest available preview version)"
            echo "3) new-avalonia-community (MVVM Project using the stable version + community toolkit)"
            echo "4) new-avalonia-community-latest (MVVM Project using the latest available preview version + community toolkit)"
            read -p "Enter the number corresponding to the project type: " project_type
            echo

            case $project_type in
                1) create_new_avalonia ;;
                2) create_new_avalonia_latest ;;
                3) create_new_avalonia_community ;;
                4) create_new_avalonia_community_latest ;;
                *) echo "Invalid choice" ;;
            esac

            echo -n "Do you want to open the project with JetBrains Rider? [y/yes | n/no]: "
            read open_with_rider

            if [[ "$open_with_rider" == "y" ]] || [[ "$open_with_rider" == "yes" ]]; then
                rider "$save_location/$nameOfMyProject/$nameOfMyProject.csproj" &
            elif [[ "$open_with_rider" == "n" ]] || [[ "$open_with_rider" == "no" ]]; then
                echo "Exiting script."
                exit 0
            fi
        ;;
        2)
            delete_project
        ;;
        0)
            exit 0
        ;;
        *)
            echo "Invalid choice"
        ;;
    esac
    echo
done