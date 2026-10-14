# Roadmap sizing and burn-down history

**Owner:** Kris Brown - **Design:** [[design|Change management]] - **Date:** 2026-10-14

This is the one design record Kris asked for on roadmap sizing and burn-down history. It is design only. It creates no roadmap record, and under the burn-down focus none is captured until the current Next records close. Paths follow the folder's convention: relative to `~/workspaces/knowledge-islands/`, with `skills/` meaning `ki-agentic-harness/skills/`. Facts were read on 2026-10-14 at `tools-ki` revision `7e3c05f` and `ki-agentic-harness` revision `e10ff14c`.

## Direction

Kris's direction, relayed through the master thread's state-of-play and recorded in the ways-of-working run, verbatim:

> ROADMAP-SIZING, Kris agreed: capture ONE design record in your change-management design for roadmap sizing and burn-down history. Direction: (a) first, a daily ki snapshot appending one JSONL line per repository (date, count by state, later points by state) to a tracked file, repairable from Git history at any commit, charted in Observatory; (b) then a size field in Fibonacci points 1-13 set at plan time, measuring Kris's attention (review, decisions, risk) rather than agent effort, split above 8, triage unsized; (c) then ID allocation moved out of the roadmap notes file's front matter and body into one ki-owned per-area allocation file checked against Git history so pruned IDs never recur. Ownership: ki-work-roadmap defines fields, tools-ki does allocation and snapshots, Observatory charts. Burn-down focus (Decision 158) still applies: design now, build after the current Next records close.

The burn-down focus it cites is Kris's standing rule, also verbatim: "the roadmap has grown about 50% since last measured. Standing focus: burn it down. Create no new feature records and do not widen scope; capture only blockers, defects or items Kris asks for, and prefer closing, merging or rejecting existing records."

## The problem

- **No history.** `ki repo roadmap list` reports the roadmap as it is now, and its statistics (`tools-ki/src/core/work/statistics.ts`) give item count, active count, ages and staleness at one instant. "Grown about 50% since last measured" rests on memory, because nothing records the count on any earlier day. The Observatory retains per-subject signal digests for comparison, not roadmap counts, and its decision PDR-KI-OBSERVA-004 makes a retained observation "a comparison base, never the current reading", so it is not the place for a durable series either.
- **No size.** Every record weighs the same in a count. A one-line fix and a design review that needs three of Kris's decisions both count as one, so a count cannot say how much of Kris's attention the roadmap holds, which is the scarce resource.
- **Allocation by hand in a notes file.** `Streams/Roadmap/_ISSUES.md` (or `docs/roadmap/_ISSUES.md` in a project repository) holds the high-water marks twice: as an `areas` map in the front matter and again as prose bullets in the body ("`GOV` reserves through `033`"). Agents advance both by hand before writing a record. The roadmap standard forbids reusing a pruned number, but nothing checks the ledger against Git history, so a lowered or re-scaffolded ledger would silently reissue a pruned identifier.

## Established facts

- The work-item format (`skills/change-management/ki-work-roadmap/references/standards-work-item-format.md`) defines `status` as `triage`, `draft`, `ready`, `in-progress`, `awaiting-review`, `done` or `cancelled`, and `horizon` as `now`, `next`, `soon`, `future` or `hold`, present only on adopted open records. It has no size or estimate field.
- The repository roadmap standard (`.../standards-repository-roadmaps.md`) makes `_ISSUES.md` "the canonical durable allocation ledger", requires the ledger advance to be committed on its own before the record is written, and serialises every roadmap write through one designated checkout per repository. CONFORM scaffolds a missing ledger "from the highest retained issue number", which is exactly the figure that forgets pruned records.
- `tools-ki` already reads a roadmap at any commit: `readWorkItemsAtCommit` in `tools-ki/src/core/work/history.ts` lists the roadmap tree at a commit and parses each record, and `ki batch` uses it. The snapshot's repair path is this function in a loop over dates.
- `ki repo roadmap list --format json` is the versioned machine-readable contract the Observatory's Roadmap instrument reads through `observeRoadmap`. The Observatory's README draws the boundary: `tools-ki` owns "roadmap and trade semantics, and stable machine-readable command contracts"; the Observatory owns "observation history, interactive visualisation".
- This island's ledger reads `areas: { ECO: 14, EXT: 3, GOV: 33, MOD: 8, OPS: 13 }` against seven retained records, so most issued identifiers have already been pruned. Any future ledger repair that reads only retained records would reissue them.

