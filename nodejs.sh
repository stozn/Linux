#!/bin/bash

# 安装nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

nvm install --lts
npm install -g nrm --registry=https://mirrors.tencent.com/npm/
nrm test
# nrm use 最低延迟的源 
