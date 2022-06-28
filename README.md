# Cloud Control plane and tenant mockup example

## Layers
* Control plane:
    - Runs nomad scheduler servers
    - Runs Consul servers for service discovery, health checks and connectivity
    - Runs Vault for secure bootstrapping and identity management of infrastructure
* Infrastructure workers:
    - Runs nomad agents connected to control plane
    - Runs virtual machines that make up the application workers environment
* Hosted Control Plane workers:
    - Runs virtual machines and containers that make up the control plane services for application workers
    - Control plane services include, nomad, consul, vault, prometheus, elk, boundary server, boundary workers
* Application Workers:
    - Runs application workloads on base os or containers
    - Consul connects hosted control plane environment for connectivity and service discovery / mesh, key value, locking, health checks.
    - nomad connects hosted control plane environment for workload scheduling and lifecycle.
    - vault connects hosted control plane for bootstrap secrets to connect to control plane and configure worker, also credential setup for services such as database access, encryption as a service, certificates, key value, consul and nomad tokens.
* Workloads:
    - containers, binaries, or other workloads running on application workers.

## Bootstrapping process in Demo
1. Stop any nomad, consul, or vault processes running to refresh lab
2. Generating loopback addresses to represent servers in a multi AZ deployment
3. Clean up the data directory so the process can recreate all configs and deployment each time
4. Generate working directories for each instance of nomad, consul, and vault by region, Availability zone, layer, host type, function, and instance number value.
5. Start first vault server instance for control plane, initialize it, and unseal it.
6. Start second and third vault server instances for control plane, unseal them, and validate the servers have joined the cluster
7. Create policy with permissions to allow consul cluster to automatically generate the consul connect ca pki engine configuration in vault
8. Generate a token for vault with the consul connect ca policy
9. Template the consul configuration with the vault token for consul connect ca configuration.When the consul server initializes it will perform all steps needed to create a PKI engine with all requirements for consul connect.
### Not done yet
10. Generate vault CA certificate for consul client authentication
11. configure JWT engine for auto configuration with consul servers
12. Start consul servers with ca certificate and gossip key value set
13. Generate vault agent configurations with token with policy for jwt generation, let run and template consul client configuration, then start consul client
14. Generate Nomad server configuration with consul stanza pointed to consul client agents
15. ensure nomad cluster has configured itself
16. Bootstrap nomad acl

