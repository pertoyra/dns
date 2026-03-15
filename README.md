# dns

Terraform-managed Cloudflare DNS for `toyra.se`, `noomispange.se`, and `spange.se`.

## Prerequisites

- [Terraform](https://developer.hashicorp.com/terraform/install) >= 1.0
- Cloudflare account with API token (`Zone:Read`, `Zone:Edit`, `DNS:Read`, `DNS:Edit`)

## Quick start

```sh
cp terraform.tfvars.example terraform.tfvars
# Fill in cloudflare_api_token and account_id
terraform init
terraform plan
terraform apply
```

## Setup checklist

Before running `terraform apply` for the first time:

1. Replace all `REPLACE_ME` tokens in `records.tf` with the actual DKIM values from Proton Mail (Settings → Custom Domain → Authentication) — one set per domain
2. Add the Proton Mail verification TXT records per domain (marked with `TODO` in `records.tf`)
3. Confirm the `noomispange.se` CNAME target and root A record with statichost.eu

After `terraform apply`:

1. Note the Cloudflare nameservers assigned to each zone (visible in the Cloudflare dashboard)
2. Update nameservers for each domain at Oderland (the registrar) to the Cloudflare-assigned pair
3. Wait for nameserver propagation (up to 24–48h); zones will show as "Active" in Cloudflare once complete
4. Verify Proton Mail domain ownership and DKIM in Proton Mail settings
