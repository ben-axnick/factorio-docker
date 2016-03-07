#!/bin/bash

MACHINE_NAME=${MACHINE_NAME-factorio}
AWS_INSTANCE_TYPE=t2.small

if [ -z "${AWS_SECRET_ACCESS_KEY}" ]; then
  echo "Cannot proceed. Export your AWS credentials."
  exit 1
fi

echo "Creating machine..."

docker-machine create \
  --driver amazonec2 \
  --amazonec2-access-key "${AWS_ACCESS_KEY_ID}" \
  --amazonec2-secret-key "${AWS_SECRET_ACCESS_KEY}" \
  --amazonec2-region "${AWS_DEFAULT_REGION}" \
  --amazonec2-vpc-id "${AWS_VPC_ID}" \
  --amazonec2-instance-type "${AWS_INSTANCE_TYPE}" \
  ${MACHINE_NAME}

if [ $? -ne 0 ]; then
  echo "Something went wrong. Sorry."
else
  echo "Done."
fi
