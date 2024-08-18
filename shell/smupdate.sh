#!/bin/bash

# 确保脚本在项目的根目录运行
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
cd "$SCRIPT_DIR" || exit 1

# 子模块路径
SUBMODULE_PATH="themes/hugo-magic"

# 确保子模块路径存在
if [ ! -d "$SUBMODULE_PATH" ]; then
  echo -e "\033[1;31m子模块路径 $SUBMODULE_PATH 不存在\033[0m"
  exit 1
fi

# 进入子模块目录
cd "$SUBMODULE_PATH" || exit 1

# 设置上游分支
echo -e "\033[1;32m设置上游分支为 origin/main\033[0m"
git branch --set-upstream-to=origin/main main

# 返回主项目目录
cd "$SCRIPT_DIR" || exit 1

# 同步并更新子模块
echo -e "\033[1;32m同步并更新子模块\033[0m"
git submodule sync
git submodule update --init --recursive

# 检查子模块状态
echo -e "\033[1;32m检查子模块状态\033[0m"
git submodule status

# 强制更新子模块到最新提交（如果需要）
cd "$SUBMODULE_PATH" || exit 1
echo -e "\033[1;32m强制更新子模块到最新提交\033[0m"
git fetch origin
git reset --hard origin/main

# 返回主项目目录
cd "$SCRIPT_DIR" || exit 1

# 将更新提交到主项目
echo -e "\033[1;32m提交子模块更新\033[0m"
git add .
git commit -m "Update submodule $SUBMODULE_PATH to the latest commit"

# 完成提示并要求按任意键退出
echo -e "\033[1;32m子模块更新完成\033[0m"
echo -e "\033[1;33m按任意键退出...\033[0m"
read -n 1 -s
