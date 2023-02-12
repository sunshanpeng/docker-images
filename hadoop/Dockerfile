FROM sunshanpeng/jdk:8u361
LABEL hadoop_version="3.2.4" maintainer="sunshanpeng"

ENV HADOOP_HOME="/opt/hadoop"
ENV HADOOP_CONF_DIR="$HADOOP_HOME/etc/hadoop"
ENV HADOOP_LOG_DIR="/var/log/hadoop"
ENV PATH="$HADOOP_HOME/hadoop/sbin:$HADOOP_HOME/bin:$PATH"

WORKDIR /opt

# 配置SSH登录
RUN yum update -y && yum install -y openssh-server && yum -y install openssh-clients
RUN ssh-keygen -t rsa -f /root/.ssh/id_rsa -P '' && \
    cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys \
    && ssh-keygen -q -t rsa -b 2048 -f /etc/ssh/ssh_host_rsa_key -N '' \
    && ssh-keygen -q -t ecdsa -f /etc/ssh/ssh_host_ecdsa_key -N '' \
    && ssh-keygen -t dsa -f /etc/ssh/ssh_host_ed25519_key  -N '' \
    && sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config \
    && /usr/sbin/sshd

# 下载Hadoop安装包
COPY file /opt
RUN cd /opt && tar -xzvf hadoop-3.2.4.tar.gz && \
    mv hadoop-3.2.4 hadoop && \
    rm -rf hadoop-3.2.4.tar.gz && \
    mkdir /var/log/hadoop

# hdfs存储目录
RUN mkdir -p /root/hdfs/namenode && \ 
    mkdir -p /root/hdfs/datanode 

# 配置文件
COPY config/* /tmp/
RUN mv /tmp/ssh_config /root/.ssh/config && \
    mv /tmp/hadoop-env.sh $HADOOP_CONF_DIR/hadoop-env.sh && \
    mv /tmp/hdfs-site.xml $HADOOP_CONF_DIR/hdfs-site.xml && \ 
    mv /tmp/core-site.xml $HADOOP_CONF_DIR/core-site.xml && \
    mv /tmp/mapred-site.xml $HADOOP_CONF_DIR/mapred-site.xml && \
    mv /tmp/yarn-site.xml $HADOOP_CONF_DIR/yarn-site.xml && \
    mv /tmp/workers $HADOOP_CONF_DIR/workers

# 初始化
RUN hdfs namenode -format

COPY scripts/* /opt/scripts/
RUN chmod +x /opt/scripts/start-hadoop.sh \
    && chmod +x /opt/scripts/start-hdfs.sh \
    && chmod +x /opt/scripts/start-yarn.sh 

CMD ["sleep", "infinity"]