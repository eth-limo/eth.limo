# Cost: $20.00/month
/*
resource "digitalocean_kubernetes_cluster" "limo" {
  name          = "eth_limo"
  region        = "nyc1"
  version       = "1.21.2-do.2"
  vpc_uuid      = digitalocean_vpc.limo.id
  auto_upgrade  = true
  surge_upgrade = true

  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }

  # Cost: $30.00/month
  node_pool {
    name       = "system"
    size       = "s-1vcpu-2gb"
    node_count = 2

    tags = ["default", "system", "limo"]

    labels = {
      service  = "default"
      priority = "high"
    }
  }
}

# Cost: $30.00/month
resource "digitalocean_kubernetes_node_pool" "caddy" {
  cluster_id = digitalocean_kubernetes_cluster.limo.id

  name       = "caddy"
  size       = "s-1vcpu-2gb"
  node_count = 2
  tags       = ["caddy", "proxy", "limo"]

  labels = {
    service  = "caddy"
    priority = "high"
  }
}

# Cost: $144.00/month
resource "digitalocean_kubernetes_node_pool" "ipfs" {
  cluster_id = digitalocean_kubernetes_cluster.limo.id

  name       = "ipfs"
  size       = "s-4vcpu-8gb"
  node_count = 3
  tags       = ["ipfs", "limo"]

  labels = {
    service  = "ipfs"
    priority = "high"
  }
}

# Cost: $20.00/month
resource "digitalocean_kubernetes_node_pool" "coredns" {
  cluster_id = digitalocean_kubernetes_cluster.limo.id

  name       = "coredns"
  size       = "s-1vcpu-2gb"
  node_count = 2
  tags       = ["coredns", "dns", "limo"]

  labels = {
    service  = "coredns"
    priority = "high"
  }
}

/*
# Cost: $192.00/month
resource "digitalocean_kubernetes_node_pool" "geth" {
  cluster_id = digitalocean_kubernetes_cluster.limo.id

  name       = "geth"
  size       = "s-8vcpu-16gb"
  node_count = 2
  tags       = ["geth", "ethereum", "limo"]

  labels = {
    service  = "geth"
    priority = "high"
  }
}
*/