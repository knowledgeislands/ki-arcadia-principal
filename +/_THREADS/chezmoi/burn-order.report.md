<!-- rumdl-disable-file MD041 -->
# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [chezmoi](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/chezmoi.md) › burn-order

**Run report at 00:15 BST · last mark 23:11 BST**

---

## Done

Read-only survey of the 13 records; nothing changed or committed. `rig doctor` was not re-run (Kris's 2026-10-15 result stands: findings=0, present=165, catalogue-only=21). `node --test` gave no usable output inside the time limit, so test status is unverified.

| Record | Verdict | Size |
| --- | --- | --- |
| [UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) | **Remaining.** Source steps A1–A7 delivered (91f1583); A8 not ticked (Adobe, Keynote/Numbers/Pages, DaVinci declarations). Laptop B1–B3 evidently done (Decision 75: doctor healthy after `mise install`). Open: B4–B7 laptop uninstalls, all of C (sol), which need Kris and the sol session. Not acceptable yet. | A8 S; B/C L, Kris-attended |
| [UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-077-reorganise-1password-vaults-safely.md) | **Remaining, mostly mechanical.** The vault moves are done (899 items reconciled, vault-apply-3 report), but the record's own criteria are not evidenced: its Steps are an unplanned placeholder, `.chezmoidata/mcp-servers.yaml` still carries 9 `op://` references to re-check against new item IDs, and the old `op-cache` plaintext is unchecked. | S–M |
| [UE-076](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-076-always-run-latest-source.md) | Remaining: unplanned; design questions open (where the fast-forward check lives, pull vs apply). | M, needs Kris/Opus |
| [UE-082](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-082-tolerate-missing-template-tools.md) | Remaining: `.chezmoitemplates/mcp-servers-json` line 117 still uses `output "which"`; swap for `lookPath` plus `warnf`, add a test. | S, Sonnet |
| [UE-087](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-087-manage-headroom-profile-arguments.md) | **Adopt**, Next: declare `init-user` arguments including HEADROOM_COMPRESS_USER_MESSAGES=0 in one place. Live re-run must happen from a terminal. | S–M |
| [UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md) | **Adopt**, Next: one `Host sol` block replacing the address block, plus a guide line. Cheap. | S, Sonnet |
| [UE-089](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-089-ki-tool-release-channels.md) | **Adopt**, Future: a design model for Kris to review first; touches Rig and tools. | L, Kris/Opus |
| [UE-090](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-090-close-rig-bring-up-gaps.md) | **Adopt**, Next: six concrete gaps. Items 3–6 (ki skill list, ordering, template, trusted dirs) are mechanical; Headroom deployment and the sign-in guide need a decision. Overlaps UE-087 (Headroom). | M |
| [UE-091](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-091-shared-dock-tool-links.md) | **Adopt**, Next: fully specified and a precise boundary. Depends on tools-rig KI-TOOL-RIG-CORE-042; the sol apply is Kris's. | S–M |
| [UE-027](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-027-honest-rationales-per-tool.md) | **Hold** until token reset: 121 rationales need Kris's confirmation. | L |
| [UE-035](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-035-install-whatsapp-spool-refresh.md) | Hold; 4 of 6 steps ticked. Open: explain the 29 Sept `Acquired: ?.` result and recheck spool growth. Both need evidence, not code. | S |
| [UE-084](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-084-render-zshenv-on-vega.md) | Hold until vega is rebuilt (review 2026-11-12). | S |
| [UE-071](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-071-audit-macos-privacy-permissions.md) | Future: audit needing Opus and Kris, after the token reset. | M |

**Nothing is done in practice and ready for acceptance.** The two you expected (086, 077) both have open steps.

**Burn-down order.**

1. Acceptances: none ready.
2. Sonnet, mechanical: UE-082, UE-088, UE-086 A8, UE-077 reference and cache check (read-only first), UE-090 items 3–6, then UE-091 source change.
3. Opus or Kris: UE-087 and the rest of UE-090 (decide Headroom), UE-076 planning, UE-086 B and C (Kris at the machines), UE-089 design.
4. Held: UE-027 and UE-071 wait for the token reset. UE-084 waits for vega. UE-035's two steps are Sonnet-sized but low value.
5. `rig apply` is held until Rig 0.6.3. It blocks live verification of UE-086 C5/C6 and C8 and of UE-091 on sol. Source edits are not blocked.

## In Progress

Nothing is running.

## Queries

**1. Acceptances.** **Context:** neither UE-086 nor UE-077 meets its criteria yet. **Query:** accept anything now? **Options:** a) (recommended) Accept nothing; keep 086 and 077 open. b) Accept 077 on the strength of the vault report alone.

**2. Triage dispositions.** **Context:** five triage records, none duplicates or superseded. **Query:** adopt all five? **Options:** a) (recommended) Adopt UE-087, UE-088, UE-090 and UE-091 at Next, and UE-089 at Future. Fold the Headroom overlap between UE-087 and UE-090 item 1 when planning. b) Adopt some and close the rest (name which).

**3. Order.** **Context:** tokens are short until the reset. **Query:** follow the order above? **Options:** a) (recommended) Run the Sonnet list in item 2 first, then the Kris-attended work after the reset. b) Start with the Kris-attended UE-086 B4–B7 uninstalls.

```text
Reply:
1. a) Accept nothing now; keep 086 and 077 open.
2. a) Adopt UE-087, 088, 090 and 091 at Next, UE-089 at Future.
3. a) Run the Sonnet-mechanical list first, then Kris-attended work after the reset.
```

```text
╭─ run report · 2026-10-14T23:15:06Z ──────────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] resume: reply to the queries above.
