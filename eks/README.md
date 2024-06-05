# eks

A Docker image for maintaining multiple EKS (K8S on AWS) contexts.

## Building

```bash
./build.sh
```

## Running

```bash
docker run \
    -v ${HOME}/.aws/:/root/.aws \
    -v ${HOME}/.my-docker-envs/<WORKSPACE_NAME>/.kube:/root/.kube \
    --env WORKSPACE_NAME=<Workspace Name> \
    --env AWS_ACCESS_KEY_ID=<AWS_ACCESS_KEY_ID> \
    --env AWS_SECRET_ACCESS_KEY=<AWS_SECRET_ACCESS_KEY> \
    --env AWS_SESSION_TOKEN=<AWS_SESSION_TOKEN> \
    --env AWS_REGION=<AWS_REGION> \
    --env EKS_CLUSTER=<AWS_CLUSTER> \
    -t -i --rm docker-eks:2.0.0
```
