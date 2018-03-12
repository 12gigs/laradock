FROM dockercloud/haproxy:latest

MAINTAINER ZeroC0D3 Team<zeroc0d3.team@gmail.com>

RUN mkdir -p /etc/ssl
ADD ssl/dev.pem /etc/ssl/domain.pem
RUN chmod 0600 /etc/ssl/domain.pem && \
    chown haproxy.haproxy /etc/ssl/domain.pem

EXPOSE 80 443
