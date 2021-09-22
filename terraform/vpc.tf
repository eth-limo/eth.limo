resource "digitalocean_vpc" "limo" {
  name     = "eth-limo"
  region   = "nyc1"
  ip_range = "172.16.0.0/16"
}