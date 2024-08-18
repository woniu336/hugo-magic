#!/bin/bash

cd ..

# 备份 public 目录下的 .git 目录
if [ -d "public/.git" ]; then
    mv public/.git .git_backup
fi

# 删除 public 目录
rm -rf public

# 生成静态文件
hugo --gc --minify

# 还原 .git 目录
if [ -d ".git_backup" ]; then
    mv .git_backup public/.git
fi

# 进入 public 目录并推送更新
cd public
git add .
git commit -m 'update'
git push origin main

# 提示用户确认退出（使用绿色高亮）
echo -e "\033[1;32m推送完成。按Enter键退出...\033[0m"
read