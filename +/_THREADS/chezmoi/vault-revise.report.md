# vault-revise report

Read-only throughout: no `op` command touched 1Password data (only `op vault edit --help` was read), no secret values read or stored, no network calls, no commits. All sheet files are mode 600 and untracked.

## Done

- Merged the item-hygiene batch into `vault-plan.md` as section 4, in apply order: vault changes, moves, archive, item hygiene, tags, questions, then a new section 7 for the recurring inbox triage.
- **Precedence (Decision 20):** Financial now ranks second, after Rig. Santander (dad) and Stripe (Techmedix) move to Financial, Wise (Sandra) stays there, and PayPal (Side Projects) moves in too. Vault descriptions and the Financial person tags are updated to match. Moves: 104 → 118.
- **Names (Decision 18):** 9 proposed renames had dropped an owner name where Kris has several entries for the service. 4 now keep their names and 5 use the bracketed form, leaving 359 renames. Added a qualifier batch (4d) for titles that would still be identical.
- **URLs (Decision 19):** marked approved. 21 proposals that pointed at sign-in or app pages now point at the home page, and 120 more sign-in addresses are added; 295 changes in all. Per-item rows are in `vault-items.detail.md`.
- **Retford Browns (Decision 17):** described as Janet Shipley, Willow Grove and David Brown, not Kris's parents.
- **Inbox (Decision 21):** 13 items whose home is uncertain move to Personal (2j), and an unanswered item question now sends the item to Personal. Personal keeps its name: the `op vault edit` CLI help (v2.38.1) doesn't say built-in vaults can be renamed, so I assumed they can't. I didn't check the web docs because the brief allowed no network calls.

## Failed

- Nothing. `rumdl` reports only line-length (MD013) warnings, as before.

## Needs Kris

1. Tick or strike the batches in `vault-plan.md`, and answer Questions 1–23, or reply "recommended".
2. New questions: 6 (whether insurance counts as financial), 19 (ParentPay), 20 (Aviva secure mail), 21 (a second sign-in address for the six off-domain logins, so autofill keeps working), 22 (how often to triage) and 23 (whose the Parents Google account is).
3. The home pages I derived for the 141 sign-in addresses weren't checked online, because the brief allowed no network calls. They get checked when the batch is applied.

Pre-revision copies are kept as `*.pre-revise` (mode 600).
