#!/bin/sh -l

# Script im Fehlerfall abbrechen
set -eu

# versch. Versionsstrings auslesen
VERSION=$(echo $GITHUB_REF| cut -d'/' -f 3)
MINOR=$(echo $VERSION| cut -d'.' -f 1,2)
MAJOR=$(echo $VERSION| cut -d'.' -f 1)

# Outputs für nachfolgende Steps setzen
echo "::set-output name=version_major::${MAJOR}"
echo "::set-output name=version_minor::${MINOR}"
echo "::set-output name=version_patch::${VERSION}"