#!/bin/bash
# Author: Lruihao

# ANSI color codes for styling output
BLUE='\033[1;34m'
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color
greenline() { echo -e "\033[32m\033[01m \\$1\033[0m"; }

# Function to display the proxy submenu
display_proxy_menu() {
  echo
  echo -e "${BLUE}  === 代理设置 ===  ${NC}"
  echo
  echo -e " 1. 设置全局代理 "
  echo
  echo -e " 2. 取消全局代理 "
  echo
  echo -e " 3. Github http代理 (默认端口7890) "
  echo
  echo -e " 4. Github ssh代理 "
  echo
  echo -e " 0. 返回主菜单 "
  echo
}

# Function to handle user's choice in the proxy submenu
handle_proxy_choice() {
  case $proxy_num in
    1)  sh proxy.sh ;;
    2)  sh unset.sh ;;
    3)  sh github_proxy.sh ;;
    4)  sh SSH_Proxy.sh ;;
    0)  return ;;
    *)
      echo -e "${RED}无效的序列号,请重新输入.${NC}"
      ;;
  esac
  # 保留提示信息
  read -p "按任意键继续..." -n 1 -s
}

# Function to display the main menu
display_menu() {
    echo
    echo -e "${BLUE}          Hugo 博客工具箱          ${NC}"
    echo -e "${BLUE}       https://woniu336.github.io${NC}"
    echo
    echo -e "${BLUE}====================================${NC}"
    echo
    echo -e " 1. 新建文章 "
    echo
    echo -e " 2. 预览博客 "
    echo
    echo -e " 3. 生成静态文件 "
    echo
    echo -e " 4. 更新主题 "
    echo
    echo -e " 5. 一键推送 ${GREEN}(本地仓库)${NC}"
    echo
    echo -e " 6. 代理设置 "
    echo
    echo -e " 7. SSH 管理工具 "
    echo
    echo -e " 8. 推送 public 到Github "
	echo
    echo -e " 9. 推送 public 到远程服务器 ${GREEN}(VPS)${NC}"
    echo
	echo -e " 10. 停止 hugo 服务 "
	echo
    echo -e " 0. 退出 "
    echo
    echo -e "${BLUE}====================================${NC}"
}

# Function to handle user's choice in the main menu
handle_choice() {
    case $num in
        1)  sh post_generator.sh ;;
        2)  sh server.sh ;;
        3)  sh hugo_builder.sh ;;
        4)  sh public_async.sh ;;
        5)  sh auto_push.sh ;;
        6)  # 代理设置子菜单
            while true; do
              clear
              display_proxy_menu
              read -p "请输入序列号: " proxy_num
              handle_proxy_choice
              if [[ $proxy_num == 0 ]]; then
                break
              fi
            done
            ;;
        7)  sh ssh.sh ;;
		8)  sh pb.sh ;;
        9)  sh vps.sh ;;
		10)  sh stop.sh ;;
        0)
            echo -e "${GREEN}退出程序.${NC}"
            exit 0
            ;;
        *)
            echo -e "${RED}无效的序列号,请重新输入.${NC}"
            sleep 1
            ;;
    esac
    # 保留提示信息
    read -p "按任意键继续..." -n 1 -s
}

# Main script logic
while true; do
    clear
    display_menu
    echo
    read -p "请输入序列号: " num
    handle_choice
done
