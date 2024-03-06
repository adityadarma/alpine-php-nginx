# Docker Alpine Linux Lightweight

## Module PHP
- curl
- git
- nano
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
- php*-fileinfo
- php*-fpm
- php*-gd (opsional)
- php*-iconv
- php*-json
- php*-mbstring
- php*-mysqli
- php*-opcache
- php*-openssl
- php*-pdo_mysql
- php*-pdo_pgsql (opsional)
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

### Build ARM64
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.15" --build-arg="PHP_VERSION=7.4" --build-arg="PHP_NUMBER=7" -t adityadarma/alpine-php-nginx:7.4-arm64 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.16" --build-arg="PHP_VERSION=8.0" --build-arg="PHP_NUMBER=8" -t adityadarma/alpine-php-nginx:8.0-arm64 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" -t adityadarma/alpine-php-nginx:8.1-arm64 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.18" --build-arg="PHP_VERSION=8.2" --build-arg="PHP_NUMBER=82" -t adityadarma/alpine-php-nginx:8.2-arm64 -f Dockerfile .
- docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.19" --build-arg="PHP_VERSION=8.3" --build-arg="PHP_NUMBER=83" -t adityadarma/alpine-php-nginx:8.3-arm64 -f Dockerfile .

### Push X86_64
- docker push adityadarma/alpine-php-nginx:7.4
- docker push adityadarma/alpine-php-nginx:8.0
- docker push adityadarma/alpine-php-nginx:8.1
- docker push adityadarma/alpine-php-nginx:8.2
- docker push adityadarma/alpine-php-nginx:8.3

### Push ARM64
- docker push adityadarma/alpine-php-nginx:7.4-arm64
- docker push adityadarma/alpine-php-nginx:8.0-arm64
- docker push adityadarma/alpine-php-nginx:8.1-arm64
- docker push adityadarma/alpine-php-nginx:8.2-arm64
- docker push adityadarma/alpine-php-nginx:8.3-arm64

## Build Otomatis

### Permission
chmod +x build_x86.sh
chmod +x build_arm64.sh

### X86
./build_x86.sh

### ARM64
./build_arm64.sh