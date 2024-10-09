#!/bin/bash

# Start Cassandra in the background
cassandra -R &

# Wait for Cassandra to be ready using cqlsh
echo "Waiting for Cassandra to be ready..."
until cqlsh -e "DESCRIBE KEYSPACES" > /dev/null 2>&1; do
  echo "Cassandra is not ready yet. Waiting for 10 seconds..."
  sleep 10
done

echo "Cassandra is ready. Running initialization scripts..."

# Execute the schema and data initialization scripts
for f in /docker-entrypoint-initdb.d/*.cql; do
  echo "Executing $f..."
  cqlsh -f "$f"
done

echo "Initialization scripts executed."

# Keep Cassandra running in the foreground
fg
