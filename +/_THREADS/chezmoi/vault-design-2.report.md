# 1Password vault design: report

Run: 2026-10-09, read-only (Decisions 12 and 13, [DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/)). Nothing in 1Password changed and no secret values were read. There are no commits. The run used `op vault list`, `op vault get` and `op item list` only, keeping titles, types and tags in a private scratch folder that it deleted at the end.

## Done

- Proposed a preset icon (with a fallback) and a description for each of the 14 vaults.
- Considered five additional vaults. I recommend one, conditionally; the other four are not worth creating.
- Reviewed tags on all 899 items: 525 items carry 52 different tags. I propose cutting this to 31 tags, which changes the tags on 498 items.
- The per-item tag changes are in `vault-design.detail.md` (mode 600, local only, item IDs included).

## Failed

- **Current icons cannot be read.** `op vault get` does not return a vault's icon, so the table below has no "current icon" column. Please check each one in the app before applying anything.

## Needs Kris

1. **Approve or amend the icons and descriptions.** Once approved, each vault takes one command: `op vault edit "<vault>" --icon <icon> --description "<text>"`.
2. **Answer the Howden Browns question from the inventory.** Your answer decides whether a household vault is needed (see Additional vaults) and where the 14 `home`-tagged household items end up.
3. **Confirm what `^` and `^^` mean.** I have read `^` as account state (`^mfa`, `^breached`, `^change_password`, `^redundant`) and `^^` as importance (`^^critical`, `^^bootstrap`). On that reading, `^^mfa` merges into `^mfa`.
4. **Decide on Valle Armonia.** Do `Victronenergy`, `Intentional Communities`, Ko-fi and Patreon belong to it? If so, and others will share access, an `Org - Valle Armonia` vault earns its place.
5. **Order of work: moves first, then tags.** Several tag removals depend on the item already being in its new vault.

## Icons and descriptions

The CLI accepts 44 preset icons: airplane, application, art-supplies, bankers-box, brown-briefcase, brown-gate, buildings, cabin, castle, circle-of-dots, coffee, color-wheel, curtained-window, document, doughnut, fence, galaxy, gears, globe, green-backpack, green-gem, handshake, heart-with-monitor, house, id-card, jet, large-ship, luggage, plant, porthole, puzzle, rainbow, record, round-door, sandals, scales, screwdriver, shop, tall-window, treasure-chest, vault-door, vehicle, wallet and wrench. The CLI cannot upload a custom image; only you can, in the app. A custom image would serve better where the third column says so: company logos, and photos for the vaults about people.

| Vault | Icon (fallback) | Custom image better? | Proposed description |
| --- | --- | --- | --- |
| Personal | bankers-box (document) | No | Inbox only. New saves land here; file each one into its proper vault at triage, and keep this empty. |
| Financial | wallet (treasure-chest) | No | Every bank, card, pension, loan, payment and crypto account, including company accounts (tagged hnr or techmedix). Takes precedence over every vault except Rig, a person's own vault and Legal. |
| Org - HNR | buildings (castle) | Yes: HNR logo | HNR company-level and statutory accounts that a co-director must be able to reach: Companies House, HMRC, Xero, AWS root accounts and domains. Tools you use as an employee go in Personal - HNR. |
| Org - Techmedix | gears (shop) | Yes: Techmedix logo | Techmedix company-level and statutory accounts: filing, tax, AWS organisation and SSO, and company purchasing. Its bank accounts go in Financial. |
| Personal - Dating | heart-with-monitor (rainbow) | No | Dating and adult sites, kept apart for privacy. |
| Personal - Family (Howden Browns) | house (cabin) | Yes: family photo | Accounts held for the Howden Browns household (Ancestry, the family Google account). Its scope depends on your answer to Needs Kris 2. |
| Personal - Family (Retford Browns) | cabin (brown-gate) | Yes: family photo | Accounts you manage for your parents (Dave and Janet): their email, Microsoft, Google, key box and shared streaming. |
| Personal - HNR | brown-briefcase (application) | No | Tools and services you use as an HNR employee. Company-level accounts go in Org - HNR, and anything a tool reads goes in Rig. |
| Personal - Kids | puzzle (rainbow) | Yes: photo | Accounts and IDs for Isaac, Poppy and Robyn, such as school, health and apps. Items are tagged with each child's name. Oliver has his own vault. |
| Personal - Kris | id-card (round-door) | Optional: photo | Your own accounts: development, photography, shopping, travel, home and everything else personal. Money goes in Financial, and other people's accounts go in their own vaults. |
| Personal - Legal | scales (bankers-box) | No | Court, divorce, child-maintenance, police and safeguarding accounts, which need the tightest handling. Takes precedence over the company vaults and Financial. |
| Personal - Oliver | green-backpack (galaxy) | Yes: photo | Oliver's own accounts and IDs, such as school, college, work and games. |
| Personal - Side Projects | art-supplies (plant) | No | Societies, volunteering and side ventures (YPS, scouts, Ko-fi and Patreon), tagged by project. Not company work. |
| Rig | wrench (screwdriver) | No | Only secrets that a tool or script reads (chezmoi, MCP servers, bots, release keys), so that a service account can be limited to this vault. No device unlocks, Wi-Fi or ordinary logins. |

The descriptions follow the inventory's precedence order. Rig comes first, then a person's own vault, then Legal, then the company vaults, Financial, Dating, Personal - HNR, Side Projects and Personal - Kris. The Personal inbox comes last.

## Additional vaults

Use one test for every candidate. Create a separate vault only when it needs **different access**: a different person, a service account, or tighter handling. If the items only need **finding**, a tag or 1Password's built-in Archive does the job at no cost.

