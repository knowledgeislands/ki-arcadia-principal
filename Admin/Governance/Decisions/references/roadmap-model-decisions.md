# Roadmap model - Kris's decisions (2026-10-07)

Kris read [roadmap-model.md](roadmap-model.md) and agrees with everything in it unless stated below. Together, roadmap-model.md and this file are the specification for the rollout.

1. **Section 7.** All eight recommendations are accepted (option A in each case):
   - triage becomes a status, plus `cancelled` with `resolution`;
   - `hold` becomes a horizon, and its timing is re-decided on release;
   - `kind` takes the values deliver, decide, investigate, audit;
   - `purpose` is optional and `artifact` is dropped;
   - upkeep work has no project and names its `initiative` directly;
   - the registry is project notes in Arcadia `Streams/Projects/` with an Initiatives index;
   - ideas and enactment: the stricter capture test applies now, and test (c) is offered to KI-ARCADIA-GOV-024;
   - migration covers open records, starts with a pilot in three repositories, and the new rules are enforced only after coverage is complete;
   - `area` keeps its name.
2. **No schema version bump.** Everything stays v1. The new fields and states enter v1 directly. During migration the checker tolerates the old values (`theme`, the waiting-for and parked horizons, triage as a horizon), then rejects them once coverage is complete.
3. **Recurring work is part of the model.** Activities and ki-work-housekeeping templates (for example in Arcadia `Admin/Operations/Activities/`) declare `initiative`, and optionally `component` and `purpose`. Each run they spawn inherits those values, takes `kind: audit` (or whatever the template sets) and has no project. Rig / workstation hygiene is therefore an initiative made up of upkeep records and recurring runs.
4. **Checkpoints stop being theme homes.** Each Project note takes over its theme checkpoint: outcome, health, update narrative and Ideas section. The theme checkpoints are folded into project notes and removed. state-of-play becomes the Initiatives review. ki-checkpoint remains only for ephemeral thread reconstruction. Durable knowledge still goes to Pillars and Decision Records.
5. **"project" also names a repository type** (`repo_type = "project"`, `ki-repo-project`). The two live in different namespaces: record frontmatter and `.ki.toml`. Keep both for now. In prose, write "project repository" for the repository shape and "Project" for the territory registry entry. A rename of the repository type is a possible later record, not part of this rollout.
6. **Authority to carry the rollout through (Kris, 7 October 2026):** "you can just carry it all the way through, this is a really good example of thought out work." This grants outcome authority for the whole rollout, every phase, with `completion_target: done`. Each record may be closed once its review evidence has been rechecked: through ki-batch consolidated closure, or ki-accept quoting this grant. The four duplicate closures may close under the new `cancelled` and `resolution` path. Kris then added: "push everything needed to done related to this", so pushing the commits this rollout makes is also authorised (fast-forward only; never force, never push unrelated work). Pruning is covered only for records this rollout itself closes, and only after their done state is committed.
7. **Migration proposals (Kris, 7 October 2026): "all as recommended".** Every recommendation in migration-unclear.md is accepted:
   - a new Project `roadmap-model` under platform-foundations, holding KI-HARNESS-GOV-149 and GOV-150, KI-TOOL-CLI-112 and KI-ARCADIA-GOV-026, finished when the checker enforces;
   - UE-020 goes to agent-host;
   - UE-043 goes on hold, reviewed 2027-01-07;
   - UE-062 belongs to rig;
   - UE-065's hold condition becomes "Kris schedules the approved trace", reviewed 2026-11-07;
   - FND-014 belongs to platform-foundations;
   - OPS-003 is parked, reviewed 2027-01-07;
   - RTP-002 is cancelled as obsolete;
   - EXT-003 and OPS-007 are `investigate`;
   - Briefings Activity belongs to knowledge-islands-model;
   - HK-003 and HK-005 belong to platform-foundations;
   - the proposed component vocabularies are adopted.
8. **Initiatives get their own folder.** Use `Streams/Initiatives/`, with an `Initiatives.md` index and one note per Initiative (platform-foundations, techne, knowledge-islands-model, rig), as a sibling of `Streams/Projects/`. Each Initiative note holds its direction, its Projects, its projectless upkeep records, its recurring Activities, and a review section; the state-of-play review becomes that review. `Streams/Projects/Initiatives.md` goes. The harness schema and checker recognise both folders.
9. **Kris, 7 October 2026 (afternoon):**
   - Cross-territory Project references are approved, so a record may name another territory's Project (for example `knowledgeislands/agent-host`), resolved through the local registry.
   - The optional reviews are waived; keep going.
   - The Techné thread is paused, so migrate ki-techne-harness and tools-techne.
   - Do the remaining steps ASAP: enforcement, then pruning the records this rollout closed.
   - A tools-ki release and the Homebrew tap update are authorised, following tools-ki docs/guides/developer/releasing.md.
   - An empty component vocabulary rejects any `component` value; confirmed.
10. **Kris, 7 October 2026:**
    - The design loop (KI-HARNESS-GOV-152) is approved as planned, provided its activation is clear: how Kris invokes it, and what triggers it. Implement it and close it.
    - Sweep all skills for conflicts with the v1 model and consolidate them. This covers ki-checkpoint's narrowed role (decision 4), the trades `waiting_on_trades` to `hold.trades` change, and stale waiting-for, parked and theme wording.
    - Area codes keep their meaning in a definition. Make sure every fixed-area repository defines each of its areas somewhere the standard names.
11. **Kris, 7 October 2026 (baseline push):**
    - **Design loop first:** it defines how Projects and Initiatives move forward, so KI-HARNESS-GOV-152 lands now.
    - **ki-checkpoint:** it stays close to its original scope. Project and Initiative notes supplement it; they do not replace it.
    - **Area codes become a map** from code to title (for example `GOV = "Governance and operating model"`), enforced so that the checks are mechanical. A bare list of codes is a legacy form.
    - **Trades are on hold:** send no new trades. Do the work directly, or record it in the receiving repository. Revisit trades once the territory model is settled; another thread is defining Agoras and Territories.
    - **Done records:** prune every one across the estate now instead of migrating it. The routine prune review returns once the baseline is set.
    - **No new records for minor rollout changes:** commit baseline work directly, with clear messages.
    - **KI-TECHNE-TOOLS-OPS-012:** fix its missing `baseline_ref`.
    - **Cite full roadmap identifiers** from now on.
    - **Ignore** the Linear, TickTick and other connectors in this thread.
    - **tools-ki:** Kris pushed everything, including 34f8b7d. Release it.
