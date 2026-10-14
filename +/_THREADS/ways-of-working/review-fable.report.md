# review-fable report

**Done**

- Review written to `/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-review-fable.md` (uncommitted, as instructed; no other file changed, no commits).
- Fact-checked the brief against every cited source, the `ki` help text, `tools-ki/src/commands/` and the harness decision records; all 28 points marked, with a proposed four-unit structure and nine owner decisions.

Top five findings:

1. `ki agent launch` already has `--model` and `--effort` (tools-ki 4a4f970, 2026-10-13, unreleased); the brief's "being added" is stale, and the `ki` on the path is the local runner.
2. ADR-KI-HARNESS-SKILLS-005 and -006 describe `ki-delegation` as a packet-only capability and define the skill areas; both already misdescribe the skill and must be refined in the ki-pmo pilot, which the brief does not mention.
3. Keep the registry standard in `ki-work`, not `ki-pmo`: the checkers that enforce it live in `ki-work-roadmap` and `ki-repo-kb-streams`, and Portfolio is the top of Work, not a separate home.
4. Do not store an `opener` field: it is fully derivable from the thread name, so print it from `ki`; keep the `mark` field, in a second wave after a ki-pmo-only pilot.
5. Drift the brief missed: `rig.chezmoi` names a Project in no registry (the estate-area escape is in live use), the master's `thread-history.md` lives only in the non-durable run folder, and labels like `KI Model:` cannot be derived from any registry field. Drift 4 in the brief (old Project path) is already fixed by checkpoint commit d9474f3.

**Needs Kris**

- The nine owner decisions at the end of the review, chiefly: whether to rename `ki-design-loop` (recommend keep, or `ki-deliberate`, never `ki-shape`); coordinator default (`standard` at low effort now, `fast` once the threads view and mark command exist); views under `ki repo` rather than `ki territory`; and where the purpose-to-model binding lives (user level, per runtime).
