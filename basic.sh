#!/bin/bash

# 更换Ubuntu软件源
echo '# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
deb https://mirrors.sustech.edu.cn/ubuntu/ jammy main restricted universe multiverse
# deb-src https://mirrors.sustech.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb https://mirrors.sustech.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
# deb-src https://mirrors.sustech.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb https://mirrors.sustech.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
# deb-src https://mirrors.sustech.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse

# 以下安全更新软件源包含了官方源与镜像站配置，如有需要可自行修改注释切换
deb https://mirrors.sustech.edu.cn/ubuntu/ jammy-security main restricted universe multiverse
# deb-src https://mirrors.sustech.edu.cn/ubuntu/ jammy-security main restricted universe multiverse

# deb http://security.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse
# # deb-src http://security.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse

# 预发布软件源，不建议启用
# deb https://mirrors.sustech.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
# # deb-src https://mirrors.sustech.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
' | sudo tee /etc/apt/sources.list


# 更新软件
sudo apt update
sudo apt upgrade -y
sudo apt install wget ca-certificates curl build-essential gdb git cmake tmux tree -y
