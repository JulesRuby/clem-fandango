#!/bin/sh
set -e

echo "Starting Directus bootstrap..."

# Wait for database to be ready
sleep 5

# Bootstrap Directus (creates tables AND runs migrations)
echo "Bootstrapping Directus..."
npx directus bootstrap

# Apply schema if exists
if [ -f /directus/schema.yaml ]; then
  echo "Applying schema..."
  npx directus schema apply /directus/schema.yaml --yes || echo "Schema apply failed, continuing..."
fi

# Start Directus
echo "Starting Directus..."
npx directus start