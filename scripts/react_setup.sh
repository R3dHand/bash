#!/bin/bash

# establish var for WSL so script will run on WSL or Linux
if grep -qEi "(Microsoft|WSL)" /proc/version; then
    echo "running WSL"
    wsl="cmd.exe /c"
elif grep -qEi "(amzn)" /proc/version; then
    wsl=""
    echo "running amazon ec2"
fi
