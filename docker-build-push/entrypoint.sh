#!/bin/bash

# makes the script existing once an error occours
set -euo pipefail

INPUT_IMAGE_NAME=${INPUT_IMAGE_NAME:-"${GITHUB_REPOSITORY#*/}"}

# log into docker registry
echo ${INPUT_REGISTRY_PASSWORD} | docker login -u ${INPUT_REGISTRY_USERNAME} --password-stdin ${INPUT_REGISTRY_URL}

FULL_IMAGE_NAME=${INPUT_REGISTRY_URL}/${GITHUB_REPOSITORY}/${INPUT_IMAGE_NAME}:${INPUT_IMAGE_TAG}

docker build --tag ${FULL_IMAGE_NAME} .

docker push ${FULL_IMAGE_NAME}