#!/bin/bash

sudo apt update
sudo apt install openssh-server

# 开启仅公钥认证
sudo sed -i 's/^#\?PubkeyAuthentication.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication no/' /etc/ssh/sshd_config

sudo systemctl restart ssh


# WSL 开启端口转发，本地端口 22 映射到 WSL 的 22 端口
# 使用管理员身份运行Powershell，运行下面两条命令：
# netsh interface portproxy add v4tov4 listenaddress=0.0.0.0 listenport=22 connectaddress=IP connectport=22     # IP为你的WSL的IP地址（可以通过 `ifconfig` 命令获取，一般以172.31开头）
# netsh advfirewall firewall add rule name=WSL2 dir=in action=allow protocol=TCP localport=22                   # 防火墙规则，允许端口22的入站连接
