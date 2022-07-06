ARG RELEASE
ARG DOCKER_REPO
FROM ${DOCKER_REPO}/basic-env:${RELEASE}

RUN sh -c "$(curl -fsSL https://deb.nodesource.com/setup_16.x)"
RUN apt install -y nodejs
