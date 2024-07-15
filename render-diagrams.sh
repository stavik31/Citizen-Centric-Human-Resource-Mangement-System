#!/usr/bin/env zsh

echo "Checking for plantuml and installing if missing..."
brew list plantuml || brew install plantuml
echo "Rendering diagrams in $( cd "$( dirname "$0" )" && pwd )/diagrams"
plantuml "$( cd "$( dirname "$0" )" && pwd )/diagrams" -svg