# [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › principal-gate

**Run report at 22:14 BST · last mark 16:09 BST**

---

## Done

- **GATE-PRINCIPAL: the commit gate is installed on sol.** `bun install --frozen-lockfile` installed 104 packages. Its `prepare` script set `core.hooksPath` to `.githooks`. Both commits below went through the gate, which passed with its scoped audit.
- **This thread's audit findings are cleared.** `8399794` docs(threads): clear ways-of-working audit findings. It covers 12 reports in `+/_THREADS/ways-of-working/` from 15 and 16 October:
  - Bare record identifiers are now linked to their local files (PMO-7). The two pruned records link to their GitHub files at their last revision.
  - Six reports lost the three chat-only rules at the top of the file. The rules were read as malformed front matter (NOTE-1a, MD041).
  - One MD013 paragraph was reflowed.
- **I made a correction, and it is pushed.** On that first commit the gate's Markdown fixer merged the lettered option lines in several reports into single paragraphs. My linking script also wrapped one identifier in two links. `efda2a1` fix(threads): restore ways-of-working option lines and single links puts blank lines between the options, as in the reports that pass. Every report now has the same number of option lines as before this run.
- **MD064 in `decisions.md` is fixed, but in another commit.** I removed the double space on line 645, inside Kris's THREADS-TMP-HOME quote. Another session committed the file in `c755aca` before I staged it, so the fix went into that commit and not into mine.
- **Nothing to fix in the other places the brief named.** The audit reports no findings for this thread's checkpoint pick-up block or front matter. The principal-tidy change (`c275d26`) and the streams-index change (`4fe1331`) have none either.
- **After the commits, the audit shows nothing in this thread's files from 15 and 16 October.** The whole-repository audit still fails on the findings listed under In Progress: 73 failures and 34 warnings, down from 84 failures.
- **ki-principal `main` is pushed fast-forward** from `4b295a3` to `efda2a1`. ROUTINE authorised it. origin had not moved. Under this run's commits were three commits from other sessions:
  - `278a49e` docs(threads): log the ROUTINE, REPLY-FORMS and SESSION-IDENTITY answers. It touches the ways-of-working checkpoint and `decisions.md`.
  - `618ddd3` docs(threads): clear tools-burndown audit findings and route the rest. It touches 38 files in `+/_THREADS/tools-burndown/` and `Streams/Projects/tools-burndown.md`.
  - `c755aca` docs(threads): log the REGISTRY-SHAPE and STATE-HOMES request. It touches `decisions.md`.
- **Nothing else was touched.** I did not touch, stage or revert any uncommitted file from another session. That includes the dirty ways-of-working checkpoint and the chezmoi, tools-burndown and desk-kit folders.

## In Progress

Nothing is running.

Outstanding - no action requested now. These are for ci-findings, from the audit after the push:

- **ways-of-working, before 15 October:** two PMO-7 findings. `types-reconcile.report.md` leaves [KI-HARNESS-GOV-182 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/dd5761c67cb1ed939d0c4925f5b4e4328dbace34/docs/roadmap/KI-HARNESS-GOV-182-wave-e-skill-renames.md) and [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md) bare, and `types-review.report.md` leaves [KI-PRINCIPAL-MOD-006](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-006-knowledge-acquisition-lifecycle.md) and [KI-PRINCIPAL-MOD-008](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-MOD-008-whole-philosophy-coherence-review.md) bare.
- **PMO-7 in other threads' reports:**

  | Thread folder | Findings |
  | --- | --- |
  | `mac-studio-setup` | 42 |
  | `chezmoi` | 8 |
  | `state-of-play` | 4 |
  | `desk-kit` | 2, including a link to a missing UE-094 record |
  | `knowledge-acquisition` | 1 |
  | `techne` | 1 |

- **NOTE-1a, malformed front matter:** 14 reports in `desk-kit`, `mac-studio-setup` and `state-of-play` have the same opening triple rule.
- **MD-mech:** MD013 in `mac-studio-setup/hostkey-check.report.md`.
- **ki-checkpoint RECORD-2 and LIFECYCLE-1:** `_state-of-play.md` and `knowledge-islands-model.knowledge-acquisition.md` have one finding each. `platform-foundations.tools-burndown.md` has six.
- **ki-decision-records:**
  - BODY-11: [ADR-KI-PRINCIPAL-007](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/ADR-KI-PRINCIPAL-007-territory-seats-on-hosts.md) has three wikilinks outside its collection.
  - INDEX-8: three warnings, because serials 004 to 006 appear after 007 in the index.
- **Warnings only:**
  - ki-pmo PMO-2: the `observatory` checkpoint label and its missing Project.
  - ki-pmo PMO-3: 9 coordination threads are active, and the cap is 4.
  - ki-repo-kb-streams STREAM-10: the close-out assessments for `chezmoi`, `paperclip-capture-and-rebuild` and `website`.
  - ki-repo-kb NOTE-4: mirror provenance.

## Queries

### REPORT-FILE-FORM - the saved-report shape that the gate accepts

**Context:** This run hit two conflicts between the chat form of a report and ki-principal's gate.

- The three `---` rules that open a chat report are read as malformed front matter in a saved file (NOTE-1a, MD041). The reports that pass already leave them out.
- `rumdl`'s MD013 `normalize` reflow merges lettered option lines that have no blank lines between them into one paragraph. The merge happens silently on commit, through lint-staged.

The ki-pmo standard documents neither rule, so later runs will keep making these mistakes.

**Query:** Should ki-pmo state the saved-report form: no opening triple rule, and a blank line after `**Options:**` and between options?

**Options:**

a) (recommended) Capture a ki-agentic-harness triage record that adds both rules to the ki-pmo run-report shape and to the background-run standard. ci-findings would then apply the same fix to the 14 NOTE-1a reports.

b) Leave the standard as it is and fix each finding as the gate raises it.

```text
REPORT-FILE-FORM

Capture a ki-agentic-harness triage record adding to the ki-pmo run-report shape and the ki-delegation background-run standard that a saved report omits the chat-only opening triple rule and puts a blank line after **Options:** and between lettered options, so rumdl's MD013 reflow does not merge them; ci-findings applies the same fix to the 14 NOTE-1a reports.
```

```text
╭─ run report · 2026-10-16T21:14:22Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] REPORT-FILE-FORM
- [committed] ways-of-working report fixes, pushed; this report committed with them

```text
Resume KI > Model > ways of working under current ki-pmo and ki-delegation since 2026-10-15T15:09:48Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
