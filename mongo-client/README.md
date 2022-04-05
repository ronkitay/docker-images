# mongo-client

## Building

```bash
./build.sh
```

## Running

```bash
docker run \
    --env MONGO_HOSTNAME="<HOSTNAME>" \
    --env MONGO_DB="<DB>" \
    --env MONGO_USERNAME="<USERNAME>" \
    --env MONGO_PASSWORD="<PASSWORD>" \
    -t -i --rm mongo-client:1.0.0
```