| Proposal | Items that would move | Sorts | Recommendation |
| --- | --- | --- | --- |
| `Org - Valle Armonia` | Victronenergy, Intentional Communities (2), and Ko-fi and Patreon if they are Valle Armonia's | after Org - Techmedix | **Create only if** Valle Armonia is a venture whose co-members need shared access. Otherwise keep these in Side Projects under a `valle-armonia` tag. |
| Split Side Projects into YPS, Scouts and Ventures | YPS (8), Online Scout Manager (1), and Ko-fi, Patreon and PayPal | inside the Personal block | **Against.** That would leave three vaults of 1 to 8 items with no difference in access. The `yps` and `scouts` tags already separate them. Revisit only if a YPS committee member needs shared access; that would justify `Shared - YPS`, sorted after Rig. |
| `Personal - Home` (household) | about 14 household items (utilities, council, home devices), plus Wi-Fi and router items from Rig | between Personal - HNR and Personal - Kids | **Against, if** Howden Browns is your household: use that vault instead. If it is not, create this vault only if someone else in the house needs shared access. Otherwise these stay in Personal - Kris with the `home` tag. |
| Archive vault for stale items | about 29 stale and 8 `^redundant` items | — | **Against.** Use 1Password's built-in Archive, which hides items from autofill and search but keeps them recoverable. |
| Split Personal - Kris by topic (dev, photography, shopping) | hundreds | — | **Against.** The topic tags handle this; a split would add vaults with no access difference. |

## Tags

### Current usage

| Measure | Count |
| --- | --- |
| Items | 899 |
| Items with any tag | 525 |
| Distinct tags | 52 |
| `kris` (on 48% of all items; it repeats the vault name) | 434 |
| `shopping` | 111 |
| `home` (used as "not work", not as "household") | 96 |
| Tags used on only one item | 10 |

These problems recur:

- **Same meaning, different spelling:** `HNR` and `hnr`; `^^mfa` (18) and `^mfa` (8); `banking`, `finance` and `finances`; `home` and `house`; `health`, `nhs` and `medical`; `aws` and `host`, which always appear together.
- **Tags that repeat the vault:** `kris`, `personal`, `hnr` inside the HNR vaults, `techmedix` inside Org - Techmedix, `banking` inside Financial, `oliver` (in his own vault or heading there), `retford browns`, and `school`.
- **Tags that repeat a 1Password category:** `software licenses` (12), which is exactly the items whose type is Software Licence.
- **Inconsistent case and nesting:** `HNR` is the only capitalised tag. `activities/sailing` is the only nested tag, used on one item.
- **Tags used on one item:** `HNR`, `canon`, `piksel`, `learning`, `activities/sailing`, `school`, `finance`, `janet`, `poppy` and `robyn`. The last three are kept as person tags.

### Proposed scheme

The rule is that **a tag only says what the vault does not.** Tags are flat and lowercase. The scheme has three families:

1. **State and importance**, prefixed so they sort to the top. `^` marks state: `^mfa`, `^breached`, `^change_password`, `^redundant`. `^^` marks importance: `^^critical`, `^^bootstrap`. Clear `^breached` and `^change_password` once you have acted on them; archive `^redundant` items rather than keeping the tag.
2. **Topic**, used mainly to filter the large Personal - Kris vault: `dev`, `cloud` (replaces `aws` and `host`), `domain`, `photography`, `travel` (absorbs `parking` and sailing), `shopping`, `social`, `music`, `games`, `books`, `health`, `careers` (absorbs `learning`), `genealogy`, `insurance`, and `home`. `home` is narrowed to mean household: utilities, council and home devices.
3. **Whose or which** (only where the vault holds more than one): `isaac`, `poppy` and `robyn` in Kids; `janet` in Retford Browns; `yps` and `scouts` in Side Projects; `hnr` and `techmedix` in Financial.

### Tag changes

| Change | Tag | Items |
| --- | --- | --- |
| Remove | `kris` | 434 |
| Remove | `home` (all except 14 household items) | 84 |
| Remove | `hnr` and `HNR` (inside the HNR vaults) | 26 |
| Remove | `techmedix` (inside Org - Techmedix, and on Slack (techmedix), which moves there) | 20 |
| Remove | `oliver` | 19 |
| Remove | `software licenses` | 12 |
| Remove | `banking`, `finance`, `finances` | 15 |
| Remove | `personal` | 3 |
| Remove | `covid` (archive the items as well) | 2 |
| Remove | `retford browns` | 2 |
| Remove | `school`, `piksel` | 2 |
| Rename | `aws` and `host` to `cloud` | 31 |
| Rename | `^^mfa` to `^mfa` | 18 |
| Rename | `nhs` and `medical` to `health` | 3 |
| Rename | `house` to `home`; `parking` and `activities/sailing` to `travel` | 5 |
| Rename | `canon` to `photography`; `learning` to `careers` | 2 |
| Add | `hnr` on Barclays (HNR), Starling Bank HNR and Wise (HNR) in Financial | 3 |

In total, 498 items change: 619 tag removals, 59 renames and 3 additions. Afterwards, 319 items still carry a tag across 31 distinct tags. The other 209 items lose their only tag, almost all of them `kris` or `home`, which the vault already conveys.

The change list is computed from each item's current vault. Two other points:

- The title `Slack (techmedix) ` has a trailing space, which is worth fixing when you move it. <!-- rumdl-disable-line MD038 -->
- When you apply the tag changes, use `op item edit <id> --tags …`. It replaces the item's whole tag list, so set the full "Result" column from the detail file, not just the changed tag.

## Checks

- Commits: none (proposal-only run).
- 1Password: only `op vault list`, `op vault get` and `op item list` were used. No item fields were read.
- The scratch folder was deleted. The detail file is mode 600.
