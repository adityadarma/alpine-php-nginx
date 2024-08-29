#!/bin/bash

# Get Arch Computer
ARCH=$(uname -m)

# Build Image on Arch
case $ARCH in
    x86_64)
        # Docker image PHP 7.4
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.15" --build-arg="PHP_VERSION=7.4" --build-arg="PHP_NUMBER=7" --tag adityadarma/alpine-php-nginx:7.4 .
        echo "Build dan push Docker image PHP 7.4 selesai."

        # Docker image PHP 8.0
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.16" --build-arg="PHP_VERSION=8.0" --build-arg="PHP_NUMBER=8" --tag adityadarma/alpine-php-nginx:8.0 .
        echo "Build dan push Docker image PHP 8.0 selesai."

        # Docker image PHP 8.1
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" --tag adityadarma/alpine-php-nginx:8.1 .
        echo "Build dan push Docker image PHP 8.1 selesai."

        # Docker image PHP 8.2
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.18" --build-arg="PHP_VERSION=8.2" --build-arg="PHP_NUMBER=82" --tag adityadarma/alpine-php-nginx:8.2 .
        echo "Build dan push Docker image PHP 8.2 selesai."

        # Docker image PHP 8.3
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.19" --build-arg="PHP_VERSION=8.3" --build-arg="PHP_NUMBER=83" --tag adityadarma/alpine-php-nginx:8.3 .
        echo "Build dan push Docker image PHP 8.3 selesai."

        # Docker image PHP 7.4
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.15" --build-arg="PHP_VERSION=7.4" --build-arg="PHP_NUMBER=7" --build-arg="ENVIROMENT=laravel" --tag adityadarma/alpine-php-nginx:7.4-laravel .
        echo "Build dan push Docker image PHP 7.4 laravel selesai."

        # Docker image PHP 8.1
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" --build-arg="ENVIROMENT=laravel" --tag adityadarma/alpine-php-nginx:8.1-laravel .
        echo "Build dan push Docker image PHP 8.1 laravel selesai."

        # Docker image PHP 8.3
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.19" --build-arg="PHP_VERSION=8.3" --build-arg="PHP_NUMBER=83" --build-arg="ENVIROMENT=laravel" --tag adityadarma/alpine-php-nginx:8.3-laravel .
        echo "Build dan push Docker image PHP 8.3 laravel selesai."
        ;;
    arm*)
        # Docker image PHP 7.4
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.15" --build-arg="PHP_VERSION=7.4" --build-arg="PHP_NUMBER=7" --tag adityadarma/alpine-php-nginx:7.4 .
        echo "Build dan push Docker image PHP 7.4 selesai."

        # Docker image PHP 8.0
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.16" --build-arg="PHP_VERSION=8.0" --build-arg="PHP_NUMBER=8" --tag adityadarma/alpine-php-nginx:8.0 .
        echo "Build dan push Docker image PHP 8.0 selesai."

        # Docker image PHP 8.1
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" --tag adityadarma/alpine-php-nginx:8.1 .
        echo "Build dan push Docker image PHP 8.1 selesai."

        # Docker image PHP 8.2
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.18" --build-arg="PHP_VERSION=8.2" --build-arg="PHP_NUMBER=82" --tag adityadarma/alpine-php-nginx:8.2 .
        echo "Build dan push Docker image PHP 8.2 selesai."

        # Docker image PHP 8.3
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.19" --build-arg="PHP_VERSION=8.3" --build-arg="PHP_NUMBER=83" --tag adityadarma/alpine-php-nginx:8.3 .
        echo "Build dan push Docker image PHP 8.3 selesai."

        # Docker image PHP 7.4
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.15" --build-arg="PHP_VERSION=7.4" --build-arg="PHP_NUMBER=7"  --build-arg="ENVIROMENT=laravel" --tag adityadarma/alpine-php-nginx:7.4-laravel .
        echo "Build dan push Docker image PHP 7.4 laravel selesai."

        # Docker image PHP 8.1
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.17" --build-arg="PHP_VERSION=8.1" --build-arg="PHP_NUMBER=81" --build-arg="ENVIROMENT=laravel" --tag adityadarma/alpine-php-nginx:8.1-laravel .
        echo "Build dan push Docker image PHP 8.1 laravel selesai."

        # Docker image PHP 8.3
        docker buildx build --push --platform=linux/arm64/v8,linux/amd64 --build-arg="ALPINE_VERSION=3.19" --build-arg="PHP_VERSION=8.3" --build-arg="PHP_NUMBER=83" --build-arg="ENVIROMENT=laravel" --tag adityadarma/alpine-php-nginx:8.3-laravel .
        echo "Build dan push Docker image PHP 8.3 laravel selesai."
        ;;
    *)
        echo "Arsitektur tidak dikenal: $ARCH"
        ;;
esac