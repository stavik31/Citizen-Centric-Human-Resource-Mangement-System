#!/usr/bin/env zsh

# Create a temporary directory and store its name in a variable.
TEMPD=$(mktemp -d)

# Exit if the temp directory wasn't created successfully.
if [ ! -e "$TEMPD" ]; then
    >&2 echo "Failed to create temp directory"
    exit 1
fi

# Make sure the temp directory gets removed on script exit.
trap "exit 1"           HUP INT PIPE QUIT TERM
trap 'rm -rf "$TEMPD"'  EXIT

echo "Checking for openapi-generator and installing if missing..."
brew list openapi-generator || brew install openapi-generator
openapi-generator generate -t ./apidocs/templates -i ./apidocs/api.yaml -g markdown --api-name-suffix Controller -o $TEMPD

rm -r ./_apidocs_controllers/
cp -a $TEMPD/Apis/. ./_apidocs_controllers/
rm -r ./_apidocs_models/
cp -a $TEMPD/Models/. ./_apidocs_models/
cp -a $TEMPD/README.md ./_includes/apidocs.md