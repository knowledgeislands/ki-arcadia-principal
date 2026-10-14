# Decisions

## Decision 1 (2026-10-14T20:20:49Z)

- Kris, 2026-10-14: re-bootstrap under current ki-pmo and ki-delegation; take a new mark; commit everything the thread does or oversees by explicit path; at each mark delete answered and homed reports from +/_THREADS/baseline-rollout/; heartbeat at least every 5 minutes while dispatched work runs, none at rest; leave ki-principal changes uncommitted until the scoped gate (ki repo audit --staged) lands, never --no-verify, then commit through a private index by explicit path at the next mark.

## Decision 2 (2026-10-14T20:28:23Z)

- Kris, 2026-10-14: we are getting close to our token limits and we have already hit the limit on fable. try to prioritise work that is more mechanical and on a lower model level to optimise what we have left until a reset.

## Decision 3 (2026-10-14T21:07:30Z)

- Kris, 2026-10-14, BASELINE-NEXT: Rest the thread and keep the pin-receiver idea parked in the baseline-rollout Project note until I revive it.

## Decision 4 (2026-10-14T21:07:30Z)

- Kris, 2026-10-14, PRFLOW: Keep background agents pushing to ki-agentic-harness main through the ruleset's admin bypass; no change to the ki-delegation push rule.

## Decision 5 (2026-10-14T21:20:47Z)

- Kris, 2026-10-14: I can't stress this enough and I'll be saying this to every single thread, but it's absolutely imperative that you commit your work.

## Decision 6 (2026-10-14T22:24:43Z)

- Kris, 2026-10-14, COMMIT-GATE: Launch one lightest-model background agent to fix the frontmatter in the two reports and the STREAM-9 record list, each committed by explicit path, then commit and push this thread's checkpoint and decisions log. I may well have already dealt with this, so it might be okay. Also, I've got a question outstanding about the use of threads and the excessive amount of check-ins in the area.

## Decision 7 (2026-10-14T23:00:42Z)

- Kris, 2026-10-15, GATE-FOLLOW: Launch one lightest-model background agent to fix and commit +/_THREADS/baseline-rollout/gate-clear.report.md, and to commit Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md by explicit path only if its diff is just the STREAM-9 record-list removal, otherwise leave it and report why.

## Decision 8 (2026-10-14T23:00:42Z)

- Kris, 2026-10-15, GATE-REMAIN: Send the state-of-play thread a message asking it to route the rig.mac-studio-bootstrap and knowledge-islands-model.observatory checkpoint failures and the two tools-burndown report Markdown failures to their owning threads.

## Decision 9 (2026-10-14T23:00:43Z)

- Kris, 2026-10-15, THREADS-CHECKINS: Pass my question about the use of threads and the excessive check-ins to the state-of-play thread as a parked item. For the two items that need to get passed to state of play, if you want to give me a prompt, I'll paste it to it directly.

## Decision 10 (2026-10-14T23:02:37Z)

- Kris, 2026-10-15: 'That prompt has been passed.' GATE-REMAIN and THREADS-CHECKINS handed to the state-of-play thread; nothing further held here.
