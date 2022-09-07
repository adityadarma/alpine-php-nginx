FROM alpine:3.16

# Set label information
LABEL Maintainer="Aditya Darma <adhit.boys1@gmail.com>"
LABEL Description="Lightweight Image for development."
LABEL OS Version="Alpine Linux 3.16"
LABEL PHP Version="8.0"
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
    php8 \
    php8-bcmath \
    php8-ctype \
    php8-curl \
    php8-dom \
    php8-fileinfo \
    php8-fpm \
    php8-gd \
    php8-iconv \
    php8-json \
    php8-mbstring \
    php8-opcache \
    php8-openssl \
    php8-pdo_mysql \
    php8-pdo_pgsql \
    php8-pecl-imagick \
    php8-phar \
    php8-simplexml \
    php8-session \
    php8-tokenizer \
    php8-xml \
    php8-xmlreader \
    php8-zip \
    php8-zlib

# Configure PHP-FPM
COPY .docker/www.conf /etc/php8/php-fpm.d/www.conf
COPY .docker/custom.ini /etc/php8/conf.d/custom.ini

# Install packages Nginx
RUN apk add --no-cache \
    nginx=1.22.0-r1

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