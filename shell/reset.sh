#!/bin/bash

# 显示git的reflog
git reflog

# 提取reflog输出的序号和对应的提交哈希值，并将其存储在数组中
mapfile -t commit_array < <(git reflog | grep -E '^[a-f0-9]+' | cat -n)

# 显示序号和对应的提交哈希值供用户选择
for ((i=0; i<${#commit_array[@]}; i++)); do
  echo "${commit_array[i]}"
done

# 提示用户输入要恢复的版本号前面对应的数字
read -p "请输入要恢复的版本号前面对应的数字: " version_number

# 提取用户选择的提交哈希值
selected_commit_hash=$(echo "${commit_array[version_number-1]}" | awk '{print $2}')

# 使用git reset --hard命令将本地代码回退到指定版本
git reset --hard "$selected_commit_hash"
