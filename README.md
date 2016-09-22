# Rancher-Vault

This container is an extension of the office [Vault](https://hub.docker.com/r/_/vault/) docker image that 
adds support for dynamically discoverying the Vault containers cluster IP address at runtime.
This IP address is then automatically set onto the VAULT_CLUSTER_ADDR environment variable to facilitate 
server request forwarding in Vault 0.6.1+.

This container does nothing more than configure the IP address. In Vault 0.6.1, you will still need to provide
the necessary configuration to enable clustering (i.e. `disable_clustering = "false"`) in your backend.

## Configuration

This container simply provided an additional script (`startup.sh`) as the entrypoint for the container.
The script queries the Rancher meta-data API to obtain the cluster IP address for the container.
The `VAULT_CLUSTER_ADDR` environment variable is then set to a default value of `https://${IP}:8201`.
Both the protocol and port can be overridden by supplying `VAULT_CLUSTER_ADDR_PROTO` and `VAULT_CLUSTER_ADDR_PORT`
environment variables respectively.
