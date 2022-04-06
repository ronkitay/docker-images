# A Docker image for using jsqsh (https://github.com/scgray/jsqsh)

FROM basic-env:2.0.0

RUN apk add openjdk11-jre

RUN curl "$(curl -v https://github.com/scgray/jsqsh/releases/download/jsqsh-2.3/jsqsh-2.3-bin.tar.gz 2>&1 | grep -o 'location:.*' | awk '{print $2}')" -o /jsqsh-2.3-bin.tar.gz
RUN gunzip /jsqsh-2.3-bin.tar.gz && tar xvf /jsqsh-2.3-bin.tar && rm /jsqsh-2.3-bin.tar && mv /jsqsh-dist-2.3 /jsqsh

RUN mkdir /root/.jsqsh && touch /root/.jsqsh/.welcome
COPY drivers.xml /root/.jsqsh/drivers.xml
RUN curl https://repo1.maven.org/maven2/org/apache/calcite/avatica/avatica/1.20.0/avatica-1.20.0.jar -o /jsqsh/share/jsqsh/avatica.jar
RUN curl https://repo1.maven.org/maven2/org/postgresql/postgresql/42.3.3/postgresql-42.3.3.jar -o /jsqsh/share/jsqsh/postgresql.jar

RUN echo 'PATH=${PATH}:/jsqsh/bin' >> ${ZSHRC_FILE}