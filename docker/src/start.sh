#!/bin/bash

set -e

create_supervisor_dir () {
    echo "Create supervisor dir..."
    mkdir -p /var/log/supervisor
}

wait_psql_port () {
    echo "Wait PostgreSQL port..."
    waitforit -host=$POSTGRES_HOST -port=5432 -timeout=10
}

wait_psql_ready () {
    RETRIES=5
    export PGPASSWORD=$POSTGRES_PASSWORD

    echo "Wait PostgreSQL ready..."
    until psql -h $POSTGRES_HOST -U $POSTGRES_USER -d $POSTGRES_DB -c "select 1" > /dev/null 2>&1 || [ $RETRIES -eq 0 ]; do
      echo "Waiting for PostgreSQL server, $((RETRIES--)) remaining attempts..."
      sleep 10
    done
}

execute_rails_migration () {
    echo "Execute Rails migration..."
    bundle exec rails db:migrate
}

assets_precompile () {
    cd /cosmetology && nohup bundle exec rake assets:precompile &
}

generate_docs () {
    cd /cosmetology && bundle exec rake rswag:specs:swaggerize
}

start_rails_app () {
    echo 'Starting Rails app...'
    if [ $RAILS_ENV = 'test' ]
    then bundle exec rails console
    else exec /usr/bin/supervisord -c /cosmetology/config/supervisord/production
    fi
}

create_supervisor_dir
wait_psql_port
wait_psql_ready
execute_rails_migration
assets_precompile
generate_docs
start_rails_app
