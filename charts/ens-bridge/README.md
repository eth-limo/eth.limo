## Helm chart installation

### Install `cert-manager` CRDs
```
./install-prerequisites.sh
```
---
### Generate the cluster secrets
```
# Retrieve ipfs-key tool
go get github.com/whyrusleeping/ipfs-key

# Generate id and private key
ipfs-key -type ed25519 | base64 -w 0

# Copy the key id and replace "${PRIVATE_KEY_ID}" in secret.yml

# Copy the string above (below the ID) and paste the contents into ${PRIVATE_KEY}
echo -n "${PRIVATE_KEY}" | base64 -w 0 -

# create ${CLUSTER_SECRET}
od  -vN 32 -An -tx1 /dev/urandom | tr -d ' \n' | base64 -w 0 -
```

`secret.yml`: NOTE - you must create the namespace before creating the secret!
```
apiVersion: v1
kind: Secret
metadata:
  name: secret-config
  namespace: ens-bridge
type: Opaque
data:
  cluster-secret: "${CLUSTER_SECRET}"
  bootstrap-peer-priv-key: "${PRIVATE_KEY}"
---
apiVersion: v1
kind: ConfigMap
metadata:
  name: env-config
  namespace: ens-bridge
data:
  bootstrap-peer-id: "${PRIVATE_KEY_ID}"
```