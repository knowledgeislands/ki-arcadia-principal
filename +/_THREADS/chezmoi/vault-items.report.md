# vault-items report — 1Password item hygiene

## Done

- Proposed **363 title renames** across 899 items in 14 vaults: 184 brand-styling or spelling fixes, 98 bare domains, 28 qualifier formats, 24 redundant owner names, 22 generic titles, 6 status notes and 1 stray space. 325 are high confidence, 29 medium and 9 low.
- Checked the primary URL of all 811 items that have one, against 762 distinct sites. Proposed **175 URL changes**: 152 corrections, 22 to check by hand and 1 with no address found.
- Listed **35 defunct services** for the Archive batch, with evidence for each.
- Proposed follow-up tags. Reuse `^breached`, `^change_password` and `^redundant` (5 more items), and add only `^review` (37 items) and `^fix_url` (1 item).
- Wrote [vault-items.md](vault-items.md) (batch 6, ready to paste) and [vault-items.detail.md](vault-items.detail.md) (per item, with 1Password IDs). Both are mode 600.
- Checks: both files pass `rumdl check`. The only remaining findings are default line-length warnings, which do not apply to these state files. No commits, because the outputs are untracked state files.
- Access was read-only. 1Password was read only with `op item list --format json`, keeping titles, categories, URLs, tags and dates. No secret values were read or stored, and nothing in 1Password changed. The brief explicitly allowed the network checks: unauthenticated GET requests with short timeouts and 12 parallel connections. The scratch copy has been deleted.

## Failed

- Eight large sites block automated checks: Costa, KLM, Ebuyer, ITV, Jet2, Air France, Slow Dating and Howdens. I treated them as live and left them unchanged, so their URLs are not verified.

## Needs Kris

- Approve batch 6 in the approval sheet, or amend it. Check the 9 low-confidence renames first.
- Work through the 37 `^review` items once the tags are applied: unidentified services, dead addresses where the account may still matter, and the ambiguous pairs.
