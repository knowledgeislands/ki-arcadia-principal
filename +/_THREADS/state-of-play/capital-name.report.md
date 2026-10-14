# Capital name - report

Authority: Decision 153; [GDR-KI-PRINCIPAL-008](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/GDR-KI-PRINCIPAL-008-capital-naming.md).

## Done

- Charter Identity: Capital is Knowledge Islands Principal; skill `ki-principal`; task prefix `ki-principal-`; auto-memory prefix `ki-principal`; triggers name Knowledge Islands Principal.
- AGENTS.md, README, Admin, Streams Project and Initiative notes, and Pillars (including the Realisation Charter and Configuration `ki-principal-` examples): live "Arcadia" naming renamed in 88 files.
- package.json: dropped the `arcadia` keyword.
- Runtime dependents: none found that read the skill name or task prefix (no scheduled tasks, Activities, Cowork tasks, registry, chezmoi or `.ki.toml` entries use `arcadia-principal`).
- KB audit: FAIL=0, two existing STREAM-10 close-out warnings (paperclip-bootstrap-and-recovery, website). Commit bb710a2, rebased and pushed fast-forward to origin/main.

## Needs Kris

- Great Library of Arcadia: the `Pillars/Philosophy/Realisation/Arcadia/` note and the "Great Library of Arcadia" name (settled by SDR-KI-PRINCIPAL-007) are unchanged, so the Arcadia note still says "Arcadia is the Capital". Decide whether to keep Arcadia as the library's mythic name or rename the note and library.
- Outside this repository: `ki-agentic-harness` ki-work-roadmap checker messages and tests say "Arcadia territory" (`roadmap-evidence.ts`, its tests and `area-definitions.test.ts`); ki-repo-kb `sources.md` cites a `ki-arcadia-principal` server; ki-design-loop `sources.md` mentions Arcadia. Those belong to the harness.
- Old Claude project memory folder `~/.claude/projects/-Users-krisbrown-workspaces-kit-knowledgeislands-ki-arcadia-principal` still exists. It is stale local state, so remove it only if you want to.
