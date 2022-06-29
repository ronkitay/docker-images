# A Docker image for using jsqsh (https://github.com/scgray/jsqsh)
ARG RELEASE
ARG DOCKER_REPO
FROM ${DOCKER_REPO}/basic-env:${RELEASE}

# Install Java 11 (JRE)
RUN apt install -y openjdk-11-jre/stable

# Install JSQSH
RUN curl -L https://github.com/scgray/jsqsh/releases/download/jsqsh-2.3/jsqsh-2.3-bin.tar.gz -o /jsqsh-2.3-bin.tar.gz
RUN gunzip /jsqsh-2.3-bin.tar.gz && tar xvf /jsqsh-2.3-bin.tar && rm /jsqsh-2.3-bin.tar && mv /jsqsh-dist-2.3 /jsqsh
RUN echo 'PATH=${PATH}:/jsqsh/bin' >> ${ZSHRC_FILE}

# Configure Drivers 
RUN mkdir /root/.jsqsh && touch /root/.jsqsh/.welcome
COPY drivers.xml /root/.jsqsh/drivers.xml
RUN curl https://repo1.maven.org/maven2/org/apache/calcite/avatica/avatica/1.20.0/avatica-1.20.0.jar -o /jsqsh/share/jsqsh/avatica.jar 
RUN curl https://repo1.maven.org/maven2/org/postgresql/postgresql/42.3.3/postgresql-42.3.3.jar -o /jsqsh/share/jsqsh/postgresql.jar
