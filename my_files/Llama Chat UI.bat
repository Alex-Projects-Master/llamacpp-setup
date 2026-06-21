@echo off
set "PROFILE_DIR=%TEMP%\llama_ui_profile"

:: Launch Chrome in App mode and pause the script until it closes
start /wait chrome --app=http://192.168.1.70:1234 --user-data-dir="%PROFILE_DIR%"

:: Give Chrome a split second to release file locks after closing
timeout /t 1 /nobreak >nul

:: Clean up and delete the folder completely
if exist "%PROFILE_DIR%" rmdir /s /q "%PROFILE_DIR%"
