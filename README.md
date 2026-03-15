# dns

Terraform-managed Cloudflare DNS for `toyra.se`, `noomispange.se`, and `spange.se`.

## Prerequisites

- [OpenTofu](https://opentofu.org/docs/intro/install/) >= 1.0
- Cloudflare account with API token (`Zone:Read`, `Zone:Edit`, `DNS:Read`, `DNS:Edit`)

## Quick start

```sh
cp terraform.tfvars.example terraform.tfvars
# Fill in cloudflare_api_token and account_id
tofu init
tofu plan
tofu apply
```
