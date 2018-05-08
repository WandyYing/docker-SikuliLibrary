FROM openjdk:jre-alpine 

MAINTAINER Ying Jun (https://github.com/WandyYing/docker-SikuliLibrary) 

ARG JYTHON_VERSION=2.7.1
ARG JYTHON_HOME=/opt/jython-$JYTHON_VERSION 

LABEL Description="Jython $JYTHON_VERSION on Alpine + OpenJDK, minimal container"

RUN set -euxo pipefail && \
    apk add --no-cache bash
RUN set -euxo pipefail && \
    apk add --no-cache wget && \
    wget -cO jython-installer.jar "http://search.maven.org/remotecontent?filepath=org/python/jython-installer/$JYTHON_VERSION/jython-installer-$JYTHON_VERSION.jar" && \
    java -jar jython-installer.jar -s -t standard -d "$JYTHON_HOME" && \
    rm -fr "$JYTHON_HOME"/{Docs,Demo,tests} && \
    rm -f jython-installer.jar && \
    ln -sfv "$JYTHON_HOME/bin/"* /usr/local/bin/ && \
    apk del wget

#CMD ["jython"] 
ENTRYPOINT ["jython"]