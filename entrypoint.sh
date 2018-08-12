#!/bin/bash

# Lets go for takeoff
ulimit -m unlimited
ulimit -v unlimited
ulimit -n 65536

# -E Log to stderr,
# -DD do not daemonize creator,
# -m Size of shared memory allocated in Megabytes
# -M Size of private memory allocated, in Megabytes,
# exec kamailio -DD -E -m 512 -M 64
exec /usr/local/src/pivx/bin/pivxd
