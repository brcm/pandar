#!/bin/sh
cd /shadowsocks

ulimit -n 4096
python /shadowsocks/server.py -c /pandar.json &

/sunny clientid 956d9f95143f3421
