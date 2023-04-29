#!/bin/bash

read -p "Name of the project: " nameOfMyProject

default_location="$HOME/path/to/avaloniaprojectsfolder"
echo -n "Default path is: $default_location. Change path? If not, press Enter otherwise provide a new path: "
read custom_location

if [[ -z "$custom_location" ]]; then
    save_location="$default_location"
else
    save_location="$custom_location"
fi

if [[ "$1" == "new-avalonia-latest" ]]; then
    dotnet new avalonia.mvvm -o "$save_location/$nameOfMyProject" -m CommunityToolkit -av 11.0.0-preview5
else
    dotnet new avalonia.mvvm -o "$save_location/$nameOfMyProject" -m CommunityToolkit
fi

echo -n "Do you want to open the project with JetBrains Rider? [y/yes]: "
read open_with_rider

if [[ "$open_with_rider" == "y" ]] || [[ "$open_with_rider" == "yes" ]]; then
    rider "$save_location/$nameOfMyProject/$nameOfMyProject.csproj" &
fi
