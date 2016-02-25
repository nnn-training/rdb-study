#!/bin/sh
PG_USER='postgres'
DB_NAME='diary2'
SQL_DUMP="dump_${DB_NAME}.sql"

sudo -u postgres dropdb --if-exists "$DB_NAME"
sudo -u postgres createdb -T template0 "$DB_NAME"

cat "$SQL_DUMP" | sudo -u postgres psql "$DB_NAME"
sudo -u postgres psql "$DB_NAME"

