#!/bin/bash
# author: Lruihao

# 切换到文章目录
cd ..

# 提示用户输入文章名称
read -p "请输入文章名称: " postName

# 检查文章名称是否为空
if [ -z "$postName" ]; then
  echo "文章名称是必填项!"
else
  # 提示用户是否有图片
  echo
  echo -e "\033[1;34m提示: 如果图片使用外链输入n(回车)\033[0m"
  echo
  read -p "你需要把图片放在文章目录吗？ [y/n]: " choice
  if [ "$choice" = "y" ]; then
    hugo new post/"$postName"/index.md
  else
    hugo new post/"$postName".md
  fi

  # 检查是否成功新建文章
  if [ $? -eq 0 ]; then
echo
echo -e "\033[1;34m成功新建文章 '$postName'！\033[0m"
  else
    echo "新建文章失败！"
  fi
fi