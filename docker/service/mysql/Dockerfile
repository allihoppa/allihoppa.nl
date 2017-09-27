FROM mysql:5.7

ENV BACKUP_DIR /backup

COPY backup /usr/local/bin/backup
COPY wait-for-db /usr/local/bin/wait-for-db
RUN chmod +x /usr/local/bin/backup /usr/local/bin/wait-for-db
