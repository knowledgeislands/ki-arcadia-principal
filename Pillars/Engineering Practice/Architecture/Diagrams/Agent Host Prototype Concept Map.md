---
note_type: pillars/note
updated: 2026-10-07T04:50:00Z
author: AI-assisted
---

# Agent Host Prototype Concept Map

## Overview

This diagram maps the limited remote agent prototype onto Knowledge Islands concepts, and separates what is live for the prototype from what stays held under the [[Techne Programme Hold]]. It reads the prototype in the vocabulary of the model rather than of AWS, so that a technology choice is never mistaken for a concept. [[KI-ARCADIA-GOV-020-limited-remote-agent-prototype|KI-ARCADIA-GOV-020]] defined the prototype and [[GDR-KI-ARCADIA-004-time-boxed-remote-prototype-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] records its time-boxed exemption from the hold.

![[Agent Host Prototype Concept Map.svg]]

---

## Live for the prototype

The upper region is live until 6 November 2026. Kris, the Human, holds intent and authority and works from the Rig, Kris's Mac with Zed, Tailscale and Granted. The Rig connects over the tailnet, whose Tailscale SSH policy admits only the `techne` user, to one new Footprint, the agent host `ki-techne-agent-host`, which hosts agent sessions.

Those sessions are Kris's own actions, not an Avatar's. Kris acts as Operator and Architect through an account-local IAM role that only a human assumes, and provisions the host through Techne, implemented in `ki-techne-harness`. Access, shown in red, is always human only.

## Held

The lower region stays held. The controller Footprint `ki-techne-ops-007-primary`, its single-node K3s and the `techne-controller` dispatcher are preserved as they are. The dispatcher is a proto-handoff with no agency: it polls Telegram as `kitteth_bot`, but it is not the Avatar.

The Avatar, Kitteth, would hold delegated agency within the Realm, alongside Paperclip and talking through Telegram. All of that stays held, and the hold's three prerequisites still apply to everything outside the prototype.

## Readings

- A Realm is logical, never AWS, K3s or any other technology; it is drawn apart from both Footprints.
- The Footprint is kept separate from the Realm and its Avatar: building a host creates no agency.
- The controller predates the prototype ("built earlier") and is untouched by it.

## Source

The SVG is exported from the Archify source [[Agent Host Prototype Concept Map.archify.json|beside it]]. To change the diagram, edit the source, run Archify's `finalize` for an `architecture` diagram at `showcase` quality, then export the SVG from the rendered viewer. The rendered HTML is a working file and is not kept.

Return to [[Pillars/Engineering Practice/Architecture/Diagrams/Diagrams|Diagrams]].
