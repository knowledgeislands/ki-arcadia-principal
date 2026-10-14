# Agent-host checkpoint cleanup

## Done

- `+/_CHECKPOINTS/agent-host.md` rewritten as current state, agent host only, same frontmatter and heading set, `updated_at` 2026-10-08T15:13:00Z:
  - Claude and Codex are signed in on the host.
  - TECHNE-TOOLS-OPS-014 is delivered and `awaiting-review` (Decision 13): pin file, `rig-pins.sh`, rendered host instructions, the host marker and the 14-day expiry mark. None of it has run on the host yet.
  - Decisions run to 17. The thread rules are kept, the run name stays `techne`, and a line now says the thread covers the agent host only.
  - P13 and the `state-of-play` routing are replaced by one open question: the Mac Studio exemption is handled by KI-ARCADIA-GOV-033 in the `mac-studio-bootstrap` thread.
  - The next step lists the four ordered actions.
- `Streams/Projects/agent-host/agent-host.md`:
  - removed the "such as a Mac Studio" mention and the owned-host governance sentence;
  - the "Enactment record, awaiting Kris's review" wording, which was stale because KI-ARCADIA-GOV-031 is accepted and pruned, now says the decisions were amended;
  - the future-tense review-date line is now neutral;
  - no record identifiers were added.
- Commit: `72b7b116312d90ba0e8003ab3d3fbf2e14820ac3` (local only, explicit paths, not pushed).
- Checks:
  - `ki repo audit` passed for `ki-checkpoint`, `ki-repo-kb-streams` and `ki-repo-kb`;
  - the rumdl pre-commit hook found no issues;
  - no em- or en-dashes.

## Failed

- None.

## Needs the owner

- Sign-in on the host is recorded only on your word. The thread files still say sign-in is outstanding (`close.report.md`), and I made no remote call to check.
