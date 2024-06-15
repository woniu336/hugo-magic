#!/bin/bash

# 更新所有子模块
git submodule foreach --recursive git pull

# 检查是否有错误发生
if [ $? -eq 0 ]; then
  echo -e "\033[1;34m主题更新成功！\033[0m"
else
  echo -e "\033[1;34m更新主题时发生错误。\033[0m"
fi


