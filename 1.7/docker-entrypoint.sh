#!/bin/bash
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
	set -- haproxy "$@"
fi

if [ "$1" = 'haproxy' ]; then
        HAPROXY_PATH=/usr/local/etc/haproxy
        cd $HAPROXY_PATH

        #trap "echo stop && exit 0" SIGHUP SIGTERM SIGINT
        trap 'echo $(date +"%F %T") - stop haproxy daemon. && exit 0' SIGHUP SIGINT SIGTERM

        echo $(date +"%F %T") - startup haproxy daemon ...
        haproxy -f $HAPROXY_PATH/haproxy.cfg -D -p /run/haproxy.pid

        while true; do
	        echo $(date +"%F %T") - set watches for configure files ...
                inotifywait -r -e modify,create,delete . 
	        echo $(date +"%F %T") - restart haproxy daemon ...
                haproxy -f $HAPROXY_PATH/haproxy.cfg -D -p /run/haproxy.pid -sf $(cat /run/haproxy.pid)
	        echo $(date +"%F %T") - sleep 5 seconds ...
	        sleep 5
        done
else
	exec -- "$@"
fi
