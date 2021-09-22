#!/bin/sh

set -x

whoami

ls -altR /data

chown -R 10004:10004 /data/ipfs-cluster

ls -altR /data

if [ ! -f /data/ipfs-cluster/service.json ]; then
    ipfs-cluster-service init
    chown -R 10004:10004 /data/ipfs-cluster
    ls -altR /data
fi

