ARG RELEASE
ARG DOCKER_REPO
FROM ${DOCKER_REPO}/basic-env:${RELEASE}

# Install Python 3.x and Pip
RUN apt -y update && apt install -y python3.11 pip python3-virtualenv pipenv
