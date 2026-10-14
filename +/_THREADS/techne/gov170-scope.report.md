# KI-HARNESS-GOV-170 scope widening

Commit `c9fd9594` in ki-agentic-harness (local `main`, not pushed).

Checks: `ki repo audit` PASS=30 WARN=2 FAIL=0 (7 pre-existing warnings: ki-model-radar review dates, ki-skills sources refresh; unrelated). Prettier clean. Commitlint passed with one warning (footer leading blank).

## Done

- `docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md`: Boundary now names `ki-accept`'s acceptance standard (which also allows cross-repository targets) as in scope; Goal adds "or linking to it".
- Open question settled per Decision 36(3): the "Decide…" step removed; the standards step now says a duplicate of, or merge into, another repository's work keeps its resolution with no `resolution_target`, naming the repository in plain words in `## Cancelled`, no identifier or link. Discussion records the 2026-10-10 settlement. Status stays `draft`.

## Needs the owner

- I read "a duplicate of, or merge into … is recorded" as keeping the `duplicate`/`merged` resolution without a target (not recasting as `obsolete`). Correct at planning if that is wrong; `superseded` is not mentioned by the decision and is left to the same rule by implication.
