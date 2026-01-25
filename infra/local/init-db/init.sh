#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" --dbname "postgres" <<-EOSQL
    CREATE DATABASE "$POSTGRES_DATABASE_DEV";
    CREATE DATABASE "$POSTGRES_DATABASE_PROD";

    \c "$POSTGRES_DATABASE_DEV"
    CREATE SCHEMA raw;
    CREATE SCHEMA staging;
    CREATE SCHEMA marts;
EOSQL
