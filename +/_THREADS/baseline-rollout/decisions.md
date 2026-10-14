# Decisions

## Decision 1 (2026-10-14T20:20:49Z)

- Kris, 2026-10-14: re-bootstrap under current ki-pmo and ki-delegation; take a new mark; commit everything the thread does or oversees by explicit path; at each mark delete answered and homed reports from +/_THREADS/baseline-rollout/; heartbeat at least every 5 minutes while dispatched work runs, none at rest; leave ki-principal changes uncommitted until the scoped gate (ki repo audit --staged) lands, never --no-verify, then commit through a private index by explicit path at the next mark.

## Decision 2 (2026-10-14T20:28:23Z)

- Kris, 2026-10-14: we are getting close to our token limits and we have already hit the limit on fable. try to prioritise work that is more mechanical and on a lower model level to optimise what we have left until a reset.

## Decision 3 (2026-10-14T21:07:30Z)

- Kris, 2026-10-14, BASELINE-NEXT: Rest the thread and keep the pin-receiver idea parked in the baseline-rollout Project note until I revive it.

## Decision 4 (2026-10-14T21:07:30Z)

- Kris, 2026-10-14, PRFLOW: Keep background agents pushing to ki-agentic-harness main through the ruleset's admin bypass; no change to the ki-delegation push rule.
