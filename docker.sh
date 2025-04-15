#!/bin/bash

# 安装依赖
sudo apt update
sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common -y


# 安装Docker
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://mirrors.sustech.edu.cn/docker-ce/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://mirrors.sustech.edu.cn/docker-ce/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo usermod -aG docker $USER

# Docker换源
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": [
    "https://docker.m.daocloud.io",
    "https://dockerpull.cn",
    "https://docker.1panel.top",
    "https://docker.1ms.run",
    "https://docker.13140521.xyz"
  ]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

echo "重新登陆生效"