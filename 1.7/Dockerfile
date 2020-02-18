#
# docker build -t smartnms/haproxy:1.7 .
#
FROM haproxy:1.7

LABEL maintainer="wingsun97@qq.com"

RUN apt-get update && apt-get install -y inotify-tools \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
      /tmp/* \
      /var/tmp/*

COPY docker-entrypoint.sh /
#ENTRYPOINT ["/docker-entrypoint.sh"]
#CMD ["haproxy", "-f", "/usr/local/etc/haproxy/haproxy.cfg"]
