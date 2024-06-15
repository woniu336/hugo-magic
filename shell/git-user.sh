#!/bin/sh
# 代码段 1：设置用户名、邮箱
echo "请输入用户名:"
read username
echo "请输入邮箱:"
read email
git config --global user.name "$username"
git config --global user.email "$email"

echo "Git全局设置已更改"
