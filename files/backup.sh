#!/bin/bash

# Bugünün tarihini alalım (örneğin 2024-04-27 gibi)
DATE=$(date +%F)

# Dinamik hedef dizin tanımı
DEST_DIR="/home/emre/backup/html_$DATE"

# Hedef sunucuda klasörü oluştur (eğer yoksa)
ssh -o StrictHostKeyChecking=no emre@192.168.19.130 "mkdir -p $DEST_DIR"

# Rsync ile veriyi gönder
rsync -avz -e "ssh -o StrictHostKeyChecking=no" /var/www/html/ emre@192.168.19.130:$DEST_DIR/

