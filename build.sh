#!/bin/bash

# Get Arch Computer
ARCH=$(uname -m)

# Build Image on Arch
case $ARCH in
    x86_64)
        # Docker image PHP 7.4
        docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.15" --build-arg="PHP_VERSION=7.4" --build-arg="PHP_NUMBER=7" -t adityadarma/alpine-php-nginx:7.4 -f Dockerfile .
        docker push adityadarma/alpine-php-nginx:7.4
        echo "Build dan push Docker image PHP 7.4 selesai."

        # Docker image PHP 8.0
        docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.16" --build-arg="PHP_VERSION=8.0" --build-arg="PHP_NUMBER=8" -t adityadarma/alpine-php-nginx:8.0 -f Dockerfile .
        docker push adityadarma/alpine-php-nginx:8.0
        echo "Build dan push Docker image PHP 8.0 selesai."

        # Docker image PHP 8.1
        docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" -t adityadarma/alpine-php-nginx:8.1 -f Dockerfile .
        docker push adityadarma/alpine-php-nginx:8.1
        echo "Build dan push Docker image PHP 8.1 selesai."

        # Docker image PHP 8.2
        docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.18" --build-arg="PHP_VERSION=8.2" --build-arg="PHP_NUMBER=82" -t adityadarma/alpine-php-nginx:8.2 -f Dockerfile .
        docker push adityadarma/alpine-php-nginx:8.2
        echo "Build dan push Docker image PHP 8.2 selesai."

        # Docker image PHP 8.3
        docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.19" --build-arg="PHP_VERSION=8.3" --build-arg="PHP_NUMBER=83" -t adityadarma/alpine-php-nginx:8.3 -f Dockerfile .
        docker push adityadarma/alpine-php-nginx:8.3
        echo "Build dan push Docker image PHP 8.3 selesai."

        # Docker image PHP 8.1
        docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" --build-arg="ENVIROMENT=laravel" -t adityadarma/alpine-php-nginx:8.1-laravel -f Dockerfile .
        docker push adityadarma/alpine-php-nginx:8.1-laravel
        echo "Build dan push Docker image PHP 8.1 laravel selesai."

        # Docker image PHP 8.3
        docker build --build-arg="ALPINE_OS=alpine" --build-arg="ALPINE_VERSION=3.19" --build-arg="PHP_VERSION=8.3" --build-arg="PHP_NUMBER=83" --build-arg="ENVIROMENT=laravel" -t adityadarma/alpine-php-nginx:8.3-laravel -f Dockerfile .
        docker push adityadarma/alpine-php-nginx:8.3-laravel
        echo "Build dan push Docker image PHP 8.3 laravel selesai."
        ;;
    arm*)
        # Docker image PHP 7.4
        docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.15" --build-arg="PHP_VERSION=7.4" --build-arg="PHP_NUMBER=7" -t adityadarma/alpine-php-nginx:7.4-arm64 -f Dockerfile .
        docker push adityadarma/alpine-php-nginx:7.4-arm64
        echo "Build dan push Docker image PHP 7.4 selesai."

        # Docker image PHP 8.0
        docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.16" --build-arg="PHP_VERSION=8.0" --build-arg="PHP_NUMBER=8" -t adityadarma/alpine-php-nginx:8.0-arm64 -f Dockerfile .
        docker push adityadarma/alpine-php-nginx:8.0-arm64
        echo "Build dan push Docker image PHP 8.0 selesai."

        # Docker image PHP 8.1
        docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" -t adityadarma/alpine-php-nginx:8.1-arm64 -f Dockerfile .
        docker push adityadarma/alpine-php-nginx:8.1-arm64
        echo "Build dan push Docker image PHP 8.1 selesai."

        # Docker image PHP 8.2
        docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.18" --build-arg="PHP_VERSION=8.2" --build-arg="PHP_NUMBER=82" -t adityadarma/alpine-php-nginx:8.2-arm64 -f Dockerfile .
        docker push adityadarma/alpine-php-nginx:8.2-arm64
        echo "Build dan push Docker image PHP 8.2 selesai."

        # Docker image PHP 8.3
        docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.19" --build-arg="PHP_VERSION=8.3" --build-arg="PHP_NUMBER=83" -t adityadarma/alpine-php-nginx:8.3-arm64 -f Dockerfile .
        docker push adityadarma/alpine-php-nginx:8.3-arm64
        echo "Build dan push Docker image PHP 8.3 selesai."

        # Docker image PHP 8.1
        docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" --build-arg="ENVIROMENT=laravel" -t adityadarma/alpine-php-nginx:8.1-arm64-laravel -f Dockerfile .
        docker push adityadarma/alpine-php-nginx:8.1-arm64-laravel
        echo "Build dan push Docker image PHP 8.1 laravel selesai."

        # Docker image PHP 8.3
        docker build --build-arg="ALPINE_OS=arm64v8/alpine" --build-arg="ALPINE_VERSION=3.19" --build-arg="PHP_VERSION=8.3" --build-arg="PHP_NUMBER=83" --build-arg="ENVIROMENT=laravel" -t adityadarma/alpine-php-nginx:8.3-arm64-laravel -f Dockerfile .
        docker push adityadarma/alpine-php-nginx:8.3-arm64-laravel
        echo "Build dan push Docker image PHP 8.3 laravel selesai."
        ;;
    *)
        echo "Arsitektur tidak dikenal: $ARCH"
        ;;
esac