#!/usr/bin/env bash
set -x
set -eo pipefail

if ! [ -x "$(command -v sqlx)" ]; then
  echo >&2 "Error: sqlx is not installed."
  echo >&2 "Use:"
  echo >&2 "    cargo install --version='~0.8' sqlx-cli --no-default-features --features rustls,postgres"
  echo >&2 "to install it."
  exit 1
fi

# Check if a custom parameter has been set, otherwise use default values
DB_PORT="${DB_PORT:=5432}"
SUPERUSER="${SUPERUSER:=postgres}"
SUPERUSER_PWD="${SUPERUSER_PWD:=password}"
APP_USER="${APP_USER:=app}"
APP_USER_PWD="${APP_USER_PWD:=secret}"
APP_DB_NAME="${APP_DB_NAME:=jjk}"

# Ensure PostgreSQL is running by checking the connection using the default 'postgres' database
if ! psql postgres -tAc "SELECT 1;" > /dev/null; then
  echo >&2 "PostgreSQL is not running or is unreachable."
  exit 1
fi

# Check if the superuser already exists, create it if not
if ! psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='${SUPERUSER}';" | grep -q 1; then
  echo "Creating superuser ${SUPERUSER}"
  psql postgres -c "CREATE USER ${SUPERUSER} WITH SUPERUSER PASSWORD '${SUPERUSER_PWD}';"
fi

# Check if the application user already exists, create it if not
if ! psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='${APP_USER}';" | grep -q 1; then
  echo "Creating application user ${APP_USER}"
  psql postgres -c "CREATE USER ${APP_USER} WITH PASSWORD '${APP_USER_PWD}';"
fi

# Grant create db privileges to the app user if not granted
if ! psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='${APP_USER}' AND rolcreaterole IS TRUE;" | grep -q 1; then
  echo "Granting createdb privilege to ${APP_USER}"
  psql postgres -c "ALTER USER ${APP_USER} CREATEDB;"
fi

# Check if the application database exists, create it if not
if ! psql postgres -lqt | cut -d \| -f 1 | grep -qw "${APP_DB_NAME}"; then
  echo "Creating database ${APP_DB_NAME}"
  psql postgres -c "CREATE DATABASE ${APP_DB_NAME} OWNER ${APP_USER};"
fi

>&2 echo "Postgres is up and running on port ${DB_PORT} - running migrations now!"

# Create the application database if not already created
DATABASE_URL=postgres://${APP_USER}:${APP_USER_PWD}@localhost:${DB_PORT}/${APP_DB_NAME}
export DATABASE_URL
sqlx database create || true
sqlx migrate run

>&2 echo "Postgres has been migrated, ready to go!"