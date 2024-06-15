FROM wordpress

ENV WORDPRESS_DB_HOST=127.0.0.1 \
    WORDPRESS_DB_USER=varanasi \
    WORDPRESS_DB_PASSWORD=roshan \
    WORDPRESS_DB_NAME=rosite \
    WORDPRESS_TABLE_PREFIX=wp_

COPY plugins/ /var/www/html/wp-content/plugins
COPY themes/ /var/www/html/wp-content/themes
COPY uploads/ /var/www/html/wp-content/uploads