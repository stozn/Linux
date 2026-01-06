#!/bin/bash

BASHRC="$HOME/.bashrc"

# 提示用户输入代理地址
read -p "请输入代理地址（例如 http://127.0.0.1:7890）: " PROXY_HOST

# 验证输入是否为空
if [[ -z "$PROXY_HOST" ]]; then
    echo "错误：代理地址不能为空！"
    exit 1
fi

# 检查是否已经存在 proxy 函数
if grep -q '^proxy()' "$BASHRC"; then
    echo "proxy 函数已存在于 $BASHRC"
    exit 0
fi

# 添加带自定义代理地址的 proxy 函数到 .bashrc
cat << EOF >> "$BASHRC"

# Proxy function (on/off)
proxy() {
    local PROXY_HOST="$PROXY_HOST"

    case "\$1" in
        on)
            export http_proxy="\$PROXY_HOST"
            export https_proxy="\$PROXY_HOST"
            git config --global http.proxy "\$PROXY_HOST"
            git config --global https.proxy "\$PROXY_HOST"
            echo "代理已开启：\$PROXY_HOST"
            ;;
        off)
            unset http_proxy
            unset https_proxy
            git config --global --unset http.proxy 2>/dev/null || true
            git config --global --unset https.proxy 2>/dev/null || true
            echo "代理已关闭"
            ;;
        *)
            echo "Usage: proxy {on|off}"
            return 1
            ;;
    esac
}
EOF

echo "proxy 函数已添加到 $BASHRC"
echo "请运行以下命令加载新配置：source ~/.bashrc"