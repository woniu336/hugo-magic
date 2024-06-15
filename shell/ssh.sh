#!/bin/bash

# ANSI color codes
BLUE='\033[1;34m'
RED='\033[1;31m'
GREEN='\033[1;32m'
NC='\033[0m' # No Color

# Function to display the menu
display_menu() {
    echo -e "${BLUE}====================================${NC}"
    echo -e "${BLUE}        SSH管理工具${NC}"
    echo -e "${BLUE}====================================${NC}"
    echo
    echo -e "1. 配置 GitHub 用户名和邮箱"
    echo
    echo -e "2. 生成 SSH Key"
    echo
    echo -e "3. 验证 SSH 连接到 GitHub"
    echo
    echo -e "4. 退出"
    echo -e "${BLUE}====================================${NC}"
}

# Function to configure GitHub username and email
configure_git() {
    echo
    read -p "请输入你的 GitHub 用户名: " username
    read -p "请输入你的 GitHub 邮箱: " email

    git config --global user.name "$username"
    git config --global user.email "$email"
    
    echo -e "${BLUE}GitHub 用户名和邮箱已配置:${NC}"
    echo -e "${BLUE}====================================${NC}"
    git config --global user.name
    git config --global user.email
    echo -e "${BLUE}====================================${NC}"

    # Wait for user to see the message
    echo
    read -p "按回车键返回主菜单..."
}

# Function to generate SSH key
generate_ssh_key() {
    if [ -f ~/.ssh/github_id_rsa ]; then
	    echo
        echo -e "${BLUE}SSH Key 已存在: ~/.ssh/github_id_rsa${NC}"
    else
        echo
        read -p "请输入你的邮箱用于 SSH key: " email
        ssh-keygen -q -t ed25519 -C "$email" -N "" -f ~/.ssh/github_id_rsa

        echo -e "${BLUE}SSH Key 已生成: ~/.ssh/github_id_rsa${NC}"
    fi

    echo
    echo -e "${BLUE}请将以下内容复制到 GitHub 的 SSH and GPG keys 设置中:${NC}"
    echo
    echo -e "${RED}$(cat ~/.ssh/github_id_rsa.pub)${NC}"
    echo
    echo -e "${BLUE}请访问以下链接添加 SSH key: ${GREEN}https://github.com/settings/ssh/new${NC}"

    # Wait for user to see the message
    echo
    read -p "按回车键返回主菜单..."
}

# Function to verify SSH connection to GitHub
verify_ssh_connection() {
    echo
    echo -e "${BLUE}正在验证 SSH 连接到 GitHub...${NC}"
    ssh -T git@github.com
    if [ $? -eq 1 ]; then
        echo -e "${GREEN}成功连接到 GitHub！${NC}"
    else
        echo -e "${RED}连接 GitHub 失败，请检查 SSH Key 配置。${NC}"
    fi

    # Wait for user to see the message
    echo
    read -p "按回车键返回主菜单..."
}

# Main script logic
while true; do
    clear
    display_menu
    read -p "请输入选项编号: " choice
    case $choice in
        1)
            configure_git
            ;;
        2)
            generate_ssh_key
            ;;
        3)
            verify_ssh_connection
            ;;
        4)
            echo "退出程序."
            exit 0
            ;;
        *)
            echo "无效选项，请重新输入."
            ;;
    esac
done
