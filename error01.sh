#!/bin/bash
seconds=43200
if [ $# -gt 0 ]; then
    seconds=$1
fi
sudo -u postgres psql -c "SELECT pg_sleep($seconds);" > /dev/null &
sudo -u postgres psql -c "SELECT pg_sleep($seconds);" > /dev/null &
sudo -u postgres psql -c "SELECT pg_sleep($seconds);" > /dev/null &
sudo -u postgres psql -c "SELECT pg_sleep($seconds);" > /dev/null &
