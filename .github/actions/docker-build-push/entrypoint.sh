#!/bin/sh -l

# makes the script existing once an error occours
set -eu

INPUT_REGISTRY_PASSWORD=${$INPUT_REGISTRY_PASSWORD:-$GITHUB_TOKEN}
INPUT_IMAGE_NAME=${$INPUT_IMAGE_NAME:-${GITHUB_REPOSITORY#*/}}

# switch to working directory
cd ${INPUT_WORKING_DIRECTORY}

# log into docker registry
echo ${INPUT_REGISTRY_PASSWORD} | docker login -u ${INPUT_REGISTRY_USERNAME} --password-stdin ${INPUT_REGISTRY_URL}

FULL_IMAGE_NAME=${INPUT_REGISTRY_URL}/${GITHUB_REPOSITORY}/${INPUT_IMAGE_NAME}:${INPUT_IMAGE_TAG}

# build image
echo "::group::Build image"
docker build --tag ${FULL_IMAGE_NAME} .
echo "::endgroup::"

# push image to registry
echo "::group::Push image"
docker push ${FULL_IMAGE_NAME}
echo "::endgroup::"