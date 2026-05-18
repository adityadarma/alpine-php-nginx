# Docker Alpine Linux Lightweight

## General Modules
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
- mysql-client (optional)
- postgresql-client (optional)

## PHP Modules

### Required
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

> **Note:** Some packages (e.g. `opcache`, `json`, `iconv`, `zlib`) are bundled into the main PHP package in newer versions and will be skipped automatically if not available as standalone packages.

### Optional (included in `full` and `node` variants)
- php*-exif
- php*-gd
- php*-pdo_pgsql
- php*-pecl-imagick
- php*-simplexml
- php*-xml
- php*-xmlreader
- php*-xmlwriter
- php*-zip
- php*-zlib

---

# Build

## Build Args
- `--build-arg VARIANT=mini|node|full` (default: `full`)

| Variant | Description |
|---------|-------------|
| `full`  | Default. Includes all optional PHP extensions. |
| `mini`  | Minimal install. Only required PHP extensions. |
| `node`  | Full extensions + Node.js and npm. |

## Environment Variables
| Variable | Default | Description |
|----------|---------|-------------|
| `VALIDATE_TIMESTAMPS` | `1` | Enable OPcache timestamp validation |
| `REVALIDATE_FREQ` | `2` | OPcache revalidation frequency (seconds) |
| `TZ` | `UTC` | Container timezone |
| `WITH_QUEUE` | `false` | Start Laravel queue worker |
| `WITH_SCHEDULE` | `false` | Start Laravel scheduler |
| `WITH_VITE` | `false` | Start Vite dev server |
| `WITH_CRON` | `false` | Enable cron via supercronic |
| `MAX_BODY_SIZE` | `50m` | Nginx max client body size |
| `MAX_TIMEOUT` | `120` | Nginx & proxy timeout (seconds) |

---

## Build Local (Testing)

Use `build-local.sh` to build all images locally before pushing to Docker Hub.

```bash
# Make the script executable (first time only)
chmod +x build-local.sh

# Build all images (15 total)
./build-local.sh

# Build all variants for a specific PHP version
./build-local.sh 8.5

# Build a specific PHP version and variant
./build-local.sh 8.4 full
./build-local.sh 8.3 mini
./build-local.sh 8.5 node
```

The script displays a per-image progress counter, shows build logs on failure, and prints a summary with total passed/failed/skipped count and elapsed time.

---

## Build Manual

```bash
docker build --build-arg ALPINE_VERSION=3.15 --build-arg PHP_VERSION=7.4 --build-arg PHP_NUMBER=7 -t adityadarma/alpine-php-nginx:7.4 -f Dockerfile .
docker build --build-arg ALPINE_VERSION=3.15 --build-arg PHP_VERSION=7.4 --build-arg PHP_NUMBER=7 --build-arg VARIANT=mini -t adityadarma/alpine-php-nginx:7.4-mini -f Dockerfile .
docker build --build-arg ALPINE_VERSION=3.16 --build-arg PHP_VERSION=8.0 --build-arg PHP_NUMBER=8 -t adityadarma/alpine-php-nginx:8.0 -f Dockerfile .
docker build --build-arg ALPINE_VERSION=3.19 --build-arg PHP_VERSION=8.1 --build-arg PHP_NUMBER=81 -t adityadarma/alpine-php-nginx:8.1 -f Dockerfile .
docker build --build-arg ALPINE_VERSION=3.19 --build-arg PHP_VERSION=8.1 --build-arg PHP_NUMBER=81 --build-arg VARIANT=mini -t adityadarma/alpine-php-nginx:8.1-mini -f Dockerfile .
docker build --build-arg ALPINE_VERSION=3.21 --build-arg PHP_VERSION=8.2 --build-arg PHP_NUMBER=82 -t adityadarma/alpine-php-nginx:8.2 -f Dockerfile .
docker build --build-arg ALPINE_VERSION=3.23 --build-arg PHP_VERSION=8.3 --build-arg PHP_NUMBER=83 -t adityadarma/alpine-php-nginx:8.3 -f Dockerfile .
docker build --build-arg ALPINE_VERSION=3.23 --build-arg PHP_VERSION=8.3 --build-arg PHP_NUMBER=83 --build-arg VARIANT=mini -t adityadarma/alpine-php-nginx:8.3-mini -f Dockerfile .
docker build --build-arg ALPINE_VERSION=3.23 --build-arg PHP_VERSION=8.3 --build-arg PHP_NUMBER=83 --build-arg VARIANT=node -t adityadarma/alpine-php-nginx:8.3-node -f Dockerfile .
docker build --build-arg ALPINE_VERSION=3.23 --build-arg PHP_VERSION=8.4 --build-arg PHP_NUMBER=84 -t adityadarma/alpine-php-nginx:8.4 -f Dockerfile .
docker build --build-arg ALPINE_VERSION=3.23 --build-arg PHP_VERSION=8.4 --build-arg PHP_NUMBER=84 --build-arg VARIANT=mini -t adityadarma/alpine-php-nginx:8.4-mini -f Dockerfile .
docker build --build-arg ALPINE_VERSION=3.23 --build-arg PHP_VERSION=8.4 --build-arg PHP_NUMBER=84 --build-arg VARIANT=node -t adityadarma/alpine-php-nginx:8.4-node -f Dockerfile .
docker build --build-arg ALPINE_VERSION=3.23 --build-arg PHP_VERSION=8.5 --build-arg PHP_NUMBER=85 -t adityadarma/alpine-php-nginx:8.5 -f Dockerfile .
docker build --build-arg ALPINE_VERSION=3.23 --build-arg PHP_VERSION=8.5 --build-arg PHP_NUMBER=85 --build-arg VARIANT=mini -t adityadarma/alpine-php-nginx:8.5-mini -f Dockerfile .
docker build --build-arg ALPINE_VERSION=3.23 --build-arg PHP_VERSION=8.5 --build-arg PHP_NUMBER=85 --build-arg VARIANT=node -t adityadarma/alpine-php-nginx:8.5-node -f Dockerfile .
```

## Push to Docker Hub

```bash
docker push adityadarma/alpine-php-nginx:7.4
docker push adityadarma/alpine-php-nginx:7.4-mini
docker push adityadarma/alpine-php-nginx:8.0
docker push adityadarma/alpine-php-nginx:8.1
docker push adityadarma/alpine-php-nginx:8.1-mini
docker push adityadarma/alpine-php-nginx:8.2
docker push adityadarma/alpine-php-nginx:8.3
docker push adityadarma/alpine-php-nginx:8.3-mini
docker push adityadarma/alpine-php-nginx:8.3-node
docker push adityadarma/alpine-php-nginx:8.4
docker push adityadarma/alpine-php-nginx:8.4-mini
docker push adityadarma/alpine-php-nginx:8.4-node
docker push adityadarma/alpine-php-nginx:8.5
docker push adityadarma/alpine-php-nginx:8.5-mini
docker push adityadarma/alpine-php-nginx:8.5-node
```