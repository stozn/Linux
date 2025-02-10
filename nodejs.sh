#!/bin/bash

# 安装nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

nvm install --lts
npm install -g nrm --registry=https://mirrors.tencent.com/npm/
nrm test
# nrm use 最低延迟的源 