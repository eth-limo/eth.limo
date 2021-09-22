resource "digitalocean_spaces_bucket" "certificates" {
  name   = "eth-limo-certificates"
  region = "nyc3"
  acl    = "private"

  versioning {
    enabled = true
  }
}