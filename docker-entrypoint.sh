#!/bin/sh
set -e

# Wait for database
sleep 5

# Run migrations
npx directus database migrate:latest

# Apply schema if it exists
if [ -f /directus/schema.yaml ]; then
  echo "Applying schema..."
  npx directus schema apply /directus/schema.yaml --yes || echo "Schema apply failed, continuing..."
fi

# Start Directus
npx directus start