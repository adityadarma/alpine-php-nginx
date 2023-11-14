FROM alpine:3.18

# Set label information
LABEL Maintainer="Aditya Darma <adhit.boys1@gmail.com>"
LABEL Description="Lightweight Image for development."
LABEL OS Version="Alpine Linux 3.18"
LABEL PHP Version="8.2"
LABEL Nginx Version="1.24"

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
    php82 \
    php82-bcmath \
    php82-ctype \
    php82-curl \
    php82-dom \
    php82-fileinfo \
    php82-fpm \
    php82-iconv \
    php82-json \
    php82-mbstring \
    php82-opcache \
    php82-openssl \
    php82-phar \
    php82-simplexml \
    php82-session \
    php82-tokenizer \
    php82-xml \
    php82-xmlreader \
    php82-xmlwriter \
    php82-zip \
    php82-zlib \
    # Database
    php82-mysqli \
    php82-pdo_mysql \
    php82-pdo_pgsql \
    # Image
    php82-gd \
    php82-pecl-imagick

# Configure PHP-FPM
COPY ../../custom/www.conf /etc/php82/php-fpm.d/www.conf
COPY ../../custom/php-custom.ini /etc/php82/conf.d/custom.ini

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
COPY ../../supervisor/8.2/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

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