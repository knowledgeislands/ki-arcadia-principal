---
note_type: streams/project
slug: ai-observability
title: AI observability
outcome: Kris decides how AI-tooling use, token use above all, is measured and attributed per run, per thread and per account, OTLP included, and the decision is routed to its durable owner.
initiative: platform-foundations
lifecycle: planned
lead: Kris Brown
target: null
updated: 2026-10-14T23:30:00Z
author: Written with Claude
---

# AI observability

## Outcome

Decide how the estate gets metrics out of its use of AI tooling: how token use is measured and attributed per run, per thread and per account, OTLP included. `ki-tokenomics` keeps budget and model-purpose policy, [[command-centre|Command centre]] shows the result and [[ways-of-working]] acts on it. The test: Kris has decided, and the decision has a durable home and any delivery records an owning repository.

This Project sits in [[platform-foundations|Platform foundations]]. Kris opened it on 2026-10-14 as a planned Project whose Outcome is a decision, with no thread yet: "Open host-network under Rig and ai-observability under Platform foundations, both planned with a decision as their Outcome".

---

## Notes

- **Idea for evaluation, 2026-10-14: AI-tooling observability (OTLP), with token economics.** Moved here from the [[platform-foundations|Platform foundations]] Initiative Notes when this Project opened. Kris: OTLP is "about us getting metrics out of use of AI tooling", and should be its own Project under Platform foundations (observability); and "we also need to think about token economics as part of it." Ideas to evaluate: one OpenTelemetry Collector per host on loopback (`127.0.0.1:4318`, OTLP over HTTP) writing under `~/.local/state/ki/telemetry/`, read by an Observatory Instrument; emitters from Claude Code, Codex and `ki agent` (a span per run), plus `rig` results; measuring and attributing token use per run, per thread and per account - tokens, cost labelled `~`, model actually used and stop reason - with account windows read from claude-swap and CodexBar and Headroom's statistics as a cross-check only; `ki-tokenomics` keeps budget and model-purpose policy. Local-first, so it stays outside the Techne Programme Hold until cross-host aggregation reaches `vega`; any cross-host forwarder is a tailnet-only listener and connection-critical. Showing it belongs to [[command-centre]] and acting on it to [[ways-of-working]]. Evidence: [sync-telemetry](<../../+/_THREADS/state-of-play/sync-telemetry.report.md>) stage 2 and [areas-tokens](<../../+/_THREADS/state-of-play/areas-tokens.report.md>).
- **Known World part, 2026-10-15.** On 15 October Kris placed the foundations model in [[Known World]] and gave this Project its part: measuring token use per run, per thread, per territory and per account; `ki-tokenomics` keeps the policy. It depends on nothing new.
