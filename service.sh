#!/bin/bash

read -p "请输入服务名称: " service_name

if [[ -z "$service_name" ]]; then
    echo "服务名称不能为空！"
    exit 1
fi

read -p "请输入完整的命令: " full_command

program_path=$(echo "$full_command" | awk '{print $1}')
if [[ ! -f "$program_path" ]]; then
    echo "程序路径无效或文件不存在！"
    exit 1
fi

service_content="[Unit]
Description=${service_name} service
After=network.target syslog.target
Wants=network.target

[Service]
Type=simple
ExecStart=$full_command

[Install]
WantedBy=multi-user.target"

service_file="/etc/systemd/system/${service_name}.service"
echo "$service_content" | sudo tee "$service_file" > /dev/null

if [[ $? -eq 0 ]]; then
    echo "服务文件已成功创建：$service_file"
else
    echo "服务文件创建失败！"
    exit 1
fi

sudo systemctl daemon-reload
sudo systemctl start "$service_name"
sudo systemctl enable "$service_name"
sudo systemctl status "$service_name"