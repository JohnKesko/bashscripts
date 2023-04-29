#!/bin/bash

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

# Read what the name of the project should be
read -p "Name of the project: " nameOfMyProject

# Avalonia projects default location
default_location="$HOME/Development/3_csharp/Avalonia"

# Check which path the project should be in
echo "Default path is: $default_location. "
echo -n "Change path? If not, press enter otherwise provide a new path: "
read custom_location

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

case $project_type in
    1) create_new_avalonia ;;
    2) create_new_avalonia_latest ;;
    3) create_new_avalonia_community ;;
    4) create_new_avalonia_community_latest ;;
    *) echo "Invalid choice" ;;
esac

echo -n "Do you want to open the project with JetBrains Rider? [y/yes]: "
read open_with_rider

if [[ "$open_with_rider" == "y" ]] || [[ "$open_with_rider" == "yes" ]]; then
    rider "$save_location/$nameOfMyProject/$nameOfMyProject.csproj" &
fi
