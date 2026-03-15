resource "cloudflare_zone" "toyra_se" {
  account_id = var.account_id
  zone       = "toyra.se"
  plan       = "free"

  lifecycle {
    prevent_destroy = true
  }
}

resource "cloudflare_zone" "noomispange_se" {
  account_id = var.account_id
  zone       = "noomispange.se"
  plan       = "free"

  lifecycle {
    prevent_destroy = true
  }
}

resource "cloudflare_zone" "spange_se" {
  account_id = var.account_id
  zone       = "spange.se"
  plan       = "free"

  lifecycle {
    prevent_destroy = true
  }
}