## Design

### (a) Daily snapshot and burn-down history

**What is written.** A `ki` command, proposed as `ki repo roadmap snapshot`, appends one JSON line per repository per day to a tracked file in that repository's roadmap directory, beside `_ISSUES.md`. The line carries the date, the commit whose roadmap tree was counted, and one cell per `(status, horizon)` pair that holds at least one record. Each cell carries three figures: `records`, the count of records in the pair; `points`, the sum of `size` over the sized records in the pair; and `unsized`, the count of records in the pair with no `size`. Kris settled the shape under `SNAPSHOT-DIMENSIONS` below: "record the counts as well as the weighted counts based on their sizing by a tuple, which is status and horizon". Proposed shape, one line, shown wrapped:

```json
{"date":"2026-10-14","repository":"ki-principal","commit":"4f26207","cells":[
 {"status":"triage","horizon":null,"records":2,"points":0,"unsized":2},
 {"status":"draft","horizon":"next","records":2,"points":5,"unsized":1},
 {"status":"draft","horizon":"soon","records":1,"points":0,"unsized":1},
 {"status":"ready","horizon":"now","records":1,"points":5,"unsized":0},
 {"status":"in-progress","horizon":"next","records":1,"points":3,"unsized":0},
 {"status":"done","horizon":null,"records":4,"points":11,"unsized":1}]}
```

**Reading the line.** A pair absent from `cells` holds no records. `horizon` is `null` where the work-item format carries no horizon: `triage`, `done` and `cancelled`. Because the cell is keyed by the pair, a reader projects the line onto whichever axis it wants by summing cells: totals by `status` alone, by `horizon` alone, or by the pair itself, as Kris put it, "in the future, we can choose when we read it to only look at status or only look at horizon or look at the combination of those two". The line never carries the two one-axis maps separately; they are derived on read and cannot disagree with the cells.

**Unsized records in the points figure.** `points` sums only the records that carry `size`; an unsized record adds nothing to `points` and is counted in `unsized` instead. No default or imputed weight is applied, because an unsized record is by definition one whose weight on Kris's attention has not been judged, and `triage` records are unsized by rule under (b). A reader therefore treats `points` as a floor and `unsized` as the width of the gap; a cell with `unsized` equal to `records` has no attention weight at all. The three figures are always present, before and after (b) ships, so the line shape never changes.

**Back-filled history before sizes existed.** A line repaired or back-filled from a commit older than the `size` field shows `points` of `0` and `unsized` equal to `records` in every cell, which is the truth of that tree: no record was sized. Observatory does not chart that as a zero-point roadmap. The points view starts at the first date on which any cell has `points` above `0`, and earlier dates show no points series at all; the records view runs over the whole series. The file is append-only and chronological, with at most one line per date. A second run on the same day replaces that day's line rather than adding one, so a scheduler retry is harmless.

**Why a tracked file.** The series is a governed record, not an observation: it is committed, reviewable, diffable and survives any loss of a state folder or Observatory database. The snapshot commit touches only this file, so the daily commit is a `chore(roadmap)` with nothing else in it, and it goes through the designated roadmap checkout like every other roadmap write.

**Repairable from Git history.** Every line is a pure function of a commit's roadmap tree, so a missing or doubted line can be recomputed. `ki repo roadmap snapshot --repair --since <date>` finds, for each missing date, the last commit on the designated branch before that date's cutoff, counts its roadmap tree with `readWorkItemsAtCommit`, and inserts the line. A repaired line carries `"repaired": true`, so the series never claims to have been observed on a day it was reconstructed. This also means the series can be back-filled to the first commit of each roadmap on the day the command ships, which gives the "grown about 50%" claim a chart from the first run.

**Read contract.** `ki repo roadmap history --format json` returns the series for the selected repository, territory or estate as versioned JSON. The Observatory reads that, not the file, keeping the product boundary the README draws.

**Charted in Observatory.** The Roadmap instrument gains a burn-down view: a stacked area of open records by `status` over time, with `done` and `cancelled` shown as the burned band, for the selected scope and per repository within it. When points arrive, the same view switches between records and points. Repaired lines are visually distinguished. Under PDR-KI-OBSERVA-004 the series is a governed record, so this is a live read of an authoritative file, not a comparison against a retained observation.

**Scheduling.** One daily run per workstation over the registered estate: snapshot each repository, commit, pull with rebase and push fast-forward, and report any repository where the push was not fast-forward or the checkout was dirty under the roadmap directory. Its definition is an Activity note in this island, as `ki-repo-kb-activities` requires for adopted automation; the runner is under `SNAPSHOT-SCHEDULE` below.

