FROM centos:7
LABEL jdk_version="8u361" maintainer="sunshanpeng"

ENV LC_ALL en_US.utf8
ENV JAVA_HOME /opt/jdk/jdk1.8.0_361

COPY jdk /opt/jdk
RUN cd /opt/jdk && tar -zxvf /opt/jdk/jdk-8u361-linux-x64.tar.gz \
        && ln -s /opt/jdk/jdk1.8.0_361/bin/java /usr/bin/java \
        && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo "Asia/Shanghai" > /etc/timezone \
        && yum install -y telnet net-tools bind-utils less vim pidof tcping \
        && yum clean all -y \
        && rm -rf /var/cache/yum/* 