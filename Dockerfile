# FROM directus/directus:11.14.0

# # Copy schema file from directus subdirectory
# COPY directus/schema.yaml /directus/schema.yaml

# # Copy entrypoint script
# COPY docker-entrypoint.sh /docker-entrypoint.sh

# # Use the script as entrypoint
# ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]

FROM directus/directus:11.14.0

USER root
# Ensure the script is executable
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

# Copy schema to the location the script expects
COPY directus/schema.yaml /directus/schema.yaml

USER node
ENTRYPOINT ["/bin/sh", "/docker-entrypoint.sh"]