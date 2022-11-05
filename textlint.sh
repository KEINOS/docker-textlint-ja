#!/usr/bin/env bash

# -----------------------------------------------------------------------------
#  This script runs textlint via Docker container.
#
#  Use this script if you want to run textlint on your local machine but without
#  installing textlint and its dependencies.
#
#  Usage:
#    $ ./run-textlint.sh [options] [files]
#  Example:
#    $ ./run-textlint.sh README.md
# -----------------------------------------------------------------------------

NAME_IMAGE="textlint/textlint:local"

# imageExists checks if the Docker image for textlint exists.
imageExists() {
    docker image inspect "$NAME_IMAGE" 2>/dev/null 1>/dev/null || {
        return 1
    }

    return 0
}

# buildImage forces to build the image.
buildImage() {
    if imageExists; then
        docker build --no-cache -t "$NAME_IMAGE" .
    else
        docker build -t "$NAME_IMAGE" .
    fi
}

# runTextlint mounts the current directory to "/workspace/data" and runs textlint.
runTextlint() {
    imageExists || {
        printf -- '- Docker image for textlint "%s" does not exist. Building ... ' "$NAME_IMAGE"
        result=$(buildImage 2>&1) || {
            echo "$result"
            echo "Failed to build the image."
            exit 1
        }
        echo "Done."
    }

    local host_src_volume="${PWD}"
    local container_dest_volume="/workspace/data"

    echo "- Running textlint:"
    docker run --rm \
        --volume="${host_src_volume}:${container_dest_volume}" \
        --workdir="${container_dest_volume}" \
        "${NAME_IMAGE}" \
        "$@"
}

runTextlint --rulesdir="/workspace" "$@"
