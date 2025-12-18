FROM directus/directus:11.14.0

# Copy schema file
COPY schema.yaml /directus/schema.yaml

# Apply schema on startup (add to existing entrypoint)
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]