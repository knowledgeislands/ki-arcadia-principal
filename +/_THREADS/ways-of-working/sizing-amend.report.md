# Owner report - sizing-amend (ways-of-working thread)

## Done

- Amended the design record [roadmap-sizing-and-burn-down](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/roadmap-sizing-and-burn-down.md) with Kris's answers. Design only; no roadmap record created, no `Admin`, `Pillars`, `Resources` or checkpoint touched.
- Commit `17c7cc2` `docs(design): settle roadmap sizing questions with status-horizon tuple snapshot`, staged by explicit path, co-author trailer present. Pre-commit hooks passed (rumdl clean; KI repo audit PASS with two pre-existing unrelated STREAM-10 warnings on the `paperclip-bootstrap-and-recovery` and `website` Projects). `git pull --rebase` was a no-op; pushed fast-forward to `origin/main`.

### Revised daily line format

One JSON line per repository per day, in `_HISTORY.jsonl` beside the ledger. Instead of separate `status`, `horizon` and `points` maps, the line carries one cell per `(status, horizon)` pair holding at least one record, each with `records`, `points` and `unsized`:

```json
{"date":"2026-10-14","repository":"ki-principal","commit":"4f26207","cells":[
 {"status":"triage","horizon":null,"records":2,"points":0,"unsized":2},
 {"status":"draft","horizon":"next","records":2,"points":5,"unsized":1},
 {"status":"ready","horizon":"now","records":1,"points":5,"unsized":0},
 {"status":"done","horizon":null,"records":4,"points":11,"unsized":1}]}
```

- `horizon` is `null` for `triage`, `done` and `cancelled`, which carry no horizon. Readers project onto status, horizon or the pair by summing cells; the one-axis maps are never stored, so they cannot disagree.
- **Unsized records:** `points` sums only sized records; an unsized record adds nothing and is counted in `unsized`. No imputed weight. `points` is a floor and `unsized` the width of the gap. All three figures are present before and after (b) ships, so the shape never changes.
- **Back-filled history before sizes existed:** every cell shows `points` 0 and `unsized` equal to `records`. Observatory starts the points view at the first date with any `points` above 0 and shows no points series before it, rather than a false zero-point roadmap. The records view runs over the whole series.

### Settled answers (verbatim)

- Kris: "SIZING - all recommended" - adopts the recommendation on all nine questions (`SNAPSHOT-HOME`, `SNAPSHOT-DATE`, `SNAPSHOT-SCHEDULE`, `SIZE-GATE`, `SIZE-RESIZE`, `ALLOCATION-FORMAT`, `LEDGER-RETIREMENT`, `HISTORY-SCOPE`, and the first part of `SNAPSHOT-DIMENSIONS`).
- Kris: "SNAPSHOT-DIMENSIONS - (b). Then I think it's clear that we should record the counts as well as the weighted counts based on their sizing by a tuple, which is status and horizon, and therefore, in the future, we can choose when we read it to only look at status or only look at horizon or look at the combination of those two." - read as the second option (both dimensions), refined to the keyed-cell shape above; the earlier two-map shape is withdrawn in the record.

Each question in the record now ends with a **Settled** sentence quoting the answer, and the section is renamed "Settled questions" with "No question remains open."

## In progress

Nothing.

## Outstanding queries

- **Needs: DECISIONS-LOG** - The design record says Kris's answers belong in [change-management-decisions](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-decisions.md). The brief scoped this run to the design record, so no decisions-log entry was written. Should the thread owner add one quoting the two answers?
- **Needs: OPTION-B-READING** - "(b)" was read as the second option of the `SNAPSHOT-DIMENSIONS` question ("also by horizon"), consistent with the elaboration. Confirm, or correct.

```text
DECISIONS-LOG - yes, add entry | no
OPTION-B-READING - confirmed | correct to: ...
```
