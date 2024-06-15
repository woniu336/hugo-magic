#!/bin/bash

git config --global --unset http.proxy
git config --global --unset https.proxy
git config --global --unset http.https://github.com.proxy

echo "代理设置已取消。"
