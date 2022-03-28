# docker-aws-k8s

A Docker image for maintaining multiple EKS (K8S on AWS) contexts.

## Building

```bash
./build.sh
```

## Running

```bash
docker run \
    -v ${HOME}/.aws/:/root/.aws \
    -v ${HOME}/.my-docker-envs/<ENV_NAME>/.kube:/root/.kube \
    --env AWS_PROFILE=<AWS_PROFILE> \
    --env AWS_REGION=<AWS_REGION> \
    --env EKS_CLUSTER=<AWS_CLUSTER> \
    -t -i --rm docker-aws-k8s:v1 sh -l
```
