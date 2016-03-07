#!/bin/bash

if [ ! -f "/opt/factorio/saves/default.zip" ]; then
  echo "Creating a default Factorio save"
  /opt/factorio/bin/x64/factorio --create default
fi

exec /opt/factorio/bin/x64/factorio "$@"
