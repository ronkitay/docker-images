# docker-eks

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
    --env AWS_PROFILE=<AWS_PROFILE> \
    --env AWS_REGION=<AWS_REGION> \
    --env EKS_CLUSTER=<AWS_CLUSTER> \
    -t -i --rm docker-eks:2.0.0
```
