#!/bin/bash
set -euo pipefail

# Script imported from ParadiseSS13

if [ -d "$HOME/BYOND/byond/bin" ] && grep -Fxq "{$1}.{$2}" $HOME/BYOND/version.txt;
then
  echo "Using cached directory."
else
  echo "Setting up BYOND."
  rm -rf "$HOME/BYOND"
  mkdir -p "$HOME/BYOND"
  cd "$HOME/BYOND"
  curl "http://www.byond.com/download/build/{$1}/{$1}.{$2}_byond_linux.zip" -o byond.zip
  unzip byond.zip
  rm byond.zip
  cd byond
  make here
  echo "$1.$2" > "$HOME/BYOND/version.txt"
  cd ~/
fi
