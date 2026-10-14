---
note_type: streams/project
slug: command-centre
title: Command centre
outcome: One shared vocabulary and model for Kris's command centre, adopted across the harness, Observatory, hnr-principal and legal-principal, with one read-only state-of-play view.
initiative: knowledge-islands-model
lifecycle: planned
lead: Kris Brown
target: null
updated: 2026-10-14T21:02:00Z
author: Written with Claude
---

# Command centre

## Outcome

Align the differently flavoured coordination concepts across the estate - the master and Project threads, Initiatives and Projects, checkpoints, decisions logs, marks, Needs and background agents in Knowledge Islands; the Command Centre in legal-principal; the HNR Council in hnr-principal; the Observatory Beacon and Bridge; the Convenor role and Paperclip Coordination project; and the personal-principal Project Portfolio - into one vocabulary and one model. The test: the glossary names each concept once, every surface states whether it is a projection or an owner, and Kris can see state of play across Projects and Initiatives at a glance in one read-only view.

This Project sits in [[knowledge-islands-model|Knowledge Islands model]].

---

## Notes

- The name is "Command centre". "Council" stays the name of Knowledge Islands Principal's constitutional governance body in [[Council]]; the command centre convenes decisions for that body rather than being it, and the Convenor role ("calls the council together and holds no vote") is the matching coordination role.
- Thread rules and marks stay with [[ways-of-working]]; this Project consumes them and owns the vocabulary and the view.
- Shared principle found in three places: a command surface is a projection over canonical records, never a second register.
- Three attention taxonomies exist (HNR Council Attention, legal-principal headlines, Observatory Beacon); settle one before building a view.
- legal-principal Item kinds (wait, chase, deadline, event, verification) cover states the roadmap model lacks; Needs tags behave like decision Items. Idea, not yet a record.
- legal-principal `+/_RESUME/` resume checkpoints are a precursor of `ki-checkpoint`; offer migration as a handoff.
- **Idea: state-of-play view.** A clear view of Projects and Initiatives, possibly drawing on `apps-observatory.local` and the command-centre ideas in `hnr-principal` and `legal-principal`. Parked on 2026-10-09 in the ways-of-working thread and moved here on 2026-10-11.
- **Idea: an Observatory Instrument** over the Project registry, checkpoints, decisions logs and `ki agent` runs, ranking Needs, staleness and unread agent reports - the cheapest pilot of the state-of-play view.
- The crosswalk lives in the state-of-play `command-centre` report until this Project's design folder exists.

### Ideas for evaluation, 2026-10-14

Dispatched by the state-of-play thread from Kris's words of 14 October 2026. They are ideas, not records. Whether this Project absorbs them, and whether its Outcome is reshaped, is Kris's open query OBS-MERGE in the [areas-proposal](<../../+/_THREADS/state-of-play/areas-proposal.report.md>) report.

- **Idea: the Observatory as host command centre.** Kris asked whether command-centre and the Observatory are "one thing" and pointed to the bridge docs. The Observatory's own decision on Observatory, Beacon and Bridge makes Instruments read-only, the Beacon the attention ranker and the Bridge the governed command side, with Rig as "the first Bridge aspect". The proposal reads this Project as the model and the Observatory on each host as the surface where it runs: Instruments, Beacon, Bridge and the state-of-play view as an Instrument, with `apps-observatory` keeping product ownership. Evidence: [areas-proposal](<../../+/_THREADS/state-of-play/areas-proposal.report.md>).
- **Idea: inter-agent pub-sub communication.** Kris: inter-agent pub-sub is its own topic; ntfy is "decent but maybe not long term"; consider "a decentralised system per host with the Observatory as command centre for host and cross-tailnet communication"; the tailnet is the VPN substrate, not the interaction mechanism. Open questions: whether ntfy on `sol`, tailnet-only, serves as the interim cross-host channel (each Observatory subscribing outbound and relaying to its page over Server-Sent Events, chosen over WebRTC on 2026-10-13), and what the decentralised per-host endpoint, peered over the tailnet, should be. Any tailnet listener follows the tailnet-only listener pattern in `tools-rig` and is connection-critical. The event contract the transport carries stays with [[ways-of-working]]. Evidence: [sync-telemetry](<../../+/_THREADS/state-of-play/sync-telemetry.report.md>), stage 3.
- **Idea: a single pane of glass, with agents advertising themselves.** Kris: "I'm wondering though if the observatory can also see those agentic sessions. I'm not suggesting that I want that to become the graphical user interface for the harness at this point ... but I think some kind of single pane of glass for what's going on like this would be really, really useful as well. And then, obviously, this would allow things like agents to advertise themselves." The proposal widens this Project's read-only view from threads to every agentic session on the host, as a read-only "Sessions" Observatory Instrument: `ki agent` runs, threads and agents with their status lines, and live Claude Code sessions from `~/.claude/sessions/` by metadata only (name, repository, busy or idle, start time), never transcripts. Codex shows as "not observable live" until it has a registry. It is never a harness GUI: no prompt box, no launching, stopping or resuming; acting on a session would be a later Bridge aspect with its own decision. No cross-host view in the first slice. Zed stays where Kris talks to sessions, Paperclip stays company coordination and Delta stays with [[delta-evaluation]]. Evidence: [areas-glass](<../../+/_THREADS/state-of-play/areas-glass.report.md>).
- **Idea: token economics in the glass.** Kris: "Another key aspect of this whole command centre piece, the observatory, OTLP, the pub sub mechanism, all of that good stuff, is that we also need to think about token economics as part of it." This Project's part is showing it: per-run and per-thread token totals beside each session, each account's 5-hour and 7-day windows with reset times (read from claude-swap and CodexBar, adding no new provider call), and Beacon attention when a window passes 90 % or a run stops on a limit. Measuring belongs with AI-tooling observability under [[platform-foundations|Platform foundations]], and acting (fallback and concurrency) with [[ways-of-working]]. Evidence: [areas-tokens](<../../+/_THREADS/state-of-play/areas-tokens.report.md>).
