# 1Password vault inventory — report

Run: 2026-10-09, read-only (Decision 12, [DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/)). Nothing in 1Password was changed. No secret values were read. No commits.

## Done

- Listed all 899 items across 14 vaults and recorded each item's name, type, site, tags and last update.
- Proposed a precedence order and 71 moves, plus 15 cases that need your decision.
- Checked all 7 chezmoi 1Password references. 6 work. **1 is broken** (see below).
- Full detail is in `vault-inventory.detail.md` (mode 600, local only).

## Failed

- Nothing failed. The 1Password CLI timed out twice waiting for desktop approval, then succeeded on the third try.

## Needs Kris

1. **Fix the GSuite reference before midnight.** You moved `Personal GSuite Client Id & Secret` to Rig. A moved item gets a new ID, so `.chezmoidata/mcp-servers.yaml` lines 92 and 94 now point at nothing. `chezmoi status` works today only because the value is still cached. The cache expires at local midnight, and after that rendering the MCP configuration will fail. The fix is a two-line source change to `op://Rig/rn2c6gj5y7jqsuztge4n36lnqa/username` and `/password`. I haven't made it because this run was read-only. Say if you want it done.
2. **Decide what Rig is for.** Only about 5 of its 29 items are things a tool reads. The rest are Mac and iPhone unlock codes, Wi-Fi networks, the router, and consumer logins such as Nord, Starlink and Raindrop. If a service account is going to be scoped to Rig, it would be able to read all of those. I recommend moving them to Personal - Kris.
3. **Decide what "Personal - Family (Howden Browns)" holds.** If it is your own household, most home-tagged utilities, insurance and house accounts in Personal - Kris should move there. If not, they stay where they are.
4. Answer the ambiguous cases listed below.
5. Plan the move order. Each Rig move of a chezmoi-read item needs its `op://` reference updated at the same time (see the last section).

## Proposed precedence

When an item fits more than one vault, the first match wins:

1. **Rig**: a tool or script reads it. A service account can only see one vault, so this has to beat everything else.
2. **A person's own vault (Kids, Oliver, Family ×2)**: the account belongs to someone other than you, even if you manage it.
3. **Personal - Legal**: court, child-maintenance and safeguarding accounts need the tightest handling.
4. **Org - HNR / Org - Techmedix**: company-level and statutory accounts (filing, tax, cloud root accounts) that must be shareable with a co-director.
5. **Financial**: any bank, card, pension, loan, payment or crypto account, including company ones. Your own examples put Tide Techmedix and Wise HNR here.
6. **Personal - Dating**: kept separate for privacy.
7. **Personal - HNR**: tools you use as an HNR employee.
8. **Personal - Side Projects**: societies, volunteering and side ventures (YPS, scouts, Ko-fi).
9. **Personal - Kris**: everything else of your own.
10. **Personal**: inbox only. It should be empty after each triage.

## Per-vault summary

| Vault | Items | Fit |
| --- | --- | --- |
| Personal (inbox) | 26 | All need filing: 24 have a proposed home, 2 are ambiguous |
| Financial | 34 | Good. 3 Wise logins are probably duplicates. M&S account is closed |
| Org - HNR | 19 | Good, except 5 identical copies of TP Link Cloud |
| Org - Techmedix | 26 | Good. A few shopping logins and a Pathfinder licence look personal. 1 closed AWS account, 2 marked redundant |
| Personal - Dating | 9 | Good |
| Personal - Family (Howden Browns) | 4 | Good. Purpose needs confirming (item 3 above) |
| Personal - Family (Retford Browns) | 4 | Good |
| Personal - HNR | 69 | Mostly good. 2 tool tokens belong in Rig; Slack (techmedix) belongs in Org - Techmedix; SeedLegals is arguably Org - HNR. Duplicate Redis, Miro and HNR console logins |
| Personal - Kids | 10 | Good. MyChildAtSchool is tagged Oliver |
| Personal - Kris | 646 | Mostly right, but it is the main source of moves: children's and Oliver's accounts, YPS, money items, legal. 334 items not updated since before 2023 |
| Personal - Legal | 4 | Good |
| Personal - Oliver | 15 | Good |
| Personal - Side Projects | 4 | Thin. The YPS and scouts items would fill it |
| Rig | 29 | Mixed: only about 5 are tool-read (item 2 above) |

## Move list

There are 71 moves in total. I've grouped them by destination:

