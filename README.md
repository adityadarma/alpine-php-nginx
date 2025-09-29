# Docker Alpine Linux Lightweight

## Module General
- bash
- curl
- gettext
- git
- logrotate
- supercronic
- nano
- nginx
- supervisor
- tzdata
- mysql-client (opsional)
- postgresql-client (opsional)

## Module PHP
### Pre Required
- php*
- php*-bcmath
- php*-ctype
- php*-curl
- php*-dom
- php*-fileinfo
- php*-fpm
- php*-iconv
- php*-json
- php*-mbstring
- php*-mysqli
- php*-opcache
- php*-openssl
- php*-pdo_mysql
- php*-pdo_sqlite
- php*-phar
- php*-session
- php*-tokenizer

### Optional
- php*-exif (opsional)
- php*-gd (opsional)
- php*-pdo_pgsql (opsional)
- php*-pecl-imagick (opsional)
- php*-simplexml (opsional)
- php*-xml (opsional)
- php*-xmlreader (opsional)
- php*-xmlwriter (opsional)
- php*-zip (opsional)
- php*-zlib (opsional)

# Build

## Build Args
- --build-arg VARIANT=mini/vite (default=full)

## Custom Enviroment
- VALIDATE_TIMESTAMPS (default=1)
- REVALIDATE_FREQ (default=2)
- TZ (default=UTC)
- WITH_QUEUE (default=false)
- WITH_SCHEDULE (default=false)
- WITH_VITE (default=false)
- WITH_CRON (default=false)
- MAX_BODY_SIZE (default=50m)
- MAX_TIMEOUT (default=120)

## Build Manual
- docker build --build-arg ALPINE_VERSION=3.15 --build-arg PHP_VERSION=7.4 --build-arg PHP_NUMBER=7 -t adityadarma/alpine-php-nginx:7.4 -f Dockerfile .
- docker build --build-arg ALPINE_VERSION=3.16 --build-arg PHP_VERSION=8.0 --build-arg PHP_NUMBER=8 -t adityadarma/alpine-php-nginx:8.0 -f Dockerfile .
- docker build --build-arg ALPINE_VERSION=3.19 --build-arg PHP_VERSION=8.1 --build-arg PHP_NUMBER=81 -t adityadarma/alpine-php-nginx:8.1 -f Dockerfile .
- docker build --build-arg ALPINE_VERSION=3.19 --build-arg PHP_VERSION=8.1 --build-arg PHP_NUMBER=81 --build-arg VARIANT=mini -t adityadarma/alpine-php-nginx:8.1-mini -f Dockerfile .
- docker build --build-arg ALPINE_VERSION=3.22 --build-arg PHP_VERSION=8.2 --build-arg PHP_NUMBER=82 -t adityadarma/alpine-php-nginx:8.2 -f Dockerfile .
- docker build --build-arg ALPINE_VERSION=3.22 --build-arg PHP_VERSION=8.3 --build-arg PHP_NUMBER=83 -t adityadarma/alpine-php-nginx:8.3 -f Dockerfile .
- docker build --build-arg ALPINE_VERSION=3.22 --build-arg PHP_VERSION=8.3 --build-arg PHP_NUMBER=83 --build-arg VARIANT=mini -t adityadarma/alpine-php-nginx:8.3-mini -f Dockerfile .
- docker build --build-arg ALPINE_VERSION=3.22 --build-arg PHP_VERSION=8.3 --build-arg PHP_NUMBER=83 --build-arg VARIANT=node -t adityadarma/alpine-php-nginx:8.3-node -f Dockerfile .
- docker build --build-arg ALPINE_VERSION=3.22 --build-arg PHP_VERSION=8.4 --build-arg PHP_NUMBER=84 -t adityadarma/alpine-php-nginx:8.4 -f Dockerfile .
- docker build --build-arg ALPINE_VERSION=3.22 --build-arg PHP_VERSION=8.4 --build-arg PHP_NUMBER=84 --build-arg VARIANT=mini -t adityadarma/alpine-php-nginx:8.4-mini -f Dockerfile .
- docker build --build-arg ALPINE_VERSION=3.22 --build-arg PHP_VERSION=8.4 --build-arg PHP_NUMBER=84 --build-arg VARIANT=node -t adityadarma/alpine-php-nginx:8.4-node -f Dockerfile .

### Push to Docker Hub
- docker push adityadarma/alpine-php-nginx:7.4
- docker push adityadarma/alpine-php-nginx:8.0
- docker push adityadarma/alpine-php-nginx:8.1
- docker push adityadarma/alpine-php-nginx:8.1-mini
- docker push adityadarma/alpine-php-nginx:8.2
- docker push adityadarma/alpine-php-nginx:8.3
- docker push adityadarma/alpine-php-nginx:8.3-mini
- docker push adityadarma/alpine-php-nginx:8.3-node
- docker push adityadarma/alpine-php-nginx:8.4
- docker push adityadarma/alpine-php-nginx:8.4-mini
- docker push adityadarma/alpine-php-nginx:8.4-node