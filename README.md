# Factorio Docker

Minimal way of getting Factorio into the cloud quickly. Saves are mounted to the
local system so updates are possible by recreating the image.

Intended to be managed via docker-machine.

## Deployment

Scripts are provided to spin up Docker Machine in either AWS or DigitalOcean. You'll need the `docker-machine` binary and some credentials. Unless you live in Australia you'll also want to change the target region.

Once deployed, you can use docker compose to bring up the instance

```
# Load credentials
./machine-aws.sh
eval $(docker-machine env factorio)
docker-compose up -d
```

### How do I connect?

The server will emit its IP in the logs (`docker-compose logs`). You can also `docker-machine ip factorio`. The game always runs on port 34197.

### Are saves persisted?

Only to the local filesystem. If you want to shut down the server, you'll need to sync the files off of it, using scp or some other means.

### Can I load an old save?

If you specify a public URL `SAVE_FILE_URL` when starting the container, then that save will be copied to the server and run.
