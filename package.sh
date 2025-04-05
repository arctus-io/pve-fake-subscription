#!/bin/bash
set -Eeuo pipefail
cd "$( dirname "${BASH_SOURCE[0]}" )" || exit 1

OUT_DIR="out"

rm -rf "${OUT_DIR}"
mkdir -p "${OUT_DIR}"

# build package
nfpm pkg --packager deb --target "${OUT_DIR}"

# generate checksum
cd "${OUT_DIR}"
sha256sum -b -- * > sha256sum.txt
cd ../
