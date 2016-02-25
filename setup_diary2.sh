#!/bin/sh
PG_USER='postgres'
DB_NAME='diary2'
GH_PAGES="http://progedu.github.io/rdb-study/"
SQL_DUMP="dump_${DB_NAME}.sql"

sudo -u $PG_USER dropdb --if-exists "$DB_NAME"
sudo -u $PG_USER createdb -T template0 "$DB_NAME"

curl -o- "${GH_PAGES}${SQL_DUMP}" | sudo -u $PG_USER psql "$DB_NAME"

