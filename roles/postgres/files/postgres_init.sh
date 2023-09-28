#!/bin/bash

set -e
set -u

function create_user_and_database() {
	local database=$1
	local user=$1
	local password=$1
	echo "Creating user '$user' and database '$database'"
	psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
		CREATE ROLE $user WITH LOGIN PASSWORD '$password';
		CREATE DATABASE $database WITH OWNER $user TEMPLATE template0 ENCODING UTF8 LC_COLLATE 'en_US.UTF-8' LC_CTYPE 'en_US.UTF-8';
EOSQL
}

if [ -n "$POSTGRES_MULTIPLE_DATABASES" ]; then
	echo "Multiple database creation requested"
	count=1
	for db in $(echo $POSTGRES_MULTIPLE_DATABASES); do
		create_user_and_database $db
	done
	echo "Multiple databases created"
fi
