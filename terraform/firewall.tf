/*
resource "digitalocean_firewall" "limo_vpc" {
  name = "eth.limo-vpc"

  tags = ["limo", "firewall"]

  inbound_rule {
    port_range       = "1-65535"
    protocol         = "tcp"
    source_addresses      = [digitalocean_vpc.limo.ip_range]
  }

  inbound_rule {
    port_range       = "1-65535"
    protocol         = "udp"
    source_addresses      = [digitalocean_vpc.vpc.ip_range]
  }

  inbound_rule {
    protocol         = "icmp"
    source_addresses      = [digitalocean_vpc.vpc.ip_range]
  }
}
*/