### (b) Size field

**Definition.** `ki-work-roadmap` adds `size` to the work-item frontmatter: an integer from the Fibonacci set `1, 2, 3, 5, 8, 13`. It measures Kris's attention, which the direction defines as "review, decisions, risk", and explicitly not agent effort: a long agent run that ends in a one-line approval is a `1`; a short change that needs three owner decisions and carries connection risk is an `8`. A rubric in the standard anchors the scale:

| Points | Kris's attention |
| --- | --- |
| 1 | A glance and an approval; no decision; no risk |
| 2 | A short review; no decision |
| 3 | A review with one decision |
| 5 | A design read or several decisions |
| 8 | Sustained review, several decisions, or a risk Kris must carry (connectivity, data, publication) |
| 13 | More than 8: the record must be split before it can become ready |

**When it is set.** At plan time, by `ki-plan`, as the record moves from `draft` towards `ready`. A `triage` record is unsized, and the audit rejects `size` on it, so capture never pretends to know the weight. `ready` requires `size`. `13` is allowed only on a `draft`, as the marker of a record that is too large; the ready gate fails on it until the record is split and each part sized at `8` or below. A record may be re-sized only when it is re-planned, and the change is noted in its Discussion, so the series does not drift silently.

**Audit.** `ki repo audit --skill ki-work-roadmap` checks the value is in the set, absent on `triage`, present on `ready` and later, and not `13` beyond `draft`. `ki-plan` asks for the size as a planning step; `ki-batch` reports the points in its envelope.

**What the points buy.** The `points` figure in each snapshot cell gives a burn-down in Kris's attention rather than record count; `done` points per week is a velocity of attention actually spent, and open points at `now` and `next` is the attention currently committed. The Observatory's Beacon can rank a repository whose open points rise while its done points stay flat.

### (c) ID allocation from a ki-owned file checked against history

**Today.** `_ISSUES.md` holds the high-water marks in front matter and body, maintained by hand. The reservation protocol is sound but depends on an agent editing Markdown correctly, twice, in the right order.

**Design.** Allocation moves into one `ki`-owned file per repository in the roadmap directory, holding every area's high-water mark (or `last_id` in repository-wide mode), written only by `ki`. Proposed as `_ALLOCATION.toml`, under `ALLOCATION-FORMAT` below:

```toml
# Written by ki. Do not edit by hand.
[areas]
ECO = 14
EXT = 3
GOV = 33
MOD = 8
OPS = 13
```

`ki repo roadmap allocate --area GOV` (or without `--area` in repository-wide mode) performs the reservation: it reads the file, scans Git history for every identifier ever used in that area, takes one above the greater of the two, writes the file, commits the advance on its own in the designated checkout, and prints the identifier. The record is written afterwards, as the standard already orders. `ki-next` calls it instead of editing a ledger, and no skill edits the file by hand.

**Checked against Git history.** The history scan lists every file ever added under the roadmap directory (`git log --diff-filter=A --name-only` over the designated branch and its remote) and parses identifiers from the filenames with the shared `work-identifiers` grammar. Pruned records appear there as added-then-deleted files, so a pruned number is always found even when no retained record carries it. `ki repo audit` fails when the file's mark is below the history's for any area, and `ki repo conform --repair` raises it to the history's value; neither ever lowers a mark. Scaffolding a missing file therefore starts from history, not from retained records, which closes the gap CONFORM has today.

**Migration.** The standard changes so that `_ALLOCATION.toml` is the canonical ledger and `_ISSUES.md` is retired. CONFORM creates the new file from the greater of the old ledger and history, then removes the old ledger in the same commit once they agree; the KB container skill `ki-repo-kb-streams` and the Streams exemplar update their mention of `_ISSUES.md`. Structural validity already skips non-record files, and a TOML file is not a Markdown record, so no new exemption is needed.

## Ownership and hand-offs

| Unit | Owner | Delivers |
| --- | --- | --- |
| Field and ledger definition | `ki-work-roadmap` (KI Agentic Harness) | `size` in the work-item format with its rubric and gates; `_ALLOCATION.toml` as the canonical ledger; the history-checked reservation rule; audit and conform criteria; snapshot file shape as a standard |
| Allocation and snapshots | `tools-ki` | `ki repo roadmap allocate`, `snapshot`, `snapshot --repair`, `history --format json`; the history scan; the ready-gate check for `size` |
| Charts | Observatory | Burn-down view in the Roadmap instrument, records and points, with repaired lines distinguished; a Beacon signal on rising open points |
| Schedule | This island | The daily snapshot Activity note and its runner |

