ARG ALPINE_OS
ARG ALPINE_VERSION

FROM ${ALPINE_OS}:${ALPINE_VERSION}

ARG PHP_VERSION
ARG PHP_NUMBER
ARG ENVIROMENT=general

# Set label information
LABEL Maintainer="Aditya Darma <adhit.boys1@gmail.com>"
LABEL Description="Lightweight Image for development."
LABEL OS Version="Alpine Linux ${ALPINE_VERSION}"
LABEL PHP Version="${PHP_VERSION}"

# Install package
RUN apk add --no-cache \
    curl \
    git \
    nano \
    nginx \
    supervisor \
    mysql-client \
    php${PHP_NUMBER} \
    php${PHP_NUMBER}-bcmath \
    php${PHP_NUMBER}-ctype \
    php${PHP_NUMBER}-curl \
    php${PHP_NUMBER}-dom \
    php${PHP_NUMBER}-fileinfo \
    php${PHP_NUMBER}-fpm \
    php${PHP_NUMBER}-iconv \
    php${PHP_NUMBER}-json \
    php${PHP_NUMBER}-mbstring \
    php${PHP_NUMBER}-opcache \
    php${PHP_NUMBER}-openssl \
    php${PHP_NUMBER}-phar \
    php${PHP_NUMBER}-simplexml \
    php${PHP_NUMBER}-session \
    php${PHP_NUMBER}-tokenizer \
    php${PHP_NUMBER}-xml \
    php${PHP_NUMBER}-xmlreader \
    php${PHP_NUMBER}-xmlwriter \
    php${PHP_NUMBER}-zip \
    php${PHP_NUMBER}-zlib \
    php${PHP_NUMBER}-mysqli \
    php${PHP_NUMBER}-pdo_mysql \
    php${PHP_NUMBER}-pdo_pgsql \
    php${PHP_NUMBER}-gd \
    php${PHP_NUMBER}-pecl-imagick 

RUN if [ ! -e /usr/bin/php ]; then ln -s /usr/bin/php{PHP_NUMBER} /usr/bin/php; fi

# Remove cache application
RUN rm -rf /var/cache/apk/*

# Install composer from the official image
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Copy file configurator
COPY custom/www.conf /etc/php${PHP_NUMBER}/php-fpm.d/www.conf
COPY custom/php-custom.ini /etc/php${PHP_NUMBER}/conf.d/custom.ini
COPY custom/nginx.conf /etc/nginx/nginx.conf
COPY supervisor/${PHP_VERSION}/supervisord-${ENVIROMENT}.conf /etc/supervisord.conf

# Setup document root for application
WORKDIR /app

# Make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN chown -R nobody.nobody /app /run /var/lib/nginx /var/log/nginx

# Switch to use a non-root user from here on
USER nobody

# Expose the port nginx is reachable on
EXPOSE 8000

# Let supervisord start nginx & php-fpm
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]