FROM centos:7
LABEL jdk_version="8u261" maintainer="sunshanpeng"
ENV LC_ALL en_US.utf8
COPY rpm /opt/rpm
RUN cd /opt/rpm \
        && yum localinstall -y jdk-8u261-linux-x64.rpm \
        && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
        && echo "Asia/Shanghai" > /etc/timezone \
        && yum install -y telnet net-tools bind-utils less vim pidof \
 		&& yum clean all -y \
        && rm -rf /var/cache/yum/* \
        && rm -rf /rpm/*