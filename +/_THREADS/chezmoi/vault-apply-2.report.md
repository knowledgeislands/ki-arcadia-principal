# vault-apply-3 report: ticked 1Password batches applied

2026-10-09, about 15:50 to 16:35 BST. 1Password asked for approval once. One long-lived shell ran every `op` command, as Decision 29 requires, and was closed at the end. Nothing was deleted, nothing went to 1Password's Archive, and no secret value was read or stored. Every change is recorded in `vault-apply.log.md` with its before and after values, and old-to-new item IDs are in `vault-apply.work/idmap.tsv`.

## Done

- **Items reconcile.** 899 items before and 899 after. Every item is accounted for, including the 124 that moved and got new IDs. A fresh listing matched every change this run applied.
- **This run's changes:** 124 moves, 296 renames, 207 web addresses set to the service's home page, and 804 items with changed tags.
- **Ticked batches applied, adjusted by Kris's answers:**
  - 2a: tool keys and 12 licences moved to Rig. Retired kit also went to Rig, tagged `^archive` (answer 4); the York router is now `Router (York)`.
  - 2b: 28 items moved to Personal - Household.
    - York and Bracken Lane utility and council items are tagged `^archive` (answer 5).
    - Every personal insurance policy, including Questor and both Myinsurancefile copies, is here (answer 6).
    - All six TP-Link Cloud copies are here, tagged `^duplicate` (answer 7).
  - 2d to 2j were applied as ticked. Answers 10 to 20 adjusted them: for example, the Isaac, ParentPay and St Peters items moved, and items no longer in use are tagged `^archive`.
  - 4a renames: high- and medium-confidence names were applied. The 9 low-confidence names keep `^triage` for a hand check.
  - 4b home pages, 4c follow-up tags and 4d qualifiers were applied.
  - Section 5 tag scheme:
    - Removed: `kris` (434 items), `home` and `house`, the vault-redundant `hnr`, `techmedix` and `oliver`, and the old category tags.
    - `aws` and `host` are now `cloud`.
    - Person tags were added: `gerald`, `sandra`, `david`, `isaac` and `janet`.
- **Answer 1:** every `^mfa` and `^^mfa` tag was removed. None is left.
- **Answer 2:** Intentional Communities moved to Personal - Side Projects. It and Victron Energy, Ko-fi, Patreon and the second Intentional Communities copy now carry `valle-armonia`.
- **Answer 3:** Claude, Raindrop, Inoreader and Scooter Software sign-ins moved from Rig to Personal - Kris. GitButler and Ollama also went to Personal - Kris rather than Rig, because answer 3 keeps only licences in Rig. iMazing in Rig is a licence, so it stays.
- **Answers 8, 14, 15, 17 and 18 name a vault, so these items moved:**
  - `ancestry.co.uk` to Howden Browns.
  - Sage and Sage API to Org - Techmedix.
  - ISaidUSaid to Personal - Legal.
  - Companies House (Notifications) to Financial.
  - Cocoatech Pathfinder to Rig.
  - Proav to Side Projects.
- **Answer 21:** the six sign-ins on another domain keep their address and are tagged `^fix_url`.
- **Earlier work checked:** the three chezmoi reference changes were already committed (`c9a771b`), and the Howden Browns and Retford Browns vault fixes were already done. This run moved no item that chezmoi reads, so no chezmoi file changed and nothing needed committing.
- **Checks:**
  - The four configuration files that read 1Password render with fresh reads and no change.
  - `ki repo audit` passes with 0 failures and 2 warnings, both in other repositories.

## Follow-up tags now, by vault

| Vault | Items | `^triage` | `^archive` | `^duplicate` | `^review` | `^fix_url` |
| --- | --- | --- | --- | --- | --- | --- |
| Financial | 44 | 8 | 0 | 6 | 1 | 1 |
| Org - HNR | 15 | 0 | 0 | 0 | 0 | 0 |
| Org - Techmedix | 27 | 4 | 0 | 2 | 0 | 0 |
| Personal (inbox) | 17 | 14 | 0 | 1 | 13 | 1 |
| Personal - Dating | 10 | 0 | 0 | 0 | 0 | 0 |
| Personal - Family (Howden Browns) | 4 | 4 | 0 | 3 | 0 | 0 |
| Personal - Family (Retford Browns) | 5 | 1 | 0 | 0 | 1 | 0 |
| Personal - HNR | 66 | 21 | 0 | 15 | 5 | 1 |
| Personal - Household | 28 | 11 | 9 | 8 | 1 | 0 |
| Personal - Kids | 18 | 1 | 1 | 0 | 1 | 0 |
| Personal - Kris | 569 | 100 | 1 | 33 | 15 | 5 |
| Personal - Legal | 8 | 0 | 0 | 0 | 0 | 0 |
| Personal - Oliver | 21 | 4 | 2 | 1 | 2 | 0 |
| Personal - Side Projects | 15 | 2 | 0 | 2 | 0 | 0 |
| Rig | 52 | 6 | 6 | 4 | 2 | 0 |
| **Total** | **899** | **176** | **19** | **75** | **41** | **8** |

`^triage` stayed on 176 items, down from 784, for one of these reasons:

- A deferred batch would touch them: section 3's duplicate, stale and defunct items, and 2c.
- They carry a follow-up tag.
- Their home is still uncertain: the inbox items, Directline for business, Howden Browns' `Google` and Retford Browns' `Microsoft`.
- They have a low-confidence rename or a sign-in key the command line cannot edit.

## Deferred, as Kris left them unticked

- **2c:** Google (Heaffudene) and 123-reg (heaffudene) stay in Personal - Kris with `^triage`. `ancestry.co.uk` moved anyway, because answer 8 names its vault.
- **Section 3:** duplicates, stale and defunct services were left in place with `^triage`. They were not archived or tagged `^archive`.
- **Section 7:** the recurring inbox-triage template was not written.

## Failed

- **The command line refused four moves.** Tailscale, Zed and Git-radar stay in the Personal inbox, and Claude stays in Rig. 1Password says each holds a field type it cannot validate, so these items cannot be moved or edited from the command line. Move them to Personal - Kris in the app.
- **`chezmoi status` fails on the whole tree, but not because of this run.** Another thread has uncommitted, staged work: `private_rig.toml` was renamed to `.tmpl`, and `.chezmoi.yaml.tmpl` was changed. That template needs `rigProfile`, which is unset until `chezmoi init` runs.
- **9 of 176 tests fail for the same reason.** Each Rig catalogue test looks for the old `private_rig.toml`. I did not touch that work.
- **Web addresses were not checked live.** The run made no network calls, so no address was tested by loading it.

## Needs Kris

1. In the app, move Tailscale, Zed and Git-radar from the Personal inbox, and Claude from Rig, to Personal - Kris.
2. Review the 19 `^archive` items, the 75 `^duplicate` items, the 41 `^review` items and the 8 `^fix_url` items.
3. Say whose `Google` is in Howden Browns and whose `Microsoft` is in Retford Browns. Say where Directline for business belongs.
4. Tick section 3 and 2c when ready. Tell me if the five inbox tools (2a) should go to Rig rather than Personal - Kris; I applied answer 3 to them.
5. The thread working on the Rig template needs to finish its change, or run `chezmoi init --promptString rigProfile=…`, before `chezmoi status` and the Rig tests pass again.

No commits were made by this run. Nothing was pushed or applied.
