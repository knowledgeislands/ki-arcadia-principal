---
note_type: streams/project
slug: host-network
title: Host network
outcome: Kris decides how hosts and services are set up and addressed on the tailnet - naming, name URLs, ACLs and tailnet-only listeners - and the decision is routed to its durable owner.
initiative: rig
lifecycle: planned
lead: Kris Brown
target: null
updated: 2026-10-17T00:26:00Z
author: Written with Claude
---

# Host network

## Outcome

Decide how hosts and services are set up and addressed on the tailnet across `terra`, `sol` and `vega`: names for hosts and services, name URLs rather than IP and port, tailnet ACLs, and tailnet-only listeners. The tailnet is the VPN substrate, not the interaction mechanism. The test: Kris has decided, and the decision has a durable home and any delivery records an owning repository. Every change it leads to is connection-critical and needs a rollout plan with a tested restore path that reconnects first.

This Project sits in [[rig|Rig]]. Kris opened it on 2026-10-14 as a planned Project whose Outcome is a decision, with no thread yet: "Open host-network under Rig and ai-observability under Platform foundations, both planned with a decision as their Outcome".

---

## Notes

- **Idea for evaluation, 2026-10-14: setting up and addressing hosts on the tailnet.** Moved here from the [[rig|Rig]] Initiative Notes when this Project opened. Kris: host-network setup "needs its own thought", and the tailnet is the VPN substrate, not the interaction mechanism. It spans `terra`, `sol` and `vega`, so it fits neither [[mac-studio-setup|Mac Studio setup]] nor [[agent-host|Agent host]]. Ideas to evaluate: naming hosts and services, with name URLs rather than IP and port; tailnet ACLs; tailnet-only listeners following the tailnet-only listener pattern in `tools-rig`; and the host and service naming scheme Paperclip is waiting for. Every change here is connection-critical and needs a rollout plan with a tested restore path that reconnects first. When Mac Studio bootstrap closes, its `hosts.md` would move here. Evidence: [areas-proposal](<../../+/_THREADS/state-of-play/areas-proposal.report.md>) and [sync-telemetry](<../../+/_THREADS/state-of-play/sync-telemetry.report.md>).
- **Territory-to-host primacy.** On 14 October Kris set a territory-to-host primacy: each territory primarily used and maintained on one host, with all eight territories still checked out on both `terra` and `sol`; in Kris's words of 14 October 2026 in the state-of-play decisions log, "a given territory is primarily used or interacted with by a given host" and "both Terra and Sol should have all eight territories checked out on them in Git". It is pending the foundations-coherence review.
- **Handoff from [[island-model-and-tending|Island model and Tending]].** Territory addressing stays there as a model question; the tailnet and DNS work it leads to comes here later as a handoff.
- **Known World part, 2026-10-15.** On 15 October Kris placed the foundations model in [[Known World]] and gave this Project its part: turning addresses into names, with tailnet naming, seat resolution and failover, and tailnet-only listeners; every change is connection-critical. It depends on the address scheme held in [[island-model-and-tending|Island model and Tending]].
- **Seat host binding, 2026-10-15.** Kris bound the two seat roles of [[ADR-KI-PRINCIPAL-007-territory-seats-on-hosts|ADR-KI-PRINCIPAL-007]] to hosts: the home role is `terra`, the laptop, and the hub role is `sol`, the Mac Studio. So `terra` is the seat of humans-not-robots; `sol` is the seat of valle-armonia, sacred-inquiry, techmedix and equal-remedy; knowledge-islands, personal and legal are seated on both, tipped to `sol`. The [[Known Lands]] Seat column names roles and points here for the hosts. The machine binding in host data belongs to [[chezmoi|Rig: chezmoi]], handed over as SEAT-HOSTS.
- **Seat amendment, 2026-10-17.** Kris moved personal and legal from `terra` alone to both machines, in these words: "update this so that personal and legal is both machines, tipped to sol". They are now seated as knowledge-islands is; humans-not-robots stays on `terra`. The binding above, [[Known Lands]] and [[ADR-KI-PRINCIPAL-007-territory-seats-on-hosts|ADR-KI-PRINCIPAL-007]] read accordingly, and [[chezmoi|Rig: chezmoi]] carries the change into host data under SEAT-HOSTS.
- **LOCAL-DNS, 2026-10-17.** Captured from Kris's intake, no design: "I want every one of my hosts to have an observatory. I actually prefer not to hit 127.0.0.1 and the port number. I'd rather hit observatory.whatever it is locally ... it'd be nice if I could use observatory.midnight.ninja, but that's never ever public, it's only internal, or it could be observatory.local.midnight.ninja ... setting that up sooner rather than later would be really interesting." Every change here is connection-critical, tools-rig's tailnet-only listener firewall record being the pattern; whether `midnight.ninja` is the personal identity domain belongs to the personal territory; when this Project gets a thread waits on Kris's HOST-NETWORK-THREAD. Detail: [themes.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_THREADS/state-of-play/themes.md).
- **Thread opening, 2026-10-17.** Kris answered HOST-NETWORK-THREAD: "Open the Host network thread fifth in the restart order, after tools burndown and the two Rig threads, with a decision paper on tailnet service names and a tested restore path as its first step; LOCAL-DNS stays captured in the Project's Notes until then." The thread's first step is that decision paper, with a tested restore path; Headroom's icon is to be revisited once own DNS exists, as Kris put it under FAVICON-FOLLOWUPS: "maybe we can sort that out when we have our own DNS".
