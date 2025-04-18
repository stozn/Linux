#!/bin/bash

# 安装Miniconda
mkdir -p ~/miniconda3
wget https://mirrors.sustech.edu.cn/anaconda/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm ~/miniconda3/miniconda.sh
source ~/miniconda3/bin/activate
conda init --all
source ~/.bashrc
sudo chown $USER:$USER ~/.condarc

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
  MindSpore: https://mirrors.sustech.edu.cn/anaconda/cloud
  Paddle: https://mirrors.sustech.edu.cn/anaconda/cloud
  auto: https://mirrors.sustech.edu.cn/anaconda/cloud
  biobakery: https://mirrors.sustech.edu.cn/anaconda/cloud
  bioconda: https://mirrors.sustech.edu.cn/anaconda/cloud
  c4aarch64: https://mirrors.sustech.edu.cn/anaconda/cloud
  caffe2: https://mirrors.sustech.edu.cn/anaconda/cloud
  conda-forge: https://mirrors.sustech.edu.cn/anaconda/cloud
  deepmodeling: https://mirrors.sustech.edu.cn/anaconda/cloud
  dglteam: https://mirrors.sustech.edu.cn/anaconda/cloud
  fastai: https://mirrors.sustech.edu.cn/anaconda/cloud
  fermi: https://mirrors.sustech.edu.cn/anaconda/cloud
  idaholab: https://mirrors.sustech.edu.cn/anaconda/cloud
  intel: https://mirrors.sustech.edu.cn/anaconda/cloud
  matsci: https://mirrors.sustech.edu.cn/anaconda/cloud
  menpo: https://mirrors.sustech.edu.cn/anaconda/cloud
  mordred-descriptor: https://mirrors.sustech.edu.cn/anaconda/cloud
  msys2: https://mirrors.sustech.edu.cn/anaconda/cloud
  numba: https://mirrors.sustech.edu.cn/anaconda/cloud
  ohmeta: https://mirrors.sustech.edu.cn/anaconda/cloud
  omnia: https://mirrors.sustech.edu.cn/anaconda/cloud
  peterjc123: https://mirrors.sustech.edu.cn/anaconda/cloud
  plotly: https://mirrors.sustech.edu.cn/anaconda/cloud
  psi4: https://mirrors.sustech.edu.cn/anaconda/cloud
  pytorch: https://mirrors.sustech.edu.cn/anaconda/cloud
  pytorch-lts: https://mirrors.sustech.edu.cn/anaconda/cloud
  pytorch-test: https://mirrors.sustech.edu.cn/anaconda/cloud
  pytorch3d: https://mirrors.sustech.edu.cn/anaconda/cloud
  pyviz: https://mirrors.sustech.edu.cn/anaconda/cloud
  qiime2: https://mirrors.sustech.edu.cn/anaconda/cloud
  rapidsai: https://mirrors.sustech.edu.cn/anaconda/cloud
  rdkit: https://mirrors.sustech.edu.cn/anaconda/cloud
  simpleitk: https://mirrors.sustech.edu.cn/anaconda/cloud
  speleo3: https://mirrors.sustech.edu.cn/anaconda/cloud
  stackless: https://mirrors.sustech.edu.cn/anaconda/cloud
  ursky: https://mirrors.sustech.edu.cn/anaconda/cloud
  nvidia: https://mirrors.sustech.edu.cn/anaconda-extra/cloud
' > ~/.condarc


# 更换PyPI源
python -m pip install -i https://mirrors.sustech.edu.cn/pypi/web/simple --upgrade pip
pip config set global.index-url https://mirrors.sustech.edu.cn/pypi/web/simple

