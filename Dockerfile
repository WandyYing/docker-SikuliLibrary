FROM openjdk:jre-alpine 

MAINTAINER Ying <wandy1208@gmail.com>

ENV ROOT_PASSWORD root

RUN apk add --update --no-cache \
    python \
    python-dev \
    py-pip \
    wget \
    curl \
    unzip 

##Robot env
RUN pip install -U \
    pip \
    robotframework==3.0.2 \
    robotframework-SikuliLibrary \
    python --version



#ssh-server
RUN apk --update add openssh \
        && sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config \
        && echo "root:${ROOT_PASSWORD}" | chpasswd \
        && rm -rf /var/cache/apk/* /tmp/*

COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

# RUN java -jar /usr/local/lib/python2.7/dist-packages/SikuliLibrary/bin/SikuliLibrary.jar 18181
RUN chmod +x /usr/lib/python2.7/site-packages/SikuliLibrary/lib/SikuliLibrary.jar
RUN java -jar /usr/lib/python2.7/site-packages/SikuliLibrary/lib/SikuliLibrary.jar 18181 &


EXPOSE 22
EXPOSE 18181

ENTRYPOINT ["entrypoint.sh"]