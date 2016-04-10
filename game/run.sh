#!/bin/bash

if [ ! -z "${SAVE_FILE_URL}" ]; then
  echo "Fetching save from ${SAVE_FILE_URL}"
  remote_last_modified=$(curl -svX HEAD ${SAVE_FILE_URL} 2>&1 | grep '^< Last-Modified:')
  echo "Remote last mod: ${remote_last_modified}"
  curl -kL "${SAVE_FILE_URL}" > "saves/default.zip"
fi

if [ ! -z "${MODS_FILE_URL}" ]; then
  echo "Fetching mods from ${MODS_FILE_URL}"
  curl -kL "${MODS_FILE_URL}" > "mods.zip"
  rm -f mods/* && unzip mods.zip -d mods
  rm mods.zip
fi

if [ ! -f "/opt/factorio/saves/default.zip" ]; then
  echo "Creating a default Factorio save"
  /opt/factorio/bin/x64/factorio --create default
fi

exec /opt/factorio/bin/x64/factorio "$@"
