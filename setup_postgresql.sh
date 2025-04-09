#!/bin/bash

set -e
basedir=$(dirname $(readlink -f $0))
cd $basedir

. functions

# PostgreSQLのバージョン
pg_version="16"
# PostgreSQLユーザーとデータベースの設定
psql_user="postgres"
psql_pass="techbase"
db_name="tbusterdb"
db_table="tbuster_table"
# テーブルにインポートするcsvファイルのパス
data_dir="."
data_file="data.csv"

# start
log_start

h3 "Enable sudo with no password"
enable_sudo || fail
ok

h2 "PostgreSQL"
h3 "Install PostgreSQL"
postgres_install $pg_version || fail
ok

h3 "Initialize PostgreSQL database"
if ! postgres_start; then
    postgres_initdb $pg_version || fail
    ok
else ok
fi

h3 "Start and enable PostgreSQL service"
postgres_enable_service $pg_version || fail
ok

h3 "Configure PostgreSQL to accept remote connections"
postgres_configure $pg_version || fail
ok

h3 "Restart PostgreSQL service"
postgres_restart_service $pg_version || fail
ok

h3 "Set password for PostgreSQL user '$psql_user'"
postgres_set_password $psql_user $psql_pass || fail
ok

h3 "Create new database '$db_name'"
postgres_create_db $db_name || fail
ok

h3 "Import data to '$db_table'"
postgres_import_data $db_name $db_table $data_dir $data_file || fail
ok

echo "PostgreSQL setup is complete."

# complete
log_end
