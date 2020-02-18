# HAProxy
HAProxy 2.1 with inotify tools support.

# Supported tags and respective Dockerfile links
- [1.7](https://github.com/SmartNMS/docker-haproxy/tree/master/1.7)
- [2.0](https://github.com/SmartNMS/docker-haproxy/tree/master/2.0)
- [2.1](https://github.com/SmartNMS/docker-haproxy/tree/master/2.1)

# Quick start for haproxy

## Check haproxy configuration
```bash
docker run -it --rm --name haproxy-syntax-check smartnms/haproxy:2.1 -c -f /usr/local/etc/haproxy/haproxy.cfg
```

## 1. Create docker compose file
docker-compose.yml
```yml
```

## 2. Check haproxy configuration
```bash
docker-compose run --rm haproxy -c -f /usr/local/etc/haproxy/haproxy.cfg
```

## Dockfile
```txt
#
# docker build -t smartnms/haproxy:2.1 .
#
FROM haproxy:2.1

LABEL maintainer="wingsun97@qq.com"

RUN apt-get update && apt-get install -y inotify-tools \
    && apt-get clean \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/* \
      /tmp/* \
      /var/tmp/*

COPY docker-entrypoint.sh /
```
