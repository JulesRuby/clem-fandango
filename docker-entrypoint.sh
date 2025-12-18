# #!/bin/sh
# set -e

# echo "Starting Directus bootstrap..."

# # Wait for database to be ready
# sleep 5

# # Bootstrap Directus (creates tables AND runs migrations)
# echo "Bootstrapping Directus..."
# npx directus bootstrap

# # Apply schema if exists
# if [ -f /directus/schema.yaml ]; then
#   echo "Applying schema..."
#   npx directus schema apply /directus/schema.yaml --yes || echo "Schema apply failed, continuing..."
# fi

# # Start Directus
# echo "Starting Directus..."
# npx directus start

#!/bin/sh
set -e

# Run migrations to ensure DB is up to date
echo "Running migrations..."
npx directus database migrate:latest

# Apply schema only if the file exists
if [ -f /directus/schema.yaml ]; then
  echo "Applying schema structure..."
  # Use --yes to skip confirmation prompts
  npx directus schema apply /directus/schema.yaml --yes || echo "Schema apply skipped."
fi

# Start the application (using exec to pass signals correctly)
echo "Starting Directus..."
exec npx directus start