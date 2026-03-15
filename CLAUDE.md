# Project context

Terraform-managed Cloudflare DNS for personal domains: `toyra.se`, `noomispange.se`, `spange.se`.

## File layout

| File | Purpose |
|---|---|
| `main.tf` | Terraform and provider configuration |
| `variables.tf` | Input variables (`cloudflare_api_token`, `account_id`) |
| `zones.tf` | `cloudflare_zone` resources, one per domain |
| `records.tf` | All DNS records via a single `cloudflare_record.dns` with `for_each` |

## Key pattern

All records are defined as map entries in `locals` in `records.tf`, merged into `local.all_records`, and applied through a single `cloudflare_record.dns` resource.

Map key convention: `"${domain_short}_${type}_${descriptor}"` (e.g. `"toyra_se_mx_10"`)

## Sensitive data

Never commit `terraform.tfvars`, API tokens, or state files. These are covered by `.gitignore`.

## Safety

Do not run `terraform apply` without explicit user confirmation.
