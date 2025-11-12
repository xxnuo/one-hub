#!/bin/bash

make all

chmod +x ./dist/one-api 

# 安装服务（为当前用户）
mkdir -p ~/.config/systemd/user
cp one-api.service ~/.config/systemd/user/

# 重载配置
systemctl --user daemon-reload

# 启用服务（开机自启）
systemctl --user enable one-api.service

# 启动服务
systemctl --user start one-api.service

# 查看状态
systemctl --user status one-api.service

# 查看日志
journalctl --user -u one-api.service -f
