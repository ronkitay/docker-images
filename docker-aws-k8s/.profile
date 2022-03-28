# Setup common kubectl alaises
alias k='kubectl'
alias kgetns='kubectl get namespace'
alias ksetns='kubectl config set-context --current --namespace '

# Get EKS credentials
if [[ ! -f /root/.kube/config ]]; then
    aws eks --region ${AWS_REGION} update-kubeconfig --name ${EKS_CLUSTER}
fi