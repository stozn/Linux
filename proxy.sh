#!/bin/bash

# 定义代理地址和端口
PROXY_HOST="http://192.168.1.102:7890"

# 函数：设置代理
set_proxy() {
    export http_proxy=$PROXY_HOST
    export https_proxy=$PROXY_HOST
    git config --global http.proxy $PROXY_HOST
    git config --global https.proxy $PROXY_HOST
    echo "代理已设置：$PROXY_HOST"
}

# 函数：取消代理
unset_proxy() {
    unset http_proxy
    unset https_proxy
    git config --global --unset http.proxy
    git config --global --unset https.proxy
    echo "代理已取消"
}

# 检查输入参数
if [ "$1" == "on" ]; then
    set_proxy
elif [ "$1" == "off" ]; then
    unset_proxy
else
    echo "用法: $0 {set|unset}"
    echo "  on   - 设置代理"
    echo "  off - 取消代理"
    exit 1
fi
