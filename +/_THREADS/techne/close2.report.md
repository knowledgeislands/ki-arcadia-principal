# close2 - report

Authority: Decision 12 (2026-10-08) in `/Users/krisbrown/.local/state/ki/agents/techne/decisions.md`.

## Done

- **KI-ARCADIA-GOV-031** (`/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-GOV-031-general-agent-host-decisions.md`, now pruned). "The review date" is removed from the Expiries bullet of [ODR-KI-ARCADIA-001](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Governance/Decisions/ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host.md), and the fold-in is recorded in the record's Boundary, Steps and Review (`02b9818`). Accepted through `ki-accept`, quoting Decision 12 (`bf0c796`), then pruned in a prune-only commit (`a29604e`). No live links pointed to it. Only plain-text mentions remained, in the checkpoint.
- **TECHNE-TOOLS-OPS-013** (`/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-013-guard-agent-host-work.md`, now pruned). Accepted, quoting Decision 12. In the same commit (`a8ca6dc`), [TECHNE-TOOLS-OPS-015](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-015-agent-host-workstation-pilot.md) now has `blocked_by: [TECHNE-TOOLS-OPS-014]` and OPS-013 has `blocks: []`, which keeps the audit's reciprocity check passing. [TECHNE-TOOLS-OPS-014](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-014-agent-host-pins-and-expiries.md) did not reference OPS-013 in its dependency fields, so it needed no change. Pruned in a prune-only commit (`962c3e0`). Nothing linked to it. The plain-text mentions in harness scripts, check comments and peer records are left as they are.
- **Triage captures** (v1 fields, with a Context citing ADR-KI-ARCADIA-003 and ODR-KI-ARCADIA-001):
  - [TECHNE-TOOLS-OPS-020](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-020-split-the-operator-guide.md) "Split the operator guide" (P10).
  - [TECHNE-TOOLS-OPS-021](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-021-owned-host-provider.md) "Owned-host provider" (P11, with P12 folded in).
  - [TECHNE-TOOL-CLI-007](/Users/krisbrown/workspaces/kit/knowledgeislands/tools-techne/docs/roadmap/TECHNE-TOOL-CLI-007-owned-host-adapter.md) "Owned-host adapter" (P11), cross-linked with OPS-021.
  - The Contexts of both P11 records say that running an owned host first needs a governance decision on the Techne Programme Hold, and that this decision is raised in `state-of-play`, not here.
  - The identifiers were reserved first (harness `57b6dd5`, tools-techne `4a60ca8`). The records are in harness `58d3cbf` and tools-techne `add5561`.
  - In the same harness commit, the Out-of-scope line of [TECHNE-TOOLS-OPS-019](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-019-person-neutral-recipe-defaults.md) now names OPS-020 and OPS-021 in place of "undecided proposals P10 and P12".
- **Checkpoint** `/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/techne.md`: brought to current state with its six sections kept. P13 is now listed under Open questions (`5a038be`).
- **Checks.** `ki repo audit --repo .` shows 0 failures in each repository. The remaining warnings were already there:
  - Arcadia: PASS=22, WARN=2.
  - ki-techne-harness: PASS=16, WARN=2.
  - tools-techne: PASS=17, WARN=2.
- **Pushed** fast-forward after `git fetch`. Only my own commits were ahead of origin in each repository:
  - Arcadia: `0f63031..5a038be`.
  - ki-techne-harness: `bf132f6..58d3cbf`.
  - tools-techne: `f0db2bc..add5561`.
  - Before committing, I fast-forwarded the local branches of ki-techne-harness and tools-techne to another session's already-pushed commits (`bf132f6`, `f0db2bc`).
- Nothing contacted the host, AWS, Tailscale or the GitHub API.

## Failed

- None.

## Needs Kris

- P13: the Techne Programme Hold decision for an owned host or another person's host, to be raised in `state-of-play`.
- Sign Claude (and optionally Codex) in on the host. Then plan TECHNE-TOOLS-OPS-014 through `ki-plan`.
