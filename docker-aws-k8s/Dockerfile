FROM alpine:3.15.2

ENV PROFILE_FILE=/root/.profile

# Install cUrl
RUN apk --no-cache add curl

# Install kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN su -l root; su -; install -o root -g root -m 0755 /kubectl /usr/local/bin/kubectl
RUN rm /kubectl

# Install AWS CLI
RUN apk add --no-cache aws-cli

ADD .profile ${PROFILE_FILE}
RUN chmod +x ${PROFILE_FILE}
