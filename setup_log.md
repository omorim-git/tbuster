# setup log

start at `2025-04-09 17:20:15`

### Enable sudo with no password
### ok
## PostgreSQL

### Install PostgreSQL
`2025-04-09 17:20:15`
```bash
sudo apt-get install -y postgresql-16
```
```terminal
********************************************************************************
You are running apt-get inside of Cloud Shell. Note that your Cloud Shell  
machine is ephemeral and no system-wide change will persist beyond session end. 

To suppress this warning, create an empty ~/.cloudshell/no-apt-get-warning file.
The command will automatically proceed in 5 seconds or on any key. 

Visit https://cloud.google.com/shell/help for more information.                 
********************************************************************************
Reading package lists...
Building dependency tree...
Reading state information...
postgresql-16 is already the newest version (16.8-1.pgdg24.04+1).
0 upgraded, 0 newly installed, 0 to remove and 2 not upgraded.
```

### ok
### Initialize PostgreSQL database
`2025-04-09 17:20:22`
```bash
sudo service postgresql start
```
```terminal
 * Starting PostgreSQL 16 database server
   ...done.
```

### ok
### Start and enable PostgreSQL service
`2025-04-09 17:20:22`
```bash
sudo service postgresql start
```
```terminal
 * Starting PostgreSQL 16 database server
   ...done.
```

`2025-04-09 17:20:22`
```bash
sudo update-rc.d postgresql enable
```
```terminal
```

### ok
### Configure PostgreSQL to accept remote connections
`2025-04-09 17:20:22`
```bash
sudo sed -i "s/^#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/16/main/postgresql.conf
```
```terminal
```

`2025-04-09 17:20:22`
```bash
sudo sed -i "s/^max_connections = [0-9]\+/max_connections = 4/" /etc/postgresql/16/main/postgresql.conf
```
```terminal
```

`2025-04-09 17:20:22`
```bash
sudo grep -E '^host\s+all\s+all\s+0\.0\.0\.0/0\s+md5' /etc/postgresql/16/main/pg_hba.conf
```
```terminal
host all all 0.0.0.0/0 md5
```

### ok
### Restart PostgreSQL service
`2025-04-09 17:20:22`
```bash
sudo service postgresql restart
```
```terminal
 * Restarting PostgreSQL 16 database server
   ...done.
```

### ok
### Set password for PostgreSQL user 'postgres'
`2025-04-09 17:20:25`
```bash
sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'techbase';"
```
```terminal
ALTER ROLE
```

### ok
### Create new database 'tbusterdb'
`2025-04-09 17:20:25`
```bash
sudo -u postgres psql -c "SELECT datname FROM pg_database WHERE datname = 'tbusterdb';" | grep -q '0 rows'
```
```terminal
```

### ok
### Import data to 'tbuster_table'
`2025-04-09 17:20:27`
```bash
sudo -u postgres psql -d tbusterdb -c "SELECT * FROM pg_catalog.pg_tables WHERE tablename =  'tbuster_table';" | grep -q '0 row'
```
```terminal
```

`2025-04-09 17:20:27`
```bash
sudo -u postgres psql -d tbusterdb -c "DROP TABLE tbuster_table;"
```
```terminal
DROP TABLE
```

`2025-04-09 17:20:27`
```bash
sudo -u postgres psql -d tbusterdb -c "CREATE TABLE tbuster_table (key TEXT PRIMARY KEY,text001 TEXT,text002 TEXT,text003 TEXT,text004 TEXT,text005 TEXT,text006 TEXT,text007 TEXT,text008 TEXT,text009 TEXT,text010 TEXT,text011 TEXT,text012 TEXT,text013 TEXT,text014 TEXT,text015 TEXT,text016 TEXT,text017 TEXT,text018 TEXT,text019 TEXT,text020 TEXT,text021 TEXT,text022 TEXT,text023 TEXT,text024 TEXT,text025 TEXT,text026 TEXT,text027 TEXT,text028 TEXT,text029 TEXT,text030 TEXT,text031 TEXT,text032 TEXT,text033 TEXT,text034 TEXT,text035 TEXT,text036 TEXT,text037 TEXT,text038 TEXT,text039 TEXT,text040 TEXT,text041 TEXT,text042 TEXT,text043 TEXT,text044 TEXT,text045 TEXT,text046 TEXT,text047 TEXT,text048 TEXT,text049 TEXT,text050 TEXT,text051 TEXT,text052 TEXT,text053 TEXT,text054 TEXT,text055 TEXT,text056 TEXT,text057 TEXT,text058 TEXT,text059 TEXT,text060 TEXT,text061 TEXT,text062 TEXT,text063 TEXT,text064 TEXT,text065 TEXT,text066 TEXT,text067 TEXT,text068 TEXT,text069 TEXT,text070 TEXT,text071 TEXT,text072 TEXT,text073 TEXT,text074 TEXT,text075 TEXT,text076 TEXT,text077 TEXT,text078 TEXT,text079 TEXT,text080 TEXT,text081 TEXT,text082 TEXT,text083 TEXT,text084 TEXT,text085 TEXT,text086 TEXT,text087 TEXT,text088 TEXT,text089 TEXT,text090 TEXT,text091 TEXT,text092 TEXT,text093 TEXT,text094 TEXT,text095 TEXT,text096 TEXT,text097 TEXT,text098 TEXT,text099 TEXT,text100 TEXT);"
```
```terminal
CREATE TABLE
```

`2025-04-09 17:20:27`
```bash
chmod 777 . | chmod 777 ./data.csv
```
```terminal
```

`2025-04-09 17:20:27`
```bash
cd .
```
```terminal
```

`2025-04-09 17:20:27`
```bash
sudo -u postgres psql -d tbusterdb -c "\COPY tbuster_table FROM 'data.csv' DELIMITER ',' CSV;"
```
```terminal
COPY 676
```

`2025-04-09 17:20:27`
```bash
cd ..
```
```terminal
```

### ok
end at `2025-04-09 17:20:27`

# setup complete
