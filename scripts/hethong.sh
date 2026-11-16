#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
LOG_FILE="$BASE_DIR/logs/hethong.log"
mkdir -p "$(dirname "$LOG_FILE")"

{
    echo "=========================================="
    echo "BAO CAO KIEM TRA HE THONG"
    echo "Ngay gio hien tai : $(date '+%Y-%m-%d %H:%M:%S')"
    echo "Ten nguoi dung    : $(whoami)"
    echo "Ten may tinh      : $(hostname)"
    echo "Linux Kernel      : $(uname -r)"
    echo ""
    echo "--- Dung luong RAM ---"
    free -h
    echo ""
    echo "--- Dung luong o dia ---"
    df -h
    echo ""
    echo "--- Kiem tra ket noi mang ---"
    if ping -c 2 -W 3 google.com.vn > /dev/null 2>&1; then
        echo "Co ket noi mang"
    else
        echo "Khong xac nhan duoc ket noi mang"
    fi
    echo "=========================================="
} 2>&1 | tee "$LOG_FILE"
