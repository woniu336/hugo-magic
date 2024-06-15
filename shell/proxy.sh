#!/bin/bash

read -p "请输入端口号：" port

git config --global http.proxy "socks5://127.0.0.1:$port"
git config --global https.proxy "socks5://127.0.0.1:$port"

echo -e "\033[1;32m代理已设置\033[0m"
