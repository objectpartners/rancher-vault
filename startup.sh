#!/bin/dumb-init /bin/sh
set -e

set -- docker-entrypoint.sh "$@"
VAULT_CLUSTER_ADDR=$(wget -q -O - 169.254.169.250/latest/self/container/primary_ip)
exec env VAULT_CLUSTER_ADDR=${VAULT_CLUSTER_ADDR_PROTO:-https}://$VAULT_CLUSTER_ADDR:${VAULT_CLUSTER_ADDR_PORT:-8201} "$@"
