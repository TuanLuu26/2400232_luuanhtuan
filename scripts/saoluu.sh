#!/bin/bash

BASE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
DATA_DIR="$BASE_DIR/data"
BACKUP_DIR="$BASE_DIR/backup"
LOG_FILE="$BASE_DIR/logs/backup.log"

mkdir -p "$BACKUP_DIR" "$(dirname "$LOG_FILE")"

THOI_GIAN=$(date '+%Y-%m-%d %H:%M:%S')
STAMP=$(date '+%Y%m%d_%H%M%S')
ARCHIVE_NAME="backup_${STAMP}.tar.gz"
ARCHIVE_PATH="$BACKUP_DIR/$ARCHIVE_NAME"

if [ ! -d "$DATA_DIR" ]; then
    TRANG_THAI="THAT BAI (Khong ton tai thu muc data)"
    echo "$TRANG_THAI"
    echo "[$THOI_GIAN] File: $ARCHIVE_NAME | Trang thai: $TRANG_THAI" >> "$LOG_FILE"
    exit 1
fi

if tar -czf "$ARCHIVE_PATH" -C "$BASE_DIR" data 2>/dev/null; then
    TRANG_THAI="THANH CONG"
    echo "Sao luu thanh cong: $ARCHIVE_PATH"
else
    TRANG_THAI="THAT BAI"
    echo "Sao luu that bai khi nen thu muc data."
fi

echo "[$THOI_GIAN] File: $ARCHIVE_NAME | Trang thai: $TRANG_THAI" >> "$LOG_FILE"

echo ""
echo "--- Danh sach cac file da sao luu trong $BACKUP_DIR ---"
ls -lh "$BACKUP_DIR"
