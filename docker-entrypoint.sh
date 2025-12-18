#!/bin/sh
set -e

echo "Starting Directus bootstrap..."

# Wait for database to be ready
sleep 5

# Run database migrations
echo "Running migrations..."
npx directus database migrate:latest

# Apply schema if exists
if [ -f /directus/schema.yaml ]; then
  echo "Applying schema..."
  npx directus schema apply /directus/schema.yaml --yes || echo "Schema apply failed, continuing..."
fi

# Start Directus
echo "Starting Directus..."
npx directus start