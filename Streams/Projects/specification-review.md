---
note_type: streams/project
slug: specification-review
title: Specification review
outcome: Kris has reviewed every Specification across the Knowledge Islands projects, and each one is confirmed, revised or retired.
initiative: platform-foundations
lifecycle: planned
lead: Kris Brown
target: null
updated: 2026-10-07T17:45:00Z
author: Written with Claude
---

# Specification Review

## Outcome

Kris reviews every Specification across the projects with an agent, one repository at a time, and each file is confirmed, revised or retired in its owning repository. The test: every file in the scope below has a recorded review outcome, and the owning repositories have landed any agreed changes.

This Project sits in [[platform-foundations|Platform foundations]]. Kris agreed it on 2026-10-07 (decision 13 of the state-of-play design). It carries the step the retired state-of-play plan decided on: "after the roadmaps are down, every specification across the projects is reviewed with Kris" (plan step 6).

---

## Update

**2026-10-07.** Created as `planned`. Nothing has been reviewed yet.

- **Health.** Not started. The roadmap reduction is done, so nothing blocks the first review.
- **Why a Project.** The plan was orphaned. No Initiative note mentioned it, and `KI-SPEC-RGV-001` lost the link on 2026-10-07 when its hold condition was rewritten. The [[specifications]] Project covers only the `ki-specifications` repository and is paused.

### Scope

52 Specification files under each repository's `docs/specs/`:

| Repository | Files |
| --- | --- |
| `tools-ki` | 15 |
| `apps-observatory` | 11 |
| `tools-rig` | 8 |
| `ki-agentic-harness` | 7 |
| `tools-mgit` | 3 |
| `mcp-acquire-whatsapp` | 2 |
| `mcp-ki-kb-fs` | 2 |
| `tools-git-almanac` | 2 |
| chezmoi | 2 |

The `ki-specifications` repository review stays with [[specifications]] and its record `KI-SPEC-RGV-001`.

### Decision

The review order and how each outcome is recorded: a review note per repository, or a roadmap record in each owning repository. The test: Kris chooses before the first review starts.

### Next step

Kris picks the first repository. `tools-ki` holds the most files and is the most active, so it is the suggested start.

---

## Open records

Membership is classification, not authority. Status lives in each record.

- [KI-SPEC-RGV-001](../../../ki-specifications/docs/roadmap/KI-SPEC-RGV-001-review-specifications-repository.md) - Review KI Specifications (related; it belongs to [[specifications]])

---

## Ideas

- Run each review with `ki-specs` AUDIT first, so Kris reads findings rather than raw files.

---

## Sources

- GOV-020 state-of-play survey, section 4 (`~/.local/state/claude-bg/gov-020/survey.report.md`), 2026-10-07.
- Decision 13 in the state-of-play design (`~/.local/state/ki/state-of-play/design/decisions.md`).
