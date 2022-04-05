# docker-k8s-cli

A Docker image with the K8S and Helm CLIs on Alpine - Can be used as a base image for connecting to custom cloud K8S environments (EKS/GKE/AKS) or for connecting to a ad-hoc K8S clusters

## Building

```bash
./build.sh
```

## Running

```bash
docker run \
    -v ${HOME}/.my-docker-envs/<WORKSPACE_NAME>/.kube:/root/.kube \
    --env WORKSPACE_NAME=<Workspace Name> \
    -t -i --rm docker-k8s-cli:1.0.2
```
