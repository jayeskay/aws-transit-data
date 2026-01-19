#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "postgres" <<-EOSQL
    CREATE DATABASE "$POSTGRES_DATABASE_DEV";
    CREATE DATABASE "$POSTGRES_DATABASE_PROD";
EOSQL
