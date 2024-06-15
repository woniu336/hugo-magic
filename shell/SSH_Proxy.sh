
cat <<EOL >> ~/.ssh/config && echo -e "\033[1;32m加速成功，请按任意键退出。\033[0m"
Host github.com
    Hostname ssh.github.com
    IdentityFile ~/.ssh/id_rsa
    User git
    Port 443
    ProxyCommand "C:\Program Files\Git\mingw64\bin\connect.exe" -S 127.0.0.1:7890 %h %p
EOL

