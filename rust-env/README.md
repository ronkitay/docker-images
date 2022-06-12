# go-env

A Docker image for Golang development.

## Building

```bash
./build.sh
```

## Running

```bash
docker run \
    --env WORKSPACE_NAME=<Workspace Name> \
    -v <path-of-source-on-local>:<path-of-source-on-container>
    -t -i --rm go-env:3.0.0
```
