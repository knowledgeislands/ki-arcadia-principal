# Thread working model — report

Commits pushed fast-forward to origin/main (f1233757..251d4b2b): 886f0ae6 (ledger reservation), a7fc3e97 (thread working rules), 251d4b2b (roadmap record). Primary checkout fast-forwarded to 251d4b2b.

Checks: `bun run test` 1066 pass / 0 fail; `bunx tsc --noEmit` clean; `ki dev skill rubric ki-delegation` in sync; `ki repo audit` PASS for ki-delegation, ki-checkpoint, ki-authoring. Fleet findings already on main, not from this change: ki-skills LONG-3 WARN (stale source review); ki-work-roadmap ITEM-1 FAIL (KI-HARNESS-GOV-168 title over four words).

**Done**

- `ki-delegation` gains "Thread working rules": parking tangents (dated one-liners under checkpoint `Open questions`, no new H2), linking records (full identifier + absolute local path via `ki registry`), and keeping primary checkouts current (ff-only, skip and report dirty/diverged). New judgment criterion RUN-4.
- `ki-checkpoint` record form notes that parked items live in `Open questions`; schema unchanged.
- Draft record [KI-HARNESS-GOV-169](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-169-roll-up-since-mark.md) "Roll up since mark" (decide, horizon soon): problem and eight open design questions only.
- Issue ledger GOV high-water advanced to 169 (it was behind the existing GOV-168).

**Needs Kris**

- Discuss the roll-up-since-a-mark design in KI-HARNESS-GOV-169.
- KI-HARNESS-GOV-168's title exceeds four words and fails the roadmap audit; rename when convenient.
