# go-env

A Docker image for duckdb usage.

## Building

```bash
./build.sh
```

## Running

```bash
docker run \
    --env WORKSPACE_NAME=<Workspace Name> \
    -v <path-of-source-on-local>:<path-of-source-on-container>
    -t -i --rm duckdb:3.0.0
```
