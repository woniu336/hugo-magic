#!/bin/bash

echo "停止 hugo.exe 进程..."

# 使用 PowerShell 启动任务结束 hugo.exe 进程
powershell -Command "Stop-Process -Name hugo -Force"

echo "hugo.exe 进程已停止"
