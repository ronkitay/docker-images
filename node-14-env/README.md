# node-14-env

A Docker image for Node.JS v14  development.

## Building

```bash
./build.sh
```

## Running

```bash
docker run \
    --env WORKSPACE_NAME=<Workspace Name> \
    -v <path-of-source-on-local>:<path-of-source-on-container>
    -t -i --rm node-14-env:3.0.0
```
