#!/bin/sh
cd /pandar

ulimit -n 4096
python /pandar/server.py -c /pandar.json >/dev/null 2>&1

/pandar/sunny clientid 956d9f95143f3421
