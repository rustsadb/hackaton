#!/bin/bash

set -e

echo "Wait PostgreSQL port..."
waitforit -host=$POSTGRES_HOST -port=5432 -timeout=10

RETRIES=5
export PGPASSWORD=$POSTGRES_PASSWORD

echo "Wait PostgreSQL ready..."
until psql -h $POSTGRES_HOST -U $POSTGRES_USER -d $POSTGRES_DB -c "select 1" > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
  echo "Waiting for postgres server, $((RETRIES--)) remaining attempts..."
  sleep 10
done

echo "Wait migration execute..."
sleep 10