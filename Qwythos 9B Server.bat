@echo off
title Llama.cpp Server - Qwythos
cd /d "C:\Workspace"

echo ===================================================
echo Launching Qwythos 9B Server on 192.168.1.70:1234...
echo Vision Engine: ENABLED
echo Reasoning Engine: ENABLED
echo Tools: ENABLED
echo ===================================================

C:\llamacpp-setup\llama-server.exe -m "C:\llamacpp-setup\Qwythos-9B-Claude-Mythos-5-1M-Q4_K_M.gguf" --mmproj "C:\llamacpp-setup\mmproj-Qwythos-9B-Claude-Mythos-5-1M-F16.gguf" -c 16384 -t 6 --host 192.168.1.70 --port 1234 -np 1 --embedding --reasoning "on"