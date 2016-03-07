#!/bin/bash

MACHINE_NAME=${MACHINE_NAME-factorio}
DIGITALOCEAN_REGION=${DIGITALOCEAN_REGION-sgp1}
DIGITALOCEAN_SIZE=${DIGITALOCEAN_SIZE-1gb}

if [ -z "${DIGITALOCEAN_ACCESS_TOKEN}" ]; then
  echo "Load \$DIGITALOCEAN_ACCESS_TOKEN into your env"
  exit 1
fi

echo "Creating machine..."

docker-machine create \
  --driver digitalocean \
  --digitalocean-access-token "${DIGITALOCEAN_ACCESS_TOKEN}" \
  --digitalocean-region "${DIGITALOCEAN_REGION}" \
  --digitalocean-size "${DIGITALOCEAN_SIZE}" \
  ${MACHINE_NAME}

if [ $? -ne 0 ]; then
  echo "Something went wrong. Sorry."
else
  echo "Done."
fi
