resource "digitalocean_domain" "limo" {
  name = "eth.limo"
}

resource "digitalocean_domain" "show" {
  name = "eth.show"
}

resource "digitalocean_domain" "frl" {
  name = "eth.frl"
}

resource "digitalocean_record" "default" {
  domain = digitalocean_domain.limo.name
  type   = "A"
  name   = "@"
  value  = var.limo-lb
  ttl    = 300
}

resource "digitalocean_record" "wildcard" {
  domain = digitalocean_domain.limo.name
  type   = "A"
  name   = "*"
  value  = var.limo-lb
  ttl    = 300
}

resource "digitalocean_record" "wildcard-show" {
  domain = digitalocean_domain.show.name
  type   = "A"
  name   = "*"
  value  = var.limo-lb
  ttl    = 300
}

resource "digitalocean_record" "wildcard-frl" {
  domain = digitalocean_domain.frl.name
  type   = "A"
  name   = "*"
  value  = var.limo-lb
  ttl    = 300
}

resource "digitalocean_record" "spf" {
  domain = digitalocean_domain.limo.name
  type   = "TXT"
  name   = "@"
  value  = "v=spf1 -all"
  ttl    = 300
}

resource "digitalocean_record" "dmarc" {
  domain = digitalocean_domain.limo.name
  type   = "TXT"
  name   = "_dmarc"
  value  = "v=DMARC1;p=reject;sp=reject;adkim=s;aspf=s;fo=1;rua=mailto:ethdotlimo+rua@protonmail.com,mailto:ethdotlimo+dmarc@protonmail.com"
  ttl    = 300
}

resource "digitalocean_record" "dkim" {
  domain = digitalocean_domain.limo.name
  type   = "TXT"
  name   = "*._domainkey"
  value  = "v=DKIM1; p="
  ttl    = 300
}