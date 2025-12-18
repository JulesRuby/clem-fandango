FROM directus/directus:11.14.0

# Copy schema file
COPY schema.yaml /directus/schema.yaml

# Copy entrypoint script
COPY docker-entrypoint.sh /docker-entrypoint.sh

# Use the script as entrypoint (Docker will handle permissions)
ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]