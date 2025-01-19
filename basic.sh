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


# 安装Miniconda
mkdir -p ~/miniconda3
wget https://mirrors.sustech.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u-h -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
source ~/miniconda3/bin/activate
conda init --all
source ~/.bashrc

# 更换Conda源
echo 'channels:
  - defaults
show_channel_urls: true
default_channels:
  - https://mirrors.sustech.edu.cn/anaconda/pkgs/main
  - https://mirrors.sustech.edu.cn/anaconda/pkgs/free
  - https://mirrors.sustech.edu.cn/anaconda/pkgs/r
  - https://mirrors.sustech.edu.cn/anaconda/pkgs/pro
  - https://mirrors.sustech.edu.cn/anaconda/pkgs/msys2
custom_channels:
  conda-forge: https://mirrors.sustech.edu.cn/anaconda/cloud
  msys2: https://mirrors.sustech.edu.cn/anaconda/cloud
  bioconda: https://mirrors.sustech.edu.cn/anaconda/cloud
  menpo: https://mirrors.sustech.edu.cn/anaconda/cloud
  pytorch: https://mirrors.sustech.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.sustech.edu.cn/anaconda/cloud
  nvidia: https://mirrors.sustech.edu.cn/anaconda-extra/cloud
' | sudo tee ~/.condarc


# 更换PyPI源
python -m pip install -i https://mirrors.sustech.edu.cn/pypi/web/simple --upgrade pip
pip config set global.index-url https://mirrors.sustech.edu.cn/pypi/web/simple

