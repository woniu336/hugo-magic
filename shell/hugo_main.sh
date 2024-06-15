#!/bin/bash
#author: Lruihao
echo -e "\033[1;32m请输入序列号开始工作\033[0m"
echo "--------------------------------------"
echo "1. 新建文章"

echo "2. 预览博客"

echo "3. 生成静态文件"

echo "4. 更新子模块"

echo "5. 一键推送"

echo "6. 设置代理"

echo "7. 取消代理"

echo "8. Git全局设置"

echo "9. http加速代理"

echo "10. ssh加速代理"

echo "--------------------------------------"
echo "请按 Ctrl+C 停止"

read num
case $num in
  1)
    sh post_generator.sh
    ;;
  2)
    sh hugo_server.sh
    ;;
  3)
    sh hugo_builder.sh
    ;;
  4)
    sh public_async.sh
    ;;
  5)
    sh auto_push.sh
    ;;
  6)
    sh proxy.sh
	;;
  7)
    sh unset.sh
	;;
  8)
    sh git-user.sh
    ;;
  9)
    sh github_proxy.sh
    ;;
  10)
    sh SSH_Proxy.sh
    ;;
  *)
    echo "There is no such serial number"
    ;;
esac

echo "按任意键继续..."
read x
clear
sh hugo_main.sh