Each repository plans and delivers its own part under its own authority; this record is the shared design they cite.

## Sequence and the burn-down focus

The direction orders the parts: (a) first, then (b), then (c). (a) is independent and gives the measurement that the burn-down focus lacks today, back-filled from history on day one. (b) depends on (a) only for the `points` figure in each cell, and on `ki-plan` for the gate. (c) is independent of both and can follow when the Next records close.

Nothing is built now. Kris's words: "design now, build after the current Next records close." When they close, the master thread captures the delivery records, one per owning repository, each citing this record and sized under (b) once the field exists. Until then no roadmap record exists for any of this.

## Settled questions

Kris settled every question on 2026-10-14 with two answers, both verbatim: "SIZING - all recommended" and "SNAPSHOT-DIMENSIONS - (b). Then I think it's clear that we should record the counts as well as the weighted counts based on their sizing by a tuple, which is status and horizon, and therefore, in the future, we can choose when we read it to only look at status or only look at horizon or look at the combination of those two." The first answer adopts the recommendation on each question below; the second refines `SNAPSHOT-DIMENSIONS` as recorded there. Each item keeps its recommendation for the record and states what was settled.

1. **`SNAPSHOT-HOME`** - One file per repository beside the ledger, or one estate file in this island with a line per repository? Recommendation: per repository, as `_HISTORY.jsonl` beside `_ISSUES.md`. Each repository's series is then repairable from its own history alone, and `ki repo roadmap history` aggregates across a territory or the estate on read. **Settled:** as recommended, under "SIZING - all recommended".
2. **`SNAPSHOT-DATE`** - Which calendar day does a line belong to? Recommendation: the UTC date, with the repair cutoff at the end of that UTC day, so the series is the same from any machine and timezone. The Observatory displays local time. **Settled:** as recommended, under "SIZING - all recommended".
3. **`SNAPSHOT-DIMENSIONS`** - Counts by `status` only, as directed, or also by `horizon`? Recommendation: both from the first line. `horizon` is the queue position and costs one small map; adding it later would leave the back-filled series without it. **Settled:** "(b)", the second option, both dimensions, refined to a single keyed cell rather than two maps: "record the counts as well as the weighted counts based on their sizing by a tuple, which is status and horizon, and therefore, in the future, we can choose when we read it to only look at status or only look at horizon or look at the combination of those two." The line shape under "What is written" above records this; the earlier two-map shape is withdrawn.
4. **`SNAPSHOT-SCHEDULE`** - What runs the daily snapshot? Recommendation: one scheduled job on Kris's workstation under Rig, running `ki` over the registered estate and pushing fast-forward, declared as an Activity note in this island. It needs no remote agent and stays within the Techne programme hold. **Settled:** as recommended, under "SIZING - all recommended".
5. **`SIZE-GATE`** - Where is `size` required? Recommendation: forbidden on `triage`, optional on `draft`, required for `ready`, with `13` allowed only on `draft` as the split marker. **Settled:** as recommended, under "SIZING - all recommended".
6. **`SIZE-RESIZE`** - May a size change after `ready`? Recommendation: only on re-plan, noted in the record's Discussion, so velocity is read against the size Kris agreed to when the work was shaped. **Settled:** as recommended, under "SIZING - all recommended".
7. **`ALLOCATION-FORMAT`** - TOML or JSON, and the name? Recommendation: `_ALLOCATION.toml`, matching `.ki.toml` and the `ki-authoring` preference for TOML configuration, with a one-line "written by ki" comment. **Settled:** as recommended, under "SIZING - all recommended".
8. **`LEDGER-RETIREMENT`** - Keep `_ISSUES.md` as human-readable prose or remove it? Recommendation: remove it once a repository is migrated, and let `ki repo roadmap allocation` print the table; two copies of one number is the defect being fixed. **Settled:** as recommended, under "SIZING - all recommended".
9. **`HISTORY-SCOPE`** - Which refs does the allocation check scan? Recommendation: the designated branch and its remote-tracking ref, because the standard already requires every roadmap write to land there; scanning every local ref would honour identifiers from abandoned branches that never reserved a number. **Settled:** as recommended, under "SIZING - all recommended".

No question remains open. Delivery records, when the Next records close, cite the settled answers here.
