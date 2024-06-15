#!/bin/bash
# Author: Lruihao

# 使用彩色字体提示用户输入序列号开始工作
echo -e "\033[1;32m请输入序列号开始工作\033[0m"
echo "--------------------------------------"
echo "1. 新建文章"
echo "2. 预览博客"
echo "3. 生成静态文件"
echo "4. 更新主题"
echo "5. 一键推送"
echo "6. 设置全局代理"
echo "7. 取消全局代理"
echo "8. SSH管理工具"
echo "9. Github http代理 (默认端口7890)"
echo "10. Github ssh代理"
echo "--------------------------------------"
echo "请按 Ctrl+C 停止"

# 读取用户输入
read -p "请输入序列号: " num

# 根据用户输入执行相应的脚本
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
    sh ssh.sh
    ;;
  9)
    sh github_proxy.sh
    ;;
  10)
    sh SSH_Proxy.sh
    ;;
  *)
    echo -e "\033[1;31m无效的序列号，请重新输入。\033[0m"
    ;;
esac

# 提示用户按任意键继续
echo "按任意键继续..."
read -n 1 -s
clear

# 重新运行脚本
sh hugo_main.sh
