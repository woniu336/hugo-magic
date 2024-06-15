#!/bin/bash
# author: Lruihao

cd ..

# Add all changes
git add .

# Commit changes
git commit -m "update"

# Force push all branches to remote
git push -f origin --all

# Check if push was successful
if [ $? -eq 0 ]; then
  echo -e "\033[1;34m推送成功！所有更改已更新到远程仓库。\033[0m"
else
  cho -e "\033[1;34m推送时发生错误。请检查你的网络连接或仓库权限。\033[0m"
fi
