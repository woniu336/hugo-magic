nohup ./hugo_server.sh > hugo.log 2>&1 &
echo -e "\033[1;34mHugo 服务启动成功。\033[0m"
echo -e "\033[1;34mHugo 打开浏览器,输入地址: http://localhost:1313/ \033[0m"
echo -e "\033[1;32mHugo 遇到无法启动的情况,手动输入命令 hugo serve 查看详情\033[0m"