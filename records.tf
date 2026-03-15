locals {
  toyra_se_records = {
    "toyra_se_mx_10" = {
      zone_id  = cloudflare_zone.toyra_se.id
      name     = "@"
      type     = "MX"
      value    = "mail.protonmail.ch"
      ttl      = 1
      proxied  = false
      priority = 10
    }
    "toyra_se_mx_20" = {
      zone_id  = cloudflare_zone.toyra_se.id
      name     = "@"
      type     = "MX"
      value    = "mailsec.protonmail.ch"
      ttl      = 1
      proxied  = false
      priority = 20
    }
    "toyra_se_spf" = {
      zone_id  = cloudflare_zone.toyra_se.id
      name     = "@"
      type     = "TXT"
      value    = "v=spf1 include:_spf.protonmail.ch mx ~all"
      ttl      = 1
      proxied  = false
      priority = null
    }
    # TODO: add verification TXT record (retrieve from Proton Mail → Settings → Domain)
    "toyra_se_dkim_1" = {
      zone_id  = cloudflare_zone.toyra_se.id
      name     = "protonmail._domainkey"
      type     = "CNAME"
      value    = "protonmail.domainkey.REPLACE_ME.protonmail.ch" # TODO: replace REPLACE_ME with account-specific value
      ttl      = 1
      proxied  = false
      priority = null
    }
    "toyra_se_dkim_2" = {
      zone_id  = cloudflare_zone.toyra_se.id
      name     = "protonmail2._domainkey"
      type     = "CNAME"
      value    = "protonmail2.domainkey.REPLACE_ME.protonmail.ch" # TODO: replace REPLACE_ME
      ttl      = 1
      proxied  = false
      priority = null
    }
    "toyra_se_dkim_3" = {
      zone_id  = cloudflare_zone.toyra_se.id
      name     = "protonmail3._domainkey"
      type     = "CNAME"
      value    = "protonmail3.domainkey.REPLACE_ME.protonmail.ch" # TODO: replace REPLACE_ME
      ttl      = 1
      proxied  = false
      priority = null
    }
    "toyra_se_dmarc" = {
      zone_id  = cloudflare_zone.toyra_se.id
      name     = "_dmarc"
      type     = "TXT"
      value    = "v=DMARC1; p=quarantine"
      ttl      = 1
      proxied  = false
      priority = null
    }
  }

  spange_se_records = {
    "spange_se_mx_10" = {
      zone_id  = cloudflare_zone.spange_se.id
      name     = "@"
      type     = "MX"
      value    = "mail.protonmail.ch"
      ttl      = 1
      proxied  = false
      priority = 10
    }
    "spange_se_mx_20" = {
      zone_id  = cloudflare_zone.spange_se.id
      name     = "@"
      type     = "MX"
      value    = "mailsec.protonmail.ch"
      ttl      = 1
      proxied  = false
      priority = 20
    }
    "spange_se_spf" = {
      zone_id  = cloudflare_zone.spange_se.id
      name     = "@"
      type     = "TXT"
      value    = "v=spf1 include:_spf.protonmail.ch ~all"
      ttl      = 1
      proxied  = false
      priority = null
    }
    "spange_se_verification" = {
      zone_id  = cloudflare_zone.spange_se.id
      name     = "@"
      type     = "TXT"
      value    = "protonmail-verification=7d291d668dc73a0070617df94aa88315be727fb6"
      ttl      = 1
      proxied  = false
      priority = null
    }
    "spange_se_dkim_1" = {
      zone_id  = cloudflare_zone.spange_se.id
      name     = "protonmail._domainkey"
      type     = "CNAME"
      value    = "protonmail.domainkey.dkfornyojwiwnbbplwwvvs6jylvuk2np3ha77hicirwqgoe2qy22a.domains.proton.ch."
      ttl      = 1
      proxied  = false
      priority = null
    }
    "spange_se_dkim_2" = {
      zone_id  = cloudflare_zone.spange_se.id
      name     = "protonmail2._domainkey"
      type     = "CNAME"
      value    = "protonmail2.domainkey.dkfornyojwiwnbbplwwvvs6jylvuk2np3ha77hicirwqgoe2qy22a.domains.proton.ch."
      ttl      = 1
      proxied  = false
      priority = null
    }
    "spange_se_dkim_3" = {
      zone_id  = cloudflare_zone.spange_se.id
      name     = "protonmail3._domainkey"
      type     = "CNAME"
      value    = "protonmail3.domainkey.dkfornyojwiwnbbplwwvvs6jylvuk2np3ha77hicirwqgoe2qy22a.domains.proton.ch."
      ttl      = 1
      proxied  = false
      priority = null
    }
    "spange_se_dmarc" = {
      zone_id  = cloudflare_zone.spange_se.id
      name     = "_dmarc"
      type     = "TXT"
      value    = "v=DMARC1; p=quarantine"
      ttl      = 1
      proxied  = false
      priority = null
    }
  }

  noomispange_se_records = {
    "noomispange_se_www_cname" = {
      zone_id  = cloudflare_zone.noomispange_se.id
      name     = "www"
      type     = "CNAME"
      value    = "noomispange.se."
      ttl      = 1
      proxied  = false
      priority = null
    }
    "noomispange_se_root_cname" = {
      zone_id  = cloudflare_zone.noomispange_se.id
      name     = "@"
      type     = "CNAME"
      value    = "noomispange-se.statichost.page."
      ttl      = 1
      proxied  = false
      priority = null
    }
  }

  all_records = merge(
    local.toyra_se_records,
    local.spange_se_records,
    local.noomispange_se_records,
  )
}

resource "cloudflare_record" "dns" {
  for_each = local.all_records

  zone_id  = each.value.zone_id
  name     = each.value.name
  type     = each.value.type
  value    = each.value.value
  ttl      = each.value.ttl
  proxied  = each.value.proxied
  priority = each.value.priority
}
