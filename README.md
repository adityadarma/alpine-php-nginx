# Docker Alpine Linux Lightweight

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
- php*-opcache
- php*-openssl
- php*-phar
- php*-simplexml
- php*-session
- php*-tokenizer
- php*-xml
- php*-xmlreader
- php*-xmlwriter
- php*-zip
- php*-zlib

### Database
- php*-pdo_mysql
- php*-pdo_pgsql

### Image
- php*-gd
- php*-pecl-imagick

## Build X86_64
- docker build -t adityadarma/alpine-php-nginx:8.1 -f x86_64/8.1/Dockerfile .
- docker build -t adityadarma/alpine-php-nginx:8.0 -f x86_64/8.0/Dockerfile .
- docker build -t adityadarma/alpine-php-nginx:7.4 -f x86_64/7.4/Dockerfile .

## Build ARM64
- docker build -t adityadarma/alpine-php-nginx:7.4-arm64 -f ARM64/7.4/Dockerfile .

## Push
- docker push adityadarma/alpine-php-nginx:8.1
- docker push adityadarma/alpine-php-nginx:8.0
- docker push adityadarma/alpine-php-nginx:7.4
- docker push adityadarma/alpine-php-nginx:7.4-arm64