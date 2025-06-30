#!/bin/bash

BACKUP_DIR="/backup/system"
DATE=$(date +%Y-%m-%d)
FILENAME="system-backup-$DATE.tar.gz"
EXCLUDES="--exclude=/proc --exclude=/tmp --exclude=/mnt --exclude=/media"

mkdir -p "$BACKUP_DIR"
echo "Backup: $FILENAME"

tar $EXCLUDES -czpf "$BACKUP_DIR/$FILENAME" /

find "$BACKUP_DIR" -name "*.tar.gz" -mtime +7 -delete
