FROM centos:7

MAINTAINER Kilsoo Kang <kilsoo75@gmail.com>

ENV MASTER_DEFAULT_PASSWORD redis1234
ENV MASTER_DEFAULT_NAME redis-master
ENV SLAVE_DEFAULT_NAME redis-slave

RUN yum clean all && \
    yum -y install epel-release && \
    yum -y install haproxy && \
    mv /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.org

COPY haproxy.cfg /etc/haproxy/haproxy.cfg

COPY docker-entrypoint.sh /usr/local/bin/

EXPOSE 7777

ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "haproxy", "-f", "/etc/haproxy/haproxy.cfg" ]
