data "cloudflare_zones" "domain" {
  filter {
    name = var.domain
  }
}

resource "cloudflare_record" "site_cname" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  name    = "my"
  value   = aws_s3_bucket.my.website_endpoint
  type    = "CNAME"

  ttl     = 1
  proxied = true
}

resource "cloudflare_page_rule" "https" {
  zone_id = data.cloudflare_zones.domain.zones[0].id
  target  = "*.${var.domain}/*"
  actions {
    always_use_https = true
  }
}

# resource "cloudflare_record" "site_cname" {
#   zone_id = data.cloudflare_zones.domain.zones[0].id
#   name    = var.domain
#   value   = aws_s3_bucket.site.website_endpoint
#   type    = "CNAME"

#   ttl     = 1
#   proxied = true
# }

# resource "cloudflare_record" "www" {
#   zone_id = data.cloudflare_zones.domain.zones[0].id
#   name    = "www"
#   value   = var.domain
#   type    = "CNAME"

#   ttl     = 1
#   proxied = true
# }

