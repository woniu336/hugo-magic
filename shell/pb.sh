#!/bin/bash

# 定义颜色
BLUE='\033[1;34m'
NC='\033[0m' # No Color

# 切换到public目录
cd ..
cd public || { echo "无法进入public目录"; exit 1; }

# 检查是否存在远程仓库
if git remote -v > /dev/null 2>&1; then
  echo
  echo -e "${BLUE}已关联的远程仓库:${NC}"
  git remote -v
  echo  

  # 询问用户是否继续或删除远程仓库，默认选择继续
  read -p "是否继续使用现有远程仓库？(y/n, 默认: y) " choice
  choice=${choice:-y}
  case "$choice" in
    y|Y )
      echo -e "${BLUE}使用现有远程仓库.${NC}"
    ;;
    n|N )
      # 删除远程仓库
      git remote rm origin
      echo -e "${BLUE}已删除远程仓库 origin.${NC}"

      # 提示用户输入新的远程仓库地址
      read -p "请输入新的远程仓库地址: " remote_url

      # 添加新的远程仓库
      git remote add origin "$remote_url"
      echo -e "${BLUE}已添加新的远程仓库.${NC}"
    ;;
    * )
      echo "无效的选择."
      exit 1
    ;;
  esac
else
  # 如果不存在远程仓库，提示用户输入远程仓库地址
  read -p "请输入远程仓库地址: " remote_url

  # 添加远程仓库
  git remote add origin "$remote_url"
  echo -e "${BLUE}已添加远程仓库.${NC}"
fi

# 初始化git仓库 (如果尚未初始化)
if [ ! -d .git ]; then
  git init -q
  echo -e "${BLUE}已初始化Git仓库.${NC}"
fi

# 添加所有文件到暂存区
git add .

# 提交更改
git commit -m 'update'

# 设置主分支为main
git branch -M main

# 推送到远程仓库
git push -f origin main

echo -e "${BLUE}成功推送 public 到远程仓库.${NC}"
