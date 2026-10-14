---
note_type: pillars/note
updated: 2026-10-14T23:26:00Z
tags:
  - card/note
  - topic/knowledge-islands
status: emerging - not adopted
author: Written with Claude
---

# Known World

## Overview

This is an emerging concept, not adopted philosophy. It draws the themes Kris raised on 14 October 2026 (seats, a coordination service per host, realms and addressing, a map of the known world with its cultures, the carve-ups of territories, the inception loop, the command centre, pub-sub and token economics) into one model, so they can be tested together in the whole-philosophy review.

In plain language: **Knowledge Islands is a map of governed knowledge (realms, territories, islands) laid over a small set of physical places (hosts), and inhabited by agents whose ways of working (cultures) come from their territory's harness.** Every theme is one of three things: a layer of that map, a binding between two layers, or a flow across it.

Hosts appear here by role, home and hub, not by machine name. Public governance keeps physical locations out, so the binding of each role to a machine lives in chezmoi's host data and the local registry.

---

## The layers

- **Realm.** The governed environment, with its own rules for identity, capability and crossing. Knowledge Islands is the first realm. A realm is what gets a public name; "knowledge realms" is the registry where realms declare themselves (see [[Realm Model]]).
- **Territory.** Eight of them, each with one Capital, one accountable authority and one harness. This is the unit everything else routes by.
- **Island.** A repository. It belongs to one territory and may sit in several archipelagos.
- **Host.** A physical place: the home host (the workstation), the hub host (the always-on studio) and the Techne agent host, under its exemption. Every one of Kris's hosts holds all eight territories in Git, so any host can stand in for any other.
- **Culture.** The population of agents working in a territory: its norms come from the territory's `*-agentic-harness` and the shared KI skills, its runtimes are Claude Code, Codex and Paperclip companies, and its homeland is the territory's seat host. An Avatar is the one persona that crosses between cultures and realms.

---

## The bindings

- **Seat.** Each territory has one _seat_: the host where it is primarily tended, where its coordination service is active and where messages for it land first. The other host holds a full replica and is its _standby_. Knowledge Islands is the one territory seated on both, active-active, with the hub breaking ties.
- **Address.** Each realm, territory and host gets a name in a realm namespace: `<territory>.<realm-domain>` for a territory's front door, `<host>.krisb.<realm-domain>` for a machine. The address resolves to the territory's seat; tailnet DNS is the transport beneath it, not the address itself.
- **Service set.** Every host runs the same services: the Observatory (Instruments, Beacon, Bridge) and a Paperclip service, plus the pub-sub endpoint later. The seat decides which territories each service treats as live on that host.

---

## The flows

- **Coordination.** Pub-sub and Paperclip route by seat: a message or task for a territory goes to its seat host, and falls back to the standby only when the seat is unreachable. Git and the checkpoint stay the source of truth, and the bus only nudges.
- **Observation.** The Observatory on each host is the pane of glass over that host's seated territories and its sessions, and shows each account's token windows.
- **Thinking.** Inception, elaboration and acquisition form one loop: an idea-stage Project's Notes, or an Emerging Concepts note, go out as a seed into acquire's ChatGPT context, a philosophy conversation elaborates them, and the capture comes back carrying `ki_project`, folded into the Project's Notes or the concept note.
- **Spend.** Token economics follows the same lines as everything else: accounts belong to hosts, runs belong to territories, so usage is attributed per run, per thread, per territory and per account, measured once and shown in the glass.

---

## The dimensions things are carved on

| Dimension | Applies to | Values | Recorded today |
| --- | --- | --- | --- |
| Class | Territory | entity, individual | [[Known Lands]] |
| Seat | Territory | home: personal, legal, humans-not-robots; hub: valle-armonia, sacred-inquiry, techmedix, equal-remedy; both: knowledge-islands, tipped to the hub | Nowhere yet |
| Exposure | Territory, service | public address, tailnet only, host local | Partly: the Domains table in [[Known Lands]] |
| Organisation | Island | GitHub organisation | Estate Map |
| Role | Island | Capital, harness, publication, product, tool, MCP, delivery | [[Known Lands]], Estate Map |
| Host role | Host | workstation, always-on hub, agent host | Project notes only |
| Seat role | Host, per territory | seat, standby | Nowhere yet |
| Culture | Agent | the harness and runtime it runs under, and its seat | Nowhere yet |
| Account | Host, run | the Claude or Codex account and its windows | Nowhere yet |

Two observations shape the rest. The seat is better expressed as a _role_ (home, hub) than as a machine name, so public governance can carry it while the local registry and chezmoi bind role to machine. And "home versus hub" is close to Kris's earlier carve of "things that are personally mine" versus "things I work on", but it is drawn for working reasons, so humans-not-robots, which Kris works in daily, is a home territory.

---

## Provenance

Written on 2026-10-15 from section 1 of the state-of-play thread's foundations-coherence survey of 14 October, on Kris's decision of 15 October to hold it here, beside [[Realm Model]], rather than in a Project. [[island-model-and-tending|Island model and Tending]] points to it for the whole-philosophy review. It is the first pilot of the inception loop in [[knowledge-acquisition|Knowledge acquisition]]: the capture from that discussion folds back into this note.
