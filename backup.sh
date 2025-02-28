#!/usr/bin/env bash
date=$(date -I)
echo "Backing up the server!"
tar -cf - ./world -P | pv -s $(du -sb ./world | awk '{print $1}') | pigz > world-backup-$date.tar.gz
mv ./world-backup-$date.tar.gz ./world-auto-backups/world-backup-$date.tar.gz
echo "Finished backing up the server, starting!"
