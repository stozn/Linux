#!/bin/bash

# 检测服务是否存在
check_service_exists() {
    local service_name=$1
    if systemctl list-unit-files | grep -q "^${service_name}.service"; then
        return 0 # 存在
    else
        return 1 # 不存在
    fi
}

# 主程序开始
read -p "请输入服务名称: " service_name

if [[ -z "$service_name" ]]; then
    echo "服务名称不能为空！"
    exit 1
fi

# 检查服务文件是否已存在
if check_service_exists "$service_name"; then
    read -p "服务名称已存在，是否覆盖？(y/n): " overwrite
    if [[ "$overwrite" != "y" && "$overwrite" != "Y" ]]; then
        echo "操作已取消。"
        exit 0
    fi
fi

# 获取完整命令
read -p "请输入完整的启动命令: " full_command

program_path=$(echo "$full_command" | awk '{print $1}')
if [[ ! -f "$program_path" ]]; then
    echo "程序路径无效或文件不存在！"
    exit 1
fi

# 是否启用自动重启
read -p "是否启用自动重启功能？(y/n): " enable_restart
restart_config=""
if [[ "$enable_restart" == "y" || "$enable_restart" == "Y" ]]; then
    read -p "请输入重启间隔时间（秒，默认5秒）: " restart_sec
    restart_sec=${restart_sec:-5} # 默认值为5秒
    restart_config="Restart=always\nRestartSec=${restart_sec}"
fi

# 构建服务文件内容
service_content="[Unit]
Description=${service_name} service
After=network.target syslog.target
Wants=network.target

[Service]
Type=simple
ExecStart=$full_command
${restart_config}

[Install]
WantedBy=multi-user.target"

# 创建服务文件
service_file="/etc/systemd/system/${service_name}.service"
echo -e "$service_content" | sudo tee "$service_file" > /dev/null

if [[ $? -eq 0 ]]; then
    echo "服务文件已成功创建：$service_file"
else
    echo "服务文件创建失败！"
    exit 1
fi

# 重新加载 systemd 配置
sudo systemctl daemon-reload

# 启动服务
sudo systemctl start "$service_name"

# 设置开机自启
sudo systemctl enable "$service_name"

# 显示服务状态
sudo systemctl status "$service_name"