#!/bin/bash

# 定义SSH配置字符串
config_string=$(cat <<EOL
Host github.com
    Hostname ssh.github.com
    IdentityFile ~/.ssh/github_id_rsa
    User git
    Port 443
    ProxyCommand "C:\\Program Files\\Git\\mingw64\\bin\\connect.exe" -S 127.0.0.1:7890 %h %p
EOL
)

# 检查~/.ssh/config文件中是否已经存在相同的配置
if ! grep -qxF "Host github.com" ~/.ssh/config; then
  # 尝试在~/.ssh/config文件中添加SSH配置
  echo "$config_string" >> ~/.ssh/config

  # 检查文件写入是否成功
  if [ $? -eq 0 ]; then
    # 显示成功提示
    echo -e "\033[1;34m加速配置已添加，请等待连接测试。\033[0m"
  else
    # 显示失败提示
    echo "添加SSH配置时发生错误。"
    exit 1
  fi
else
  echo -e "\033[1;34m配置已存在，无需重复添加。等待连接测试...\033[0m"
fi

# 尝试连接到GitHub
ssh -T git@github.com

# 检查SSH命令的退出状态
if [ $? -eq 1 ]; then
  echo -e "\033[1;32m连接测试成功，加速成功，请按任意键退出。\033[0m"
  # 等待用户按键
else
  echo -e "\033[1;31m连接测试失败，加速可能未生效。\033[0m"
  exit 1
fi
