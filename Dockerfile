#FROM haproxy:1.7
#COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg

FROM centos:7

MAINTAINER Kilsoo Kang <kilsoo75@gmail.com>

RUN yum clean all && \
    yum -y install epel-release && \
    yum -y haproxy && \
    mv /etc/haproxy/haproxy.conf /etc/haproxy/haproxy.conf.org

COPY haproxy.cfg /etc/haproxy/haproxy.cfg

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "haproxy", "-f", "/etc/haproxy/haproxy.cfg" ]

    

