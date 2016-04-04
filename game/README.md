# Factorio Docker

Minimal way of getting Factorio into the cloud quickly. Saves are mounted to the
local system so updates should be possible through a docker image rebuild.
Intended to be managed via docker-machine.

## Usage

```
# Load credentials
./machine-aws.sh
eval $(docker-machine env factorio)
docker-compose up -d
```
