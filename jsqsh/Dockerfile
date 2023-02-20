# A Docker image for using jsqsh (https://github.com/scgray/jsqsh)
ARG RELEASE
ARG DOCKER_REPO
FROM ${DOCKER_REPO}/basic-env:${RELEASE}

# Install Java 17 (JRE) (https://www.oracle.com/java/technologies/downloads/)
RUN apt install -y openjdk-17-jre/stable 

# Install JSQSH (https://github.com/scgray/jsqsh)
RUN curl -L https://github.com/scgray/jsqsh/releases/download/jsqsh-2.3/jsqsh-2.3-bin.tar.gz -o /jsqsh-bin.tar.gz
RUN gunzip /jsqsh-bin.tar.gz && tar xvf /jsqsh-bin.tar && rm /jsqsh-bin.tar && mv /jsqsh-dist-* /jsqsh
RUN echo 'PATH=${PATH}:/jsqsh/bin' >> ${ZSHRC_FILE}

# Configure Drivers 
RUN mkdir /root/.jsqsh && touch /root/.jsqsh/.welcome
COPY drivers.xml /root/.jsqsh/drivers.xml
RUN curl https://repo1.maven.org/maven2/org/apache/calcite/avatica/avatica/1.22.0/avatica-1.22.0.jar -o /jsqsh/share/jsqsh/avatica.jar 
RUN curl https://repo1.maven.org/maven2/org/postgresql/postgresql/42.5.1/postgresql-42.5.1.jar -o /jsqsh/share/jsqsh/postgresql.jar
