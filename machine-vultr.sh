#!/bin/bash

# Get Vultr plugin at https://github.com/janeczku/docker-machine-vultr/releases
MACHINE_NAME=${MACHINE_NAME-factorio}
VULTR_PLAN=93 # 1G
VULTR_REGION=19 # Sydney

if [ -z "${VULTR_API_KEY}" ]; then
  echo "Load \$VULTR_API_KEY into your env"
  exit 1
fi

echo "Creating machine..."

docker-machine create \
  --driver vultr \
  --vultr-api-key ${VULTR_API_KEY} \
  --vultr-plan-id ${VULTR_PLAN} \
  --vultr-region-id ${VULTR_REGION} \
  --vultr-backups \
  ${MACHINE_NAME}

if [ $? -ne 0 ]; then
  echo "Something went wrong. Sorry."
else
  echo "Done."
fi
