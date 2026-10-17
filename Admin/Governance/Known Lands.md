---
note_type: admin/index
tags:
  - card/note
  - topic/knowledge-islands
status: current - October 2026
author: Mixed
---

# Known Lands

## Overview

Known Lands records the Knowledge Islands territory's governed internal inventory and separately signposts external lands. Knowledge Islands Principal is its Capital under [[Governance/Charter|Charter]]. Internal entries declare membership and ownership boundaries; external entries describe relationships to independent authorities.

Any island may maintain its own chart of useful topics, sources and destinations. Those local charts can support queries, captures and work without claiming jurisdiction or replacing the Capital's inventory.

---

## Internal inventory

The current inventory contains 20 canonical KI repository identities: Knowledge Islands Principal and 19 member islands. This owner-approved inventory agrees with the single ordered territorial roster in `.ki.toml`, including Knowledge Islands Principal. `territory_prefix = "knowledge-islands"` supplies the short selection handle and Paperclip retains organisation code `KIS`. The machine-readable member list is `territory_members` under `[skills.ki-repo]` in Knowledge Islands Principal's `.ki.toml`, and every member names Knowledge Islands Principal in its own `[skills.ki-repo].capital`. A change to this inventory updates both in the same enactment.

Each island owns its accepted knowledge or executable behaviour within the shared governance. The roles below distinguish Capital, specialist knowledge, reusable capabilities, products, integrations, tools and delivery without turning a product boundary into another territory.

| Repository | Role | Owned concern |
| --- | --- | --- |
| [apps-knowledgeislands.info][apps-knowledgeislands.info] | Publication | Public source-labelled website |
| [apps-observatory.local][apps-observatory.local] | Product | Repository and knowledge reader |
| [homebrew-tap][homebrew-tap] | Delivery | Homebrew distribution |
| [ki-agentic-harness][ki-agentic-harness] | Capability | Reusable agentic contracts |
| [ki-principal][ki-principal] | Capital | KI governance, model and engineering practice |
| [ki-specifications][ki-specifications] | Standards | Portable contracts after V1 |
| [ki-techne-harness][ki-techne-harness] | Product | Controller and execution fabric |
| [mcp-acquire-whatsapp][mcp-acquire-whatsapp] | MCP | WhatsApp acquisition |
| [mcp-git-audit][mcp-git-audit] | MCP | Repository inspection |
| [mcp-gsuite][mcp-gsuite] | MCP | Google Workspace integration |
| [mcp-housekeeping-chatgpt][mcp-housekeeping-chatgpt] | MCP | ChatGPT housekeeping |
| [mcp-housekeeping-claude][mcp-housekeeping-claude] | MCP | Claude housekeeping |
| [mcp-ki-kb-fs][mcp-ki-kb-fs] | MCP | Knowledge Base filesystem |
| [mcp-ki-kb-notion-mirror][mcp-ki-kb-notion-mirror] | MCP | Knowledge Base Notion mirror |
| [mcp-m365][mcp-m365] | MCP | Microsoft 365 integration |
| [tools-git-almanac][tools-git-almanac] | Tool | Git chronology |
| [tools-ki][tools-ki] | Tool | KI governance host |
| [tools-mgit][tools-mgit] | Tool | Repository operations |
| [tools-rig][tools-rig] | Tool | Local environment tooling |
| [tools-techne][tools-techne] | Tool | Techné operator command |

