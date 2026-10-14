# vault-categories-2: ^recategorise tags

**Done**

- I tagged 10 items `^recategorise`. All 10 are clear cases where the category is wrong. The suggested category for each is in [vault-categories.detail.md](/Users/krisbrown/.local/state/ki/agents/chezmoi/vault-categories.detail.md) (mode 600, not committed), and every change is appended to [vault-apply.log.md](/Users/krisbrown/.local/state/ki/agents/chezmoi/vault-apply.log.md).
  - **Suggested API Credential (9):** Claude Kitteth API Key, HNR M365 Client Id & Secret, Linear API Key, Notion Access Token, Personal GSuite Client Id & Secret, Telegram Kitteth Bot and Telegram Valle Armonia Bot, all stored as Login; mcp-acquire-whatsapp and project-rend, stored as Secure Note.
  - **Suggested Wireless Router (1):** Wi-Fi (Matt's), stored as Login.
  - **By vault:** Rig 9, Personal - Kris 1.
- **Checked:** a fresh list still shows all 899 items, and each tagged item kept all its other tags.
- I judged from titles, categories, tags, web addresses and field names and types only. No secret values were read or stored. 1Password asked for approval once; the first few requests timed out until it was approved.
- No commits were expected and none were made. Nothing was pushed.

**Follow-up tags by vault (after this run)**

| Vault | Items | `^triage` | `^archive` | `^duplicate` | `^review` | `^fix_url` | `^recategorise` |
|---|---:|---:|---:|---:|---:|---:|---:|
| Financial | 44 | 8 | 0 | 6 | 1 | 1 | 0 |
| Org - HNR | 15 | 0 | 0 | 0 | 0 | 0 | 0 |
| Org - Techmedix | 27 | 4 | 0 | 2 | 0 | 0 | 0 |
| Personal | 17 | 14 | 0 | 1 | 13 | 1 | 0 |
| Personal - Dating | 10 | 0 | 0 | 0 | 0 | 0 | 0 |
| Personal - Family (Howden Browns) | 4 | 4 | 0 | 3 | 0 | 0 | 0 |
| Personal - Family (Retford Browns) | 5 | 1 | 0 | 0 | 1 | 0 | 0 |
| Personal - HNR | 66 | 21 | 0 | 15 | 5 | 1 | 0 |
| Personal - Household | 28 | 11 | 9 | 8 | 1 | 0 | 0 |
| Personal - Kids | 18 | 1 | 1 | 0 | 1 | 0 | 0 |
| Personal - Kris | 569 | 100 | 1 | 33 | 15 | 5 | 1 |
| Personal - Legal | 8 | 0 | 0 | 0 | 0 | 0 | 0 |
| Personal - Oliver | 21 | 4 | 2 | 1 | 2 | 0 | 0 |
| Personal - Side Projects | 15 | 2 | 0 | 2 | 0 | 0 | 0 |
| Rig | 52 | 6 | 6 | 4 | 2 | 0 | 9 |
| **Total** | **899** | **176** | **19** | **75** | **41** | **8** | **10** |

**Failed**

- Nothing.

**Needs Kris**

1. Recreate the 10 tagged items in their suggested categories. Most are in Rig and may be used by chezmoi or tools, so when you recreate one, keep its title and vault, or update whatever refers to it.
2. Wi-Fi (Matt's) also exists as a Wireless Router item in Rig, so the Login copy in Personal - Kris is probably a duplicate you can delete rather than recreate.
3. Borderline items I left untagged. Tell me if you want any of them tagged:
   - **Signing keys in Secure Notes:** ki-release-signing-key and ki-tools-release-bot private key. These may belong in SSH Key, but I could not tell the key format without reading the value.
   - **Sign-ins that also hold keys:** AWS kris.me.uk holds access keys, Backblaze holds application keys, Shortcut holds a token and MetaMask holds a recovery phrase (1Password has a Crypto Wallet category).
   - **Library Number** is a Secure Note that would fit Membership.
   - **Router, Router (York) and NAS (York)** are admin sign-ins with a web address, so Login fits them.
