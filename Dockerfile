ARG ALPINE_VERSION

FROM alpine:${ALPINE_VERSION}

ARG PHP_VERSION
ARG PHP_NUMBER
ARG ENVIROMENT=general
ARG VARIANT=full

ENV VALIDATE_TIMESTAMPS=1
ENV REVALIDATE_FREQ=2
ENV TZ="UTC"
ENV WITH_QUEUE=false
ENV WITH_SCHEDULE=false

# Set label information
LABEL org.opencontainers.image.maintainer="Aditya Darma <adhit.boys1@gmail.com>"
LABEL org.opencontainers.image.description="Lightweight Image for PHP."
LABEL org.opencontainers.image.os="Alpine Linux ${ALPINE_VERSION}"
LABEL org.opencontainers.image.php="${PHP_VERSION}"

# Install package
RUN echo "VARIANT=${VARIANT}" && apk add --update --no-cache \
    tzdata \
    curl \
    git \
    nano \
    nginx \
    supervisor \
    gettext \
    php${PHP_NUMBER} \
    php${PHP_NUMBER}-curl \
    php${PHP_NUMBER}-ctype \
    php${PHP_NUMBER}-dom \
    php${PHP_NUMBER}-fileinfo \
    php${PHP_NUMBER}-fpm \
    php${PHP_NUMBER}-json \
    php${PHP_NUMBER}-mbstring \
    php${PHP_NUMBER}-opcache \
    php${PHP_NUMBER}-openssl \
    php${PHP_NUMBER}-tokenizer \
    && case "$VARIANT" in \
        mini) apk add --no-cache \
            php${PHP_NUMBER}-bcmath \
            php${PHP_NUMBER}-iconv \
            php${PHP_NUMBER}-pdo_mysql \
            php${PHP_NUMBER}-pdo_sqlite \
            php${PHP_NUMBER}-phar \
            php${PHP_NUMBER}-session ;; \
        full) apk add --no-cache \
            mysql-client \
            php${PHP_NUMBER}-bcmath \
            php${PHP_NUMBER}-exif \
            php${PHP_NUMBER}-gd \
            php${PHP_NUMBER}-iconv \
            php${PHP_NUMBER}-mysqli \
            php${PHP_NUMBER}-pdo_mysql \
            php${PHP_NUMBER}-pdo_pgsql \
            php${PHP_NUMBER}-pdo_sqlite \
            php${PHP_NUMBER}-pecl-imagick \
            php${PHP_NUMBER}-phar \
            php${PHP_NUMBER}-session \
            php${PHP_NUMBER}-simplexml \
            php${PHP_NUMBER}-xml \
            php${PHP_NUMBER}-xmlreader \
            php${PHP_NUMBER}-xmlwriter \
            php${PHP_NUMBER}-zip \
            php${PHP_NUMBER}-zlib ;; \
    esac \
    && rm -rf /var/cache/apk/*

# Symlink if not found
RUN if [ ! -e /usr/bin/php ]; then ln -s /usr/bin/php${PHP_NUMBER} /usr/bin/php; fi

# Install composer from the official image
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Copy file configurator
COPY custom/www.conf /etc/php${PHP_NUMBER}/php-fpm.d/www.conf
COPY custom/php.ini /etc/php${PHP_NUMBER}/conf.d/custom.ini
COPY custom/nginx.conf /etc/nginx/nginx.conf
COPY custom/supervisord.conf.template /etc/supervisord.conf.template

# Setup document root for application
WORKDIR /app

# Replace string and make sure files/folders needed by the processes are accessable when they run under the nobody user
RUN sed -i "s|command=php-fpm -F|command=php-fpm${PHP_NUMBER} -F|g" /etc/supervisord.conf.template && \
    chown -R nobody:nogroup /app /run /var/lib/nginx /var/log/nginx /etc/supervisord.conf 

# Copy file entrypoint to container
COPY custom/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Switch to use a non-root user from here on
USER nobody

# Expose the port nginx is reachable on
EXPOSE 8000

# Start entrypoint
ENTRYPOINT ["/entrypoint.sh"]