Knowledge Islands Principal's [[Engineering Practice/Engineering Practice|Engineering Practice]] is the canonical home of Techné's engineering knowledge and decisions. The former source repository, [ki-techne-principal][ki-techne-principal], was retired on 4 October 2026 under [KI-PRINCIPAL-ECO-008](https://github.com/knowledgeislands/ki-principal/blob/7809c906a8e9531d1986ac6123932b03ac062b97/Streams/Roadmap/KI-ARCADIA-ECO-008-disposition-retained-techne-source.md): it is archived read-only as historical evidence, is no longer a member, and holds no live work. The [[Techne Programme Hold]] restricts remote running and remote-environment management across Techné Harness and `tools-techne`. The two implementation products retain independent ownership; local development continues under their repository standards, and knowledge adoption does not itself change services or accept candidates.

The former [ki-plugins][ki-plugins] Claude plugin projection was retired on 5 October 2026 under [KI-PRINCIPAL-ECO-010](https://github.com/knowledgeislands/ki-principal/blob/7809c906a8e9531d1986ac6123932b03ac062b97/Streams/Roadmap/KI-ARCADIA-ECO-010-retire-ki-plugins.md) and the harness decision [ADR-KI-HARNESS-015](https://github.com/knowledgeislands/ki-agentic-harness/blob/92c6014286a0711b8badf9a8b9fe6294d0780a8d/docs/decisions/ADR-KI-HARNESS-015-retire-the-claude-plugin-projection.md): it is archived read-only, is no longer a member, and is not a distribution surface. The `ki` CLI installs the harness, and `npx skills add` is the quick skills-only route.

The former [mcp-housekeeping-codex][mcp-housekeeping-codex] Codex housekeeping MCP was retired on 11 October 2026 under state-of-play owner decisions 37 and 40, after its Codex tools merged into [mcp-housekeeping-chatgpt][mcp-housekeeping-chatgpt]: it is archived read-only and is no longer a member.

Specifications remains dormant as a normative authority until the overall V1 boundary. The inventory records its membership without representing future standards as current obligations.

---

## Domains

Domains the territory holds or plans to hold, recorded from the 2026-10-12 inventory. Cloudflare and the registrars remain the authority for live configuration; this table records purpose and ownership.

| Domain | Purpose | Hosting | Serving repository |
| --- | --- | --- | --- |
| `knowledgeislands.info` | Site (apex and www); mail; www-to-apex redirect planned | Cloudflare Worker `ki-website` via Workers Builds; Email Routing. The approved www-to-apex redirect follows once a Cloudflare API token exists | `knowledgeislands/apps-knowledgeislands.info` |
| `knowledgewayfinder.info` | Site; mail | Cloudflare Worker `kw-alejandro`; Email Routing | `knowledge-wayfinder/kw-website` |
| `observatory.local` | Local site | Machine-local name, not a registered domain | `knowledgeislands/apps-observatory.local` |

## Estate territories

The estate has eight territories. Each has a handle, a short alias used in repository names and codes, a class: entity or individual, and a seat: the host role where it is primarily tended, home or hub, with Knowledge Islands, Legal and Personal seated on both, tipped to the hub, under [[ADR-KI-PRINCIPAL-007-territory-seats-on-hosts|ADR-KI-PRINCIPAL-007]]. The binding of each role to a machine stays in the local registry and chezmoi. This list names each territory's Capital for reference only; it grants no membership, authority, access, or permission to exchange material.

| Territory | Handle | Alias | Class | Seat | Capital |
| --- | --- | --- | --- | --- | --- |
| Knowledge Islands | `knowledge-islands` | `ki` | Entity | Both | `knowledgeislands/ki-principal` |
| Humans Not Robots | `humans-not-robots` | `hnr` | Entity | Home | `krisb/hnr-principal` |
| Equal Remedy | `equal-remedy` | `er` | Entity | Hub | `equalremedy/er-principal` |
| Techmedix | `techmedix` | `tmx` | Entity | Hub | `techmedix/tmx-principal` |
| Valle Armonia | `valle-armonia` | `va` | Entity | Hub | `vallearmonia/va-principal` |
| Legal | `legal` | `lgl` | Individual | Both | `krisb/legal-principal` |
| Personal | `personal` | `kb` | Individual | Both | `krisb/personal-principal` |
| Sacred Inquiry | `sacred-inquiry` | `si` | Individual | Hub | `sacred-inquiry/si-principal` |

---

## External lands

External lands are governed by other territories. A reference to their public knowledge, or their adoption of KI knowledge, does not make them internal members and gives Knowledge Islands Principal no jurisdiction over them.

No external membership or private consumer inventory is declared here. A future entry must name the public authority and the local relationship it documents; restricted agreements and private identities stay with the participating owners in an appropriate private location.

---

## Resolution and reconciliation

Public entries use canonical repository identities. The local registry owns machine-specific checkout and source-store resolution; physical paths do not belong in this inventory. An island's availability on one machine is a separate observation from its governed membership.

KI and mgit derive repository selection from the Capital's ordered territorial roster; `-t knowledge-islands` selects this territory, `--estate` selects the registered estate and `-f` narrows either scope by literal, case-sensitive repository directory-name prefixes. Paperclip company bindings support coordination. They cannot automatically add or remove members, grant source access or confer acceptance authority. An inconsistent declaration is a finding for the accountable owners to reconcile.

Membership and ownership changes follow the territory's Enactment Process and the affected repository's authority. A source repository remains a member until a separately verified consolidation and owner-approved retirement disposition changes this inventory.

[apps-knowledgeislands.info]: https://github.com/knowledgeislands/apps-knowledgeislands.info
[apps-observatory.local]: https://github.com/knowledgeislands/apps-observatory.local
[homebrew-tap]: https://github.com/knowledgeislands/homebrew-tap
[ki-agentic-harness]: https://github.com/knowledgeislands/ki-agentic-harness
[ki-principal]: https://github.com/knowledgeislands/ki-principal
[ki-plugins]: https://github.com/knowledgeislands/ki-plugins
[ki-specifications]: https://github.com/knowledgeislands/ki-specifications
[ki-techne-harness]: https://github.com/knowledgeislands/ki-techne-harness
[ki-techne-principal]: https://github.com/knowledgeislands/ki-techne-principal
[mcp-acquire-whatsapp]: https://github.com/knowledgeislands/mcp-acquire-whatsapp
[mcp-git-audit]: https://github.com/knowledgeislands/mcp-git-audit
[mcp-gsuite]: https://github.com/knowledgeislands/mcp-gsuite
[mcp-housekeeping-chatgpt]: https://github.com/knowledgeislands/mcp-housekeeping-chatgpt
[mcp-housekeeping-claude]: https://github.com/knowledgeislands/mcp-housekeeping-claude
[mcp-housekeeping-codex]: https://github.com/knowledgeislands/mcp-housekeeping-codex
[mcp-ki-kb-fs]: https://github.com/knowledgeislands/mcp-ki-kb-fs
[mcp-ki-kb-notion-mirror]: https://github.com/knowledgeislands/mcp-ki-kb-notion-mirror
[mcp-m365]: https://github.com/knowledgeislands/mcp-m365
[tools-git-almanac]: https://github.com/knowledgeislands/tools-git-almanac
[tools-ki]: https://github.com/knowledgeislands/tools-ki
[tools-mgit]: https://github.com/knowledgeislands/tools-mgit
[tools-rig]: https://github.com/knowledgeislands/tools-rig
[tools-techne]: https://github.com/knowledgeislands/tools-techne
