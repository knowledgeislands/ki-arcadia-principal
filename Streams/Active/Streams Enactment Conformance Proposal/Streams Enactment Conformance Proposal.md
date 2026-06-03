---
type: stream-proposal
title: Streams Enactment Conformance Proposal
status: draft
priority: high
dependencies: []
author: Written with Claude
---

# Streams Enactment Conformance Proposal

## Proposal

Conform arcadia-principal's `Streams/` zone — and its canonical Model — to the Knowledge Islands Streams/Enactment standard now carried by the
`knowledgeislands-streams` skill. Two parts: **(A) promote the superset into the Model** (so the canonical definition matches the skill), and **(B) conform the
base's streams** to it (the `Proposal` suffix, the `type:` note-type scheme, machine-readable proposal frontmatter, and `Governance` footers).

## Motivation

The skill is now the canonical, self-contained home of the Streams conventions and the Enactment Process — and a **superset** of both this base's Model and
kit-legal's practice. kit-legal has already adopted it (its process is now the canonical `Enactment Process`). arcadia-principal, the principal island holding the
Model, currently **lags its own Model**: its streams carry no `Proposal` suffix, use `card/*` tags rather than `type:`, carry prose statuses
(`in-progress - April 2026`) without `priority` / `dependencies`, and have no `Governance` footers. This proposal closes that gap and makes the in-base Model the
faithful canonical source the skill points to.

## Inputs

- `Document` — the `knowledgeislands-streams` skill (canonical superset: structure + Enactment Process).
- `Document` — `Pillars/Knowledge Islands/Model/Conventions/Structure` and `Pillars/Knowledge Islands/Model/Processes/Enactment Process` (the Model notes to promote).
- `Decision` — adopt `type:` as the canonical note-type scheme (this session) and the `Proposal` suffix.

## Outputs

- `Artefact` — updated Model notes (Structure + Enactment Process) carrying the superset (leaf/parent layout + transition, note-types, the suffix, Settled
  point-in-time policy, out-of-scope, lightweight streams, convention-rollout consolidation).
- `Artefact` — 20 leaf streams renamed with the `Proposal` suffix; `Future/Island MCP/` resolved to the parent layout.
- `Artefact` — proposal frontmatter migrated to `type: stream-proposal` + bare-token `status` + `priority` + `dependencies`; zone/focus indexes to `type: stream-zone` / `stream-focus`.
- `Artefact` — `Governance` footers added to each stream; focus + proposals indexes relinked to the suffixed names.

## Checklist

1. **Re-scan** the live base for the current stream set and every inbound `[[<Stream>]]` link (re-verified at rollout).
2. **(A) Promote the Model** — add to `Model/Conventions/Structure` (Streams section): the `Proposal` suffix, leaf/parent/multi layout + the transition rule, the
   `type:` note-type table, and the Settled point-in-time policy. Add to `Model/Processes/Enactment Process`: the out-of-scope list, lightweight-stream carve-out,
   and convention-rollout consolidation. (Additive — the Model already carries the lifecycle, cycle, anatomy, rollout, review.)
3. **(B1) Rename** each leaf stream folder + note to add the ` Proposal` suffix (rename map in Design). Resolve `Future/Island MCP/` to the parent layout
   (`Island MCP.md` = slim `stream-index`; `Proposal.md` → `Island MCP Proposal.md` = `stream-proposal`).
4. **(B2) Migrate frontmatter** on each proposal: drop the `card/stream` tag, set `type: stream-proposal`; convert prose `status` to a bare lifecycle token; add
   `priority` (from the current proposals index) and `dependencies: []`; keep `topic/*` tags and `author`. Migrate zone/focus index notes `card/note` → `type: stream-zone` / `stream-focus`.
5. **(B3) Add a `## Governance`** footer to each stream linking `[[Enactment Process]]`.
6. **(B4) Relink** the focus indexes (`Active.md` / `Background.md` / `Future.md`) and the `Streams/Streams.md` proposals index: every `[[<Stream>]]` → `[[<Stream> Proposal]]`.
7. **Verify**: `streams:audit` PASS (Focus folders, suffix, frontmatter) and `kb:audit` still PASS; broken-`[[link]]` survey clean.

## Open Questions

- **Are all 20 streams genuinely proposals?** The canonical model treats every stream as a proposal. arcadia-principal's `Future/` entries are mostly _ideated,
  not-yet-started_ ideas. **Proposed default:** yes — apply the suffix + `status: draft` uniformly (Focus already carries "not started"); a `Future` idea is a
  `draft` proposal awaiting promotion. Flag if you'd rather keep `Future/` ideas un-suffixed.
- **`Future/Island MCP/`** already has a `Proposal.md`. **Proposed:** make it the parent layout (slim `Island MCP.md` index + `Island MCP Proposal.md`). Confirm.
- **Priorities** for streams not in the current proposals index will default to `medium` unless you set otherwise.

## Design

**Rename map** (leaf → `+ " Proposal"`; folder and same-name note both):

| Focus      | Current stream folder/note         | → Renamed to                                 |
| ---------- | ---------------------------------- | -------------------------------------------- |
| Active     | Authoring Layers                   | Authoring Layers Proposal                    |
| Active     | Boundary Rules                     | Boundary Rules Proposal                      |
| Active     | Knowledge Capital Extraction       | Knowledge Capital Extraction Proposal        |
| Active     | Stream Index Review                | Stream Index Review Proposal                 |
| Active     | Tooling Rollout                    | Tooling Rollout Proposal                     |
| Background | Island Concepts                    | Island Concepts Proposal                     |
| Background | Kit Legal Inception                | Kit Legal Inception Proposal                 |
| Background | Kit Principal Inception            | Kit Principal Inception Proposal             |
| Background | Page Registry                      | Page Registry Proposal                       |
| Background | Reading Order                      | Reading Order Proposal                       |
| Future     | Agent and Session Improvements     | Agent and Session Improvements Proposal      |
| Future     | Auto Proposal Pipeline             | Auto Proposal Pipeline Proposal              |
| Future     | Bullet Journal Support             | Bullet Journal Support Proposal              |
| Future     | Intentional                        | Intentional Proposal                         |
| Future     | Island MCP _(parent)_              | Island MCP/ + Island MCP Proposal.md         |
| Future     | Island Visualisation               | Island Visualisation Proposal                |
| Future     | MCP Ecosystem                      | MCP Ecosystem Proposal                       |
| Future     | Scheduled Automations              | Scheduled Automations Proposal               |
| Future     | Semantic Conventions               | Semantic Conventions Proposal                |
| Future     | Token Economics                    | Token Economics Proposal                     |
| Future     | Workflow Integrations              | Workflow Integrations Proposal               |

(This proposal itself already follows the target convention: `Streams/Active/Streams Enactment Conformance Proposal/…`, `type: stream-proposal`.)

**Frontmatter migration** — per proposal: `tags: [card/stream, topic/*]` → `type: stream-proposal` + keep `topic/*`; `status: "<token> - April 2026"` → bare
`status: <token>`; add `priority` (from the proposals index, default `medium`) and `dependencies: []`; keep `author`. Index notes: `card/note` → `type: stream-zone` (`Streams.md`) / `type: stream-focus` (`Active.md` etc.).

## Governance

This stream adheres to the [[Enactment Process]]. Content reaches `Pillars/` or `Resources/` only on user approval of a `ready` proposal; rollout follows the
Checklist and does not begin without explicit authorisation.