| Destination | Moves |
| --- | --- |
| Personal - Kris (inbox triage) | 16 |
| Personal - Kids | 13 |
| Personal - Side Projects | 9 |
| Rig | 8 |
| Financial | 7 |
| Personal - Oliver | 7 |
| Personal - Legal | 3 |
| Personal - HNR | 3 |
| Org - Techmedix | 2 |
| Org - HNR | 1 |
| Personal - Dating | 1 |
| Personal - Family (Retford Browns) | 1 |

The 10 most confident:

1. `project-rend`: Personal → Rig. chezmoi reads it.
2. `mcp-acquire-whatsapp`: Personal → Rig. chezmoi reads it.
3. `HNR M365 Client Id & Secret`: Personal - HNR → Rig. chezmoi reads it.
4. `Notion Access Token`: Personal - HNR → Rig. chezmoi reads it.
5. `Nationwide FlexDirect Debit Card (Kris)`: Personal - Kris → Financial. Its accounts are already there.
6. `Novuna Personal Finance`: Personal → Financial. It's a credit account.
7. `Google (Isaac / Poppy / Robyn - POPS)` (3 items): Personal - Kris → Personal - Kids. They are the children's school accounts.
8. `Google (Oliver - Personal)` (3 copies) and `Google (Oliver - St Peters)`: Personal - Kris → Personal - Oliver.
9. `netflix.com (kris)`: Personal - Kris → Personal - Family (Retford Browns). It's tagged janet, retford browns.
10. `Slack (techmedix)`: Personal - HNR → Org - Techmedix.

Clean-up, separate from moves:

- **Duplicates:** 39 titles have 58 extra copies. The worst are TP Link Cloud (6), Redis (5), Humans Not Robots console (4), Spotify (4), Twitter (4) and Instagram (4).
- **Likely stale:** 29 items are for a defunct service, a closed account or something marked unused. Examples: LastPass, Codeschool, Katacoda, Magicseaweed, Pocket, MADE.com, the COVID travel forms, the closed M&S and Techmedix AWS accounts, and the "not used" giffgaff.
- **Flagged in 1Password:** 39 items carry your own ^breached, ^redundant or ^change_password tags. All but 2 are in Personal - Kris.

## Ambiguous cases

- **Sage API** (Personal): Org - HNR, Financial or Rig? Whose books is it for, and will a tool read it?
- **ISaidUSaid** (Personal): Personal - Legal if it is the co-parenting record app, otherwise Personal - Kris.
- **Santander (dad)** (Personal - Kris): Retford Browns or Financial?
- **PayPal** (Side Projects): is it separate from the PayPal login in Financial?
- **Wise (Sandra)** (Financial): it's another person's card. Keep it there?
- **Companies House (Notifications)** (Personal - Kris): which company does it follow?
- **Google (B&K), Google (Heaffudene), 123-reg (heaffudene), ancestry.co.uk** (Personal - Kris): Howden Browns? This depends on item 3 above.
- **TP Link Cloud** (×5 in Org - HNR, ×1 in Kris): is it a company or a home account? Either way, keep one copy.
- **Cocoatech Pathfinder, Proav** (Org - Techmedix): personal or company?
- **The 23 non-tool items in Rig**: see item 2 above.

## chezmoi reference findings

| MCP server | 1Password item | Vault now | Resolves | Move to Rig |
| --- | --- | --- | --- | --- |
| rend | project-rend | Personal | Yes | Yes |
| m365 | HNR M365 Client Id & Secret | Personal - HNR | Yes | Yes |
| gsuite | Personal GSuite Client Id & Secret | Rig (already moved) | **No: the reference uses the old ID** | Done; reference must be updated |
| ki-kb-notion-mirror | Notion Access Token | Personal - HNR | Yes | Yes |
| acquire-whatsapp | mcp-acquire-whatsapp | Personal | Yes | Yes |

- `chezmoi status` finished with no errors and no pending changes. That result depends on the cached GSuite value, so it won't hold after midnight.
- `~/.config/chezmoi-op/aliases` has no references, only its header comments.
- No other concrete `op://` references exist in `.chezmoitemplates/`, templates or `bin/`.
- **Moving an item breaks its ID-based reference.** Four references still use IDs (m365 ×2 fields, gsuite ×2 fields, notion). When you move an item to Rig, update its reference in the same sitting. Rewriting all five references by name, as `op://Rig/<title>/<field>`, would make them easier to read but would break if an item is renamed.
- An old cache file for an unreferenced item is still in `~/.cache/op-cache` (`qktyhatmvnljnhgnjageuryz4a.json`). It does no harm.

## Checks

- Commits: none. This was a read-only run.
- `chezmoi status`: exited 0 with no output.
- 1Password: only `op vault list`, `op item list` and label-only `op item get` were used, the last only on chezmoi-referenced items. A temporary metadata scratch directory was deleted at the end.
