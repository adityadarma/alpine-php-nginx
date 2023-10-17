FROM alpine:3.15

# Set label information
LABEL Maintainer="Aditya Darma <adhit.boys1@gmail.com>"
LABEL Description="Lightweight Image for development."
LABEL OS Version="Alpine Linux 3.15"
LABEL PHP Version="7.4"
LABEL Nginx Version="1.20"

# Setup document root for application
WORKDIR /app

# Install packages default without cache
RUN apk add --no-cache \
    curl \
    git \
    nano 

# Install package PHP
RUN apk add --no-cache \
    # Default
    php7 \
    php7-bcmath \
    php7-ctype \
    php7-curl \
    php7-dom \
    php7-fileinfo \
    php7-fpm \
    php7-iconv \
    php7-json \
    php7-mbstring \
    php7-opcache \
    php7-openssl \
    php7-phar \
    php7-simplexml \
    php7-session \
    php7-tokenizer \
    php7-xml \
    php7-xmlreader \
    php7-xmlwriter \
    php7-zip \
    php7-zlib \
    # Database
    php7-mysqli \
    php7-pdo_mysql \
    php7-pdo_pgsql \
    # Image
    php7-gd \
    php7-pecl-imagick

# Configure PHP-FPM
COPY ../../custom/www.conf /etc/php7/php-fpm.d/www.conf
COPY ../../custom/php-custom.ini /etc/php7/conf.d/custom.ini

# Install packages Nginx
RUN apk add --no-cache \
    nginx

# Configure nginx
COPY ../../custom/nginx.conf /etc/nginx/nginx.conf

# Expose the port nginx is reachable on
EXPOSE 8000

# Install packages Supervisor
RUN apk add --no-cache \
    supervisor

# Configure supervisord
COPY ../../supervisor/7.4/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Install composer from the official image
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R nobody.nobody /app /run /var/lib/nginx /var/log/nginx

# Switch to use a non-root user from here on
USER nobody

# Remove cache application
RUN rm -rf /var/cache/apk/*

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]