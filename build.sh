#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
BUILD_DIR=$(mktemp -d)

# build
cmake -GNinja -S"${SCRIPT_DIR}" -B"${BUILD_DIR}"
ninja -C "${BUILD_DIR}"

# test
"${BUILD_DIR}"/jwt-gen && echo "ok"

