---
note_type: streams/initiative
slug: platform-foundations
title: Platform foundations
direction: Keep a solid, shared base under every island - the `ki` toolchain, the harness standards and a clearly owned estate.
lifecycle: active
lead: Kris Brown
updated: 2026-10-14T21:02:00Z
author: Written with Claude
---

# Platform Foundations

## Direction

The shared base every island stands on: the `ki` toolchain and its baseline, the harness standards and rubrics, the roadmap model, and the factorisation of the estate into clearly owned repositories. It covers how work is recorded, checked and released across the territory. Agent hosting and the agent fleet belong to [[Initiatives/techne|Techne]]; the workstation itself belongs to [[rig|Rig]]; what an island is belongs to the [[knowledge-islands-model|Knowledge Islands model]].

---

## Notes

- **Projectless upkeep.** Standards upkeep keeps the harness standards, rubrics and `ki` tooling accurate and never finishes, so its records name this Initiative directly. It is mostly harness standard and audit refinements and `tools-ki` roadmap and rubric fixes, plus the harness's recurring housekeeping reviews.
- **Recurring work.** This Initiative is the home of the estate's recurring engineering upkeep: each repository's regular review, which includes consolidating its Decision Records, and the harness housekeeping reviews of engineering alignment, knowledge reconciliation and the weekly model and agentic radars. Each recurring definition names this Initiative, which never completes, so the work needs no Project.
- The roadmap model and its refinements are recorded in [[GDR-KI-PRINCIPAL-005-the-roadmap-model|GDR-KI-PRINCIPAL-005]].
- **Idea for evaluation, 2026-10-14: AI-tooling observability (OTLP), with token economics.** Kris: OTLP is "about us getting metrics out of use of AI tooling", and should be its own Project under Platform foundations (observability); and "we also need to think about token economics as part of it." Held here until Kris answers the open query NEW-AREAS on opening an evaluation-stage `ai-observability` Project. Ideas to evaluate: one OpenTelemetry Collector per host on loopback (`127.0.0.1:4318`, OTLP over HTTP) writing under `~/.local/state/ki/telemetry/`, read by an Observatory Instrument; emitters from Claude Code, Codex and `ki agent` (a span per run), plus `rig` results; measuring and attributing token use per run, per thread and per account - tokens, cost labelled `~`, model actually used and stop reason - with account windows read from claude-swap and CodexBar and Headroom's statistics as a cross-check only; `ki-tokenomics` keeps budget and model-purpose policy. Local-first, so it stays outside the Techne Programme Hold until cross-host aggregation reaches `vega`; any cross-host forwarder is a tailnet-only listener and connection-critical. Showing it belongs to [[command-centre]] and acting on it to [[ways-of-working]]. Evidence: [sync-telemetry](<../../+/_THREADS/state-of-play/sync-telemetry.report.md>) stage 2 and [areas-tokens](<../../+/_THREADS/state-of-play/areas-tokens.report.md>).
