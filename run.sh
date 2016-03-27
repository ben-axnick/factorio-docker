#!/bin/bash

if [ ! -z "${SAVE_FILE_URL}" ]; then
  echo "Fetching save from ${SAVE_FILE_URL}"
  curl -kL "${SAVE_FILE_URL}" > "saves/default.zip"
fi

if [ ! -f "/opt/factorio/saves/default.zip" ]; then
  echo "Creating a default Factorio save"
  /opt/factorio/bin/x64/factorio --create default
fi

exec /opt/factorio/bin/x64/factorio "$@"
