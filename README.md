## Bash-scripts


***
***avalonia.sh*** | Simple script to create a Avalonia MVVM project with a default location and start it with rider.


1. Create a folder for your Avalonia projects somewhere.

2. Edit the avalonia.sh to the new path.
```
# Avalonia projects default location
default_location="$HOME/Path/To/Avalonia"
```

3. Add alias for the terminal. 
- Example: nano .zshrc
```    
# Create Avalonia Apps
alias new-avalonia="/path/to/scripts/new-avalonia.sh"
```
4. Restart terminal.

5. Done.

![screenshot](img/screenshot-avalonia.png)

***

***vscode-extensions.sh*** | Simple script to remove vscode extensions, either a single one or all of them.

1. Assuming default location: ```default_location="$HOME/.vscode/extensions"```
2. Add alias for the terminal. 
- Example: nano .zshrc
```    
# Create Avalonia Apps
alias delete-vscode-extensions="/path/to/scripts/vscode-extensions.sh"
```
3. Restart terminal.

![screenshot](img/screenshot-vscode.png)
