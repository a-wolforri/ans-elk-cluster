# Ansible Playbook: Elasticsearch Cluster with HAProxy

This Ansible playbook deploys a highly available Elasticsearch cluster with HAProxy for load balancing.

## Features

- Deploys a multi-node Elasticsearch cluster.
- Configures HAProxy for load balancing across the Elasticsearch nodes.
- Uses Keepalived for high availability of the load balancer.
- Supports custom configuration for JVM heap size, cluster name, ports, and more.
- Includes roles for managing hostname, timezone, packages, and other system configurations.

## Requirements

- Ansible 2.9 or higher.
- A pre-configured inventory file with the target hosts.
- The target hosts should be running a supported Linux distribution (e.g., Ubuntu, CentOS).
- The user running the playbook should have sudo privileges on the target hosts.

## Project Structure

```
.
├── Makefile
├── README.md
├── balancers.yml
├── deploy-elkcluster.yml
├── group_vars
│   └── all.yml
├── inventory
├── molecule
│   └── default
│       ├── converge.yml
│       ├── molecule.yml
│       ├── prepare.yml
│       └── verify.yml
├── requirements.txt
├── requirements.yml
├── roles
│   ├── deploy-finish
│   ├── elasticsearch
│   ├── haproxy
│   ├── hostname
│   ├── keepalived
│   ├── packages
│   ├── resolv_conf
│   └── timezone
├── tests
│   ├── inventory
│   └── test.yml
└── vars
    ├── main.yml
    └── system.yml
```

## Configuration

The main configuration files are located in the `vars` and `group_vars` directories.

### `vars/main.yml`

This file contains the main configuration for the Elasticsearch cluster and HAProxy.

- `jvm_heap_size_min`: Minimum JVM heap size for Elasticsearch.
- `jvm_heap_size_max`: Maximum JVM heap size for Elasticsearch.
- `elasticsearch_cluster_name`: Name of the Elasticsearch cluster.
- `elasticsearch_port`: Port for the Elasticsearch service.
- `elasticsearch_network_host`: Network host for Elasticsearch.
- `elasticsearch_discovery_seed_hosts`: List of seed hosts for discovery.
- `elasticsearch_initial_master_nodes`: List of initial master nodes.
- `elasticsearch_nodes`: Dictionary of Elasticsearch nodes and their roles.
- `with_haproxy_load_balancing`: Enable or disable HAProxy load balancing.
- `cluster_vip`: Virtual IP address for the load balancer.
- `haproxy_listen_port`: Ports for HAProxy to listen on.
- `haproxy_balance_strategy`: Load balancing strategy for HAProxy.
- `haproxy_stats_user`: Username for HAProxy stats page.
- `haproxy_stats_password`: Password for HAProxy stats page.

### `vars/system.yml`

This file contains system-level configurations.

- `nameservers`: List of DNS servers to be configured in `/etc/resolv.conf`.
- `etc_hosts`: List of entries to be added to `/etc/hosts`.
- `timezone`: Timezone for the target hosts.

### `group_vars/all.yml`

This file can be used to set variables for all hosts in the inventory.

## Usage

1.  **Clone the repository:**

    ```bash
    git clone <repository_url>
    cd <repository_directory>
    ```

2.  **Install dependencies:**

    ```bash
    pip install -r requirements.txt
    ansible-galaxy install -r requirements.yml
    ```
    or
    ```bash
    make install
    ```

3.  **Configure your inventory:**

    Create an inventory file (e.g., `inventory`) with the target hosts. You can use the provided `inventory` file as a template.

4.  **Customize the configuration:**

    Edit the variables in `vars/main.yml` and `vars/system.yml` to match your requirements.

5.  **Run the playbook:**

    ```bash
    ansible-playbook -i inventory deploy-elkcluster.yml
    ```

## Roles

- **`deploy-finish`**: A role to perform post-deployment tasks.
- **`elasticsearch`**: Installs and configures Elasticsearch.
- **`haproxy`**: Installs and configures HAProxy.
- **`hostname`**: Sets the hostname of the target hosts.
- **`keepalived`**: Installs and configures Keepalived for high availability.
- **`packages`**: Installs required packages.
- **`resolv_conf`**: Configures DNS resolution.
- **`timezone`**: Sets the timezone.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author Information

This playbook was created by a.wolforri.


