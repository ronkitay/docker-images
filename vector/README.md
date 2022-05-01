# mongo-client

## Building

```bash
./build.sh
```

## Running

```bash
docker run \
    -v ${HOME}/.aws/:/root/.aws \
    --env WORKSPACE_NAME=<Workspace Name> \
    --env AWS_PROFILE=<AWS_PROFILE> \
    --env AWS_REGION=<AWS_REGION> \
    -t -i --rm vector:1.0.0
```
