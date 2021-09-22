#! /bin/sh

set -x

whoami

ls -alt /data

if [ ! -f /data/ipfs/initial-config.lock ]; then
    rm -rf /data/ipfs/*
    mkdir -p /data/ipfs 
    ipfs init --profile=badgerds,server
    touch /data/ipfs/initial-config.lock
    chown -R 10003:10003 /data/ipfs
    chown -R 10004:10004 /data/ipfs-cluster
fi

# Configure DNS for use with CoreDNS/ENS
ipfs config --json DNS.Resolvers '{"eth.": "https://{{.Values.coredns.name}}.{{ .Values.namespace }}.svc.cluster.local/dns-query"}'

# IPFS gateway configuration - eth.limo is probably superfluous
ipfs config --json Gateway '{ "PublicGateways": { "*.eth.limo": { "UseSubdomains": true}, "*.eth": { "UseSubdomains": true}}}'

# General configuration
ipfs config Addresses.API /ip4/0.0.0.0/tcp/5001
ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8080
ipfs config Addresses.Swarm --json '["/ip4/0.0.0.0/tcp/4001", "/ip4/0.0.0.0/udp/4001/quic"]'
ipfs config --json Swarm.ConnMgr.HighWater 2000
ipfs config --json Datastore.BloomFilterSize 1048576
ipfs config Datastore.StorageMax 100GB

# Make sure ipfs is always the owner of the mounted volumes
chown -R 10003:10003 /data/ipfs
chown -R 10004:10004 /data/ipfs-cluster

ls -altR /data