---
note_type: stream-roadmap
id: KI-PRINCIPAL-OPS-012
area: OPS
title: Bootstrap the Mac Studio
kind: deliver
project: mac-studio-bootstrap
status: cancelled
resolution: rejected
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-08T13:50:51Z
updated_at: 2026-10-12T19:57:12Z
---

# Bootstrap the Mac Studio

## Goal

Kris's Mac Studio meets the [[mac-studio-bootstrap]] Project's test, so any thread can resume there.

## Context

The Project was registered on 2026-10-08 with no work record. The work is attended on the Mac Studio itself, and its thread checkpoint, [rig.mac-studio-bootstrap](../../+/_CHECKPOINTS/rig.mac-studio-bootstrap.md), holds the steps.

## Boundary

- In scope: applying chezmoi, reconciling Rig declarations, installing Homebrew `ki` and `mgit`, cloning and registering the workspace, and readying Claude Code and Zed.
- Out of scope: fixing defects found in the chezmoi source, Rig declarations or `ki` install guidance, which become records in their owning repositories; agent-host work, which [[agent-host]] owns.

## Cancelled

Kris approved rejecting this record on 12 October 2026 (state-of-play thread, Decision 147), accepting the triage review's proposal as written. The mac-studio-bootstrap Project and its `rig.mac-studio-bootstrap` checkpoint overtook it and did the work. Only Kris's attended restart test (FileVault unlock and Tailscale relaunch) remains outstanding, and the Project's checkpoint already tracks it.

## Discussion

### Capture

Captured as Triage from the close-out assessment of the Project it serves, written during the [KI-ARCADIA-GOV-020](https://github.com/knowledgeislands/ki-principal/blob/fddfca69b4642cb4db4113123aa7dc613c3e92f4/Streams/Roadmap/KI-ARCADIA-GOV-020-limited-remote-agent-prototype.md) work on homes for recurring work. No plan yet.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
