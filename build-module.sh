export DOCKERHUB_USERNAME=$(cat $(REPO_ROOT)/.dockerhub_username)
export DOCKERHUB_TOKEN=$(cat $(REPO_ROOT)/.dockerhub_password)
export ARCHITECTURE=$(docker version --format '{{.Server.Arch}}')

make $1 -B -s