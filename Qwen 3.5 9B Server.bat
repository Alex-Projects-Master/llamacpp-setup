@echo off
title Llama.cpp Server - Qwen 3.5
cd /d "C:\Workspace"

echo ===================================================
echo Launching Qwen 3.5 Server on 192.168.1.70:1234...
echo Reasoning Engine: DISABLED
echo Tools: ENABLED
echo ===================================================

C:\llamacpp-setup\llama-server.exe -m "C:\llamacpp-setup\Qwen3.5-9B-Q4_K_M.gguf" -c 32768 -t 6 --host 192.168.1.70 --port 1234 --np 1 --embedding --reasoning "off" --tools all --ui-config-file "C:\llamacpp-setup\ui-config.json"