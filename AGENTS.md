# Agent guidance

## Adding a new domain

1. Add a `cloudflare_zone` resource in `zones.tf` with `lifecycle { prevent_destroy = true }`
2. Add a records map in `records.tf` under `locals`
3. Merge it into `all_records`

## Adding Proton Mail to a domain

Copy the record map from `toyra_se_records` in `records.tf`, update:
- All `zone_id` references to the new zone
- The `REPLACE_ME` tokens with the actual DKIM values for that domain (from Proton Mail settings)
- Map key prefixes to match the new domain short name

## Record map key convention

`"${domain_short}_${type}_${descriptor}"` — e.g. `"toyra_se_mx_10"`, `"spange_se_dkim_1"`

## Type uniformity

Always include `priority = null` on non-MX records so all map entries have the same object type.

## Safety

Never run `tofu apply` without explicit user confirmation.
