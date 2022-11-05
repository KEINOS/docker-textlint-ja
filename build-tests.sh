#!/bin/bash

set -euo pipefail

NAME_IMAGE_BASE="textlint/textlint:local"
NAME_IMAGE_TEST="textlint/textlint:test"

# Build image
docker build --no-cache -t "$NAME_IMAGE_BASE" .
docker build --no-cache -t "$NAME_IMAGE_TEST" -f "./tests/Dockerfile" ./tests
