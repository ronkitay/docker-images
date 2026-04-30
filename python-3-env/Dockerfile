ARG RELEASE
ARG DOCKER_REPO
ARG ARCHITECTURE
FROM ${DOCKER_REPO}/basic-env:${RELEASE}-${ARCHITECTURE}

# Install Python 3.x and Pip
RUN apt -y update && apt install -y python3.13 python3-pip python3-virtualenv pipenv python3-poetry
