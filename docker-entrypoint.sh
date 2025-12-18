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

echo "Starting Directus bootstrap..."
# Bootstrap creates system tables.
npx directus bootstrap

# Give the database a moment to finish internal indexing
sleep 3

if [ -f /directus/schema.yaml ]; then
  echo "Applying schema structure..."
  # Added --force to resolve the "filter of undefined" issue
  npx directus schema apply /directus/schema.yaml --yes --force || echo "Schema apply skipped."
fi

echo "Starting Directus..."
exec npx directus start