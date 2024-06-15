#!/bin/bash
#author: Lruihao
cd ..
git add .
read -p "请输入提交消息: " commitMsg
if [ -z "$commitMsg" ]; then
  commitMsg="『note』Update $(date +'%F %a %T')"
fi
git commit -m "$commitMsg"
if git push -f origin --all; then
  echo -e "\033[1;32m推送成功，请按任意键退出。\033[0m"
else
  echo -e "\033[1;31m推送失败，请检查错误并按任意键退出。\033[0m"
fi
read -n 1 -s -r -p "Press any key to continue"