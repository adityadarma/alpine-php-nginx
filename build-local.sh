#!/usr/bin/env bash
# =============================================================================
# build-local.sh — Build all alpine-php-nginx images locally for testing
# Usage:
#   ./build-local.sh              → build all images
#   ./build-local.sh 8.4          → build only PHP 8.4 variants
#   ./build-local.sh 8.5 full     → build only PHP 8.5 full variant
# =============================================================================

set -euo pipefail

DOCKERFILE="Dockerfile"
IMAGE_NAME="adityadarma/alpine-php-nginx"
FILTER_PHP="${1:-}"
FILTER_VARIANT="${2:-}"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# Track results
PASSED=()
FAILED=()
SKIPPED=()

# =============================================================================
# Matrix: alpine_version | php_version | php_number | variant | tag_suffix
# =============================================================================
MATRIX=(
  "3.15  7.4  7   full  7.4"
  "3.15  7.4  7   mini  7.4-mini"
  "3.16  8.0  8   full  8.0"
  "3.19  8.1  81  full  8.1"
  "3.19  8.1  81  mini  8.1-mini"
  "3.21  8.2  82  full  8.2"
  "3.23  8.3  83  full  8.3"
  "3.23  8.3  83  mini  8.3-mini"
  "3.23  8.3  83  node  8.3-node"
  "3.23  8.4  84  full  8.4"
  "3.23  8.4  84  mini  8.4-mini"
  "3.23  8.4  84  node  8.4-node"
  "3.23  8.5  85  full  8.5"
  "3.23  8.5  85  mini  8.5-mini"
  "3.23  8.5  85  node  8.5-node"
)

TOTAL=${#MATRIX[@]}
CURRENT=0

echo -e "${BOLD}╔══════════════════════════════════════════════════════╗${RESET}"
echo -e "${BOLD}║        alpine-php-nginx — Local Build Script         ║${RESET}"
echo -e "${BOLD}╚══════════════════════════════════════════════════════╝${RESET}"
echo ""

if [ -n "$FILTER_PHP" ]; then
  echo -e "${YELLOW}▶ Filter PHP version : ${FILTER_PHP}${RESET}"
fi
if [ -n "$FILTER_VARIANT" ]; then
  echo -e "${YELLOW}▶ Filter variant     : ${FILTER_VARIANT}${RESET}"
fi
echo -e "${CYAN}▶ Total images       : ${TOTAL}${RESET}"
echo ""

# =============================================================================
build_image() {
  local alpine_version="$1"
  local php_version="$2"
  local php_number="$3"
  local variant="$4"
  local tag="$5"
  local full_tag="${IMAGE_NAME}:${tag}"

  CURRENT=$((CURRENT + 1))

  # Apply filters
  if [ -n "$FILTER_PHP" ] && [ "$php_version" != "$FILTER_PHP" ]; then
    SKIPPED+=("$full_tag")
    return
  fi
  if [ -n "$FILTER_VARIANT" ] && [ "$variant" != "$FILTER_VARIANT" ]; then
    SKIPPED+=("$full_tag")
    return
  fi

  echo -e "${BOLD}[${CURRENT}/${TOTAL}] Building${RESET} ${CYAN}${full_tag}${RESET}"
  echo -e "       Alpine ${alpine_version} | PHP ${php_version} | Variant: ${variant}"

  VARIANT_ARG=""
  if [ "$variant" != "full" ]; then
    VARIANT_ARG="--build-arg VARIANT=${variant}"
  fi

  BUILD_LOG=$(mktemp)

  if docker build \
      --no-cache \
      --build-arg "ALPINE_VERSION=${alpine_version}" \
      --build-arg "PHP_VERSION=${php_version}" \
      --build-arg "PHP_NUMBER=${php_number}" \
      ${VARIANT_ARG} \
      --tag "${full_tag}" \
      --file "${DOCKERFILE}" \
      . > "$BUILD_LOG" 2>&1; then
    echo -e "       ${GREEN}✔ SUCCESS${RESET}"
    PASSED+=("$full_tag")
  else
    echo -e "       ${RED}✘ FAILED${RESET}"
    echo -e "${RED}--- Build log (last 20 lines) ---${RESET}"
    tail -20 "$BUILD_LOG" | sed 's/^/  /'
    echo -e "${RED}---------------------------------${RESET}"
    FAILED+=("$full_tag")
  fi

  rm -f "$BUILD_LOG"
  echo ""
}

# =============================================================================
START_TIME=$(date +%s)

for entry in "${MATRIX[@]}"; do
  read -r alpine php_ver php_num variant tag <<< "$entry"
  build_image "$alpine" "$php_ver" "$php_num" "$variant" "$tag"
done

END_TIME=$(date +%s)
ELAPSED=$((END_TIME - START_TIME))
MINUTES=$((ELAPSED / 60))
SECONDS=$((ELAPSED % 60))

# =============================================================================
echo -e "${BOLD}╔══════════════════════════════════════════════════════╗${RESET}"
echo -e "${BOLD}║                    Build Summary                     ║${RESET}"
echo -e "${BOLD}╚══════════════════════════════════════════════════════╝${RESET}"
echo -e "  ⏱  Duration : ${MINUTES}m ${SECONDS}s"
echo -e "  📦 Total    : ${TOTAL}"
echo -e "  ${GREEN}✔ Passed   : ${#PASSED[@]}${RESET}"
echo -e "  ${RED}✘ Failed   : ${#FAILED[@]}${RESET}"
echo -e "  ⊘  Skipped  : ${#SKIPPED[@]}"
echo ""

if [ ${#PASSED[@]} -gt 0 ]; then
  echo -e "${GREEN}${BOLD}Passed:${RESET}"
  for img in "${PASSED[@]}"; do
    echo -e "  ${GREEN}✔${RESET} $img"
  done
  echo ""
fi

if [ ${#FAILED[@]} -gt 0 ]; then
  echo -e "${RED}${BOLD}Failed:${RESET}"
  for img in "${FAILED[@]}"; do
    echo -e "  ${RED}✘${RESET} $img"
  done
  echo ""
  exit 1
fi

if [ ${#SKIPPED[@]} -gt 0 ]; then
  echo -e "${YELLOW}${BOLD}Skipped:${RESET}"
  for img in "${SKIPPED[@]}"; do
    echo -e "  ⊘ $img"
  done
  echo ""
fi

echo -e "${GREEN}${BOLD}All builds completed successfully!${RESET}"
