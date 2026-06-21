@echo off
title Llama.cpp Server - Gemma 4
cd /d "%~dp0"

echo ===================================================
echo Launching Gemma 4 Server on 192.168.1.70:1234...
echo Reasoning Engine: DISABLED
echo Tools: ENABLED
echo ===================================================

llama-server.exe -m gemma-4-E4B-it-Q4_K_M.gguf -c 32768 -t 6 --host 192.168.1.70 --port 1234 -np 2 --embedding --reasoning "off" --tools all