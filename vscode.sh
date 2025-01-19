#!/bin/bash

# 安装VSCode及开发工具
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

sudo apt update
sudo apt upgrade -y
sudo apt install numlockx ca-certificates curl build-essential python3-pip gdb git cmake tmux baobab code -y

sudo sed -i 's/^NUMLOCK=.*/NUMLOCK=on/' /etc/default/numlockx
baobab
code