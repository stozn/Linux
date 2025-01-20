#!/bin/bash

# git使用代理
git config --global http.proxy http://172.31.176.1:7890
git config --global https.proxy https://172.31.176.1:7890

# 取消使用代理
git config --global --unset http.proxy
git config --global --unset https.proxy


# 系统使用代理
export http_proxy=http://172.31.176.1:7890
export https_proxy=http://172.31.176.1:7890

# 取消使用代理
unset http_proxy
unset https_proxy