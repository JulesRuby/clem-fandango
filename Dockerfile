FROM directus/directus:11.14.0

COPY directus/schema.yaml /directus/schema.yaml
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]