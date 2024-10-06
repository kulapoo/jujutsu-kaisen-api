#!/bin/bash

# This will delete all created databases that have a UUID name

psql postgres -t -c "
SELECT 'DROP DATABASE IF EXISTS \"' || datname || '\";'
FROM pg_database
WHERE datname ~ '^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$';
" > delete_uuid_databases.sql

psql postgres -f delete_uuid_databases.sql

rm delete_uuid_databases.sql