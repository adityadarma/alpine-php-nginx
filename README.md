# Docker Alpine Linux Lightweight

## Module General
- curl
- git (opsional)
- nano (opsional)
- nginx
- supervisor
- mysql-client (opsional)

## Module PHP
### Pre Required
- php*
- php*-bcmath
- php*-ctype
- php*-curl
- php*-dom
- php*-exif (opsional)
- php*-fileinfo
- php*-fpm
- php*-gd (opsional)
- php*-iconv
- php*-json
- php*-mbstring
- php*-mysqli (opsional)
- php*-opcache
- php*-openssl
- php*-pdo_mysql (default)
- php*-pdo_pgsql (opsional)
- php*-pdo_sqlite (opsional)
- php*-pecl-imagick (opsional)
- php*-phar (opsional)
- php*-session
- php*-simplexml (opsional)
- php*-tokenizer
- php*-xml
- php*-xmlreader (opsional)
- php*-xmlwriter (opsional)
- php*-zip (opsional)
- php*-zlib (opsional)

# Build

## Build Args (default=general)
- --build-arg="ENVIROMENT=laravel"

## Build Manual

### Build X86_64
- docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.15" --build-arg="PHP_VERSION=7.4" --build-arg="PHP_NUMBER=7" -t adityadarma/alpine-php-nginx:7.4 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.16" --build-arg="PHP_VERSION=8.0" --build-arg="PHP_NUMBER=8" -t adityadarma/alpine-php-nginx:8.0 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" -t adityadarma/alpine-php-nginx:8.1 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.18" --build-arg="PHP_VERSION=8.2" --build-arg="PHP_NUMBER=82" -t adityadarma/alpine-php-nginx:8.2 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.19" --build-arg="PHP_VERSION=8.3" --build-arg="PHP_NUMBER=83" -t adityadarma/alpine-php-nginx:8.3 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.15" --build-arg="PHP_VERSION=7.4" --build-arg="PHP_NUMBER=7" --build-arg="ENVIROMENT=laravel" -t adityadarma/alpine-php-nginx:7.4-laravel -f Dockerfile .
- docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" --build-arg="ENVIROMENT=laravel" -t adityadarma/alpine-php-nginx:8.1-laravel -f Dockerfile .
- docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.19" --build-arg="PHP_VERSION=8.3" --build-arg="PHP_NUMBER=83" --build-arg="ENVIROMENT=laravel" -t adityadarma/alpine-php-nginx:8.3-laravel -f Dockerfile .

### Build ARM64
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.15" --build-arg="PHP_VERSION=7.4" --build-arg="PHP_NUMBER=7" -t adityadarma/alpine-php-nginx:7.4-arm64 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.16" --build-arg="PHP_VERSION=8.0" --build-arg="PHP_NUMBER=8" -t adityadarma/alpine-php-nginx:8.0-arm64 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" -t adityadarma/alpine-php-nginx:8.1-arm64 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.18" --build-arg="PHP_VERSION=8.2" --build-arg="PHP_NUMBER=82" -t adityadarma/alpine-php-nginx:8.2-arm64 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.19" --build-arg="PHP_VERSION=8.3" --build-arg="PHP_NUMBER=83" -t adityadarma/alpine-php-nginx:8.3-arm64 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.15" --build-arg="PHP_VERSION=7.4" --build-arg="PHP_NUMBER=7"  --build-arg="ENVIROMENT=laravel" -t adityadarma/alpine-php-nginx:7.4-arm64-laravel -f Dockerfile .
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" --build-arg="ENVIROMENT=laravel" -t adityadarma/alpine-php-nginx:8.1-arm64-laravel -f Dockerfile .
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.19" --build-arg="PHP_VERSION=8.3" --build-arg="PHP_NUMBER=83" --build-arg="ENVIROMENT=laravel" -t adityadarma/alpine-php-nginx:8.3-arm64-laravel -f Dockerfile .

### Push X86_64
- docker push adityadarma/alpine-php-nginx:7.4
- docker push adityadarma/alpine-php-nginx:8.0
- docker push adityadarma/alpine-php-nginx:8.1
- docker push adityadarma/alpine-php-nginx:8.2
- docker push adityadarma/alpine-php-nginx:8.3
- docker push adityadarma/alpine-php-nginx:7.4-laravel
- docker push adityadarma/alpine-php-nginx:8.1-laravel
- docker push adityadarma/alpine-php-nginx:8.3-laravel

### Push ARM64
- docker push adityadarma/alpine-php-nginx:7.4-arm64
- docker push adityadarma/alpine-php-nginx:8.0-arm64
- docker push adityadarma/alpine-php-nginx:8.1-arm64
- docker push adityadarma/alpine-php-nginx:8.2-arm64
- docker push adityadarma/alpine-php-nginx:8.3-arm64
- docker push adityadarma/alpine-php-nginx:7.4-arm64-laravel
- docker push adityadarma/alpine-php-nginx:8.1-arm64-laravel
- docker push adityadarma/alpine-php-nginx:8.3-arm64-laravel

## Build Otomatis

### Permission
chmod +x build.sh
./build.sh