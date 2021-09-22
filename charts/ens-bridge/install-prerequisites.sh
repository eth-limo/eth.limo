#!/bin/bash

set -ex

if [[ $(kubectl get namespaces | grep -c ens-bridge) -eq 0 ]]; then
    # Create the namespace
    kubectl create namespace ens-bridge
fi