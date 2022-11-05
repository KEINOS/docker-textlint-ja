#!/bin/bash

set -euo pipefail

NAME_IMAGE_BASE="textlint/textlint:local"
NAME_IMAGE_TEST="textlint/textlint:test"
#PATH_DIR_CURR="$(cd "$(dirname "${BASH_SOURCE:-$0}")" && pwd)"

# Build image
docker build -t "$NAME_IMAGE_BASE" .
docker build -t "$NAME_IMAGE_TEST" -f "./tests/Dockerfile" ./tests

# Run image scan for vulnerabilities
#docker scan --token "$GITHUB_TOKEN" "$NAME_IMAGE_BASE"

# Run tests under tests directory
docker run --rm -it -v "$(pwd)":/workspace --workdir /workspace/tests "$NAME_IMAGE_TEST"
