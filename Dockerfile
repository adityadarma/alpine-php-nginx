FROM alpine:3.16

# Set label information
LABEL Maintainer="Aditya Darma <adhit.boys1@gmail.com>"
LABEL Description="Lightweight Image for development."
LABEL OS Version="Alpine Linux 3.16"
LABEL PHP Version="8.1"
LABEL Nginx Version="1.22.0"

# Setup document root for application
WORKDIR /var/www/html

# Install packages default without cache
RUN apk add --no-cache \
    curl \
    git \
    nano 

# Install package PHP
RUN apk add --no-cache \
    php81 \
    php81-bcmath \
    php81-ctype \
    php81-curl \
    php81-dom \
    php81-fileinfo \
    php81-fpm \
    php81-gd \
    php81-iconv \
    php81-json \
    php81-mbstring \
    php81-opcache \
    php81-openssl \
    php81-pdo_mysql \
    php81-pdo_pgsql \
    php81-pecl-imagick \
    php81-phar \
    php81-simplexml \
    php81-session \
    php81-tokenizer \
    php81-xml \
    php81-xmlreader \
    php81-xmlwriter \
    php81-zip \
    php81-zlib

# Configure PHP-FPM
COPY .docker/www.conf /etc/php81/php-fpm.d/www.conf
COPY .docker/custom.ini /etc/php81/conf.d/custom.ini

# Install packages Nginx
RUN apk add --no-cache \
    nginx

# Configure nginx
COPY .docker/nginx.conf /etc/nginx/nginx.conf

# Expose the port nginx is reachable on
EXPOSE 80

# Install packages Supervisor
RUN apk add --no-cache \
    supervisor

# Configure supervisord
COPY .docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install composer from the official image
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R nobody.nobody /var/www/html /run /var/lib/nginx /var/log/nginx

# Switch to use a non-root user from here on
USER nobody

# Remove cache application
RUN rm -rf /var/cache/apk/*

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]