#!/bin/sh

docker run \
    -v /Users/ronk/.aws/:/root/.aws \
    -v /Users/ronk/.my-docker-envs/eks-dev/.kube:/root/.kube \
    --env AWS_PROFILE=rnd \
    --env AWS_REGION=eu-west-1 \
    --env EKS_CLUSTER=EKSClusterDev \
    -t -i --rm $(basename $(pwd)):v1 sh -l
