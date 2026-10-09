---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-033
area: GOV
title: Exempt the Mac Studio as a remote agent host
kind: deliver
purpose: governance
project: mac-studio-bootstrap
component: governance
status: done
blocks: []
blocked_by: []
baseline_ref: 81a1d230d8bf6d3e6ecba44b1dc5b21fe23362e0
created_at: 2026-10-08T14:18:30Z
updated_at: 2026-10-08T20:00:05Z
---

# Exempt the Mac Studio as a Remote Agent Host

## Goal

The island owner's Mac Studio workstation is recorded as an exempt remote agent host, outside the [[Techne Programme Hold]] and treated like the agent host, so agents may run on it and it may be administered remotely.

## Context

On 2026-10-08 the island owner approved this in the Techne decisions log, Decision 14: "I approve run agents on Mac Studio and remote host, Agent host, and also there's no need raise anything on state of play. I'm approving this not part hold that's on Techne." They also asked that making the Mac Studio reachable over Tailscale for remote administration be the top priority. Decision 15 records that the governance record and a remote bootstrap runbook are prepared first, and that nothing on the Mac Studio changes until the owner says so.

Facts established over SSH the same day: the Mac Studio is `sol` on the tailnet, runs macOS 26.5.2 with FileVault on, is kept awake, restarts after power loss and wakes on network. It runs the Tailscale GUI app without a login item, with key expiry disabled, and has no Homebrew, chezmoi, `ki`, Rig or `mgit`.

[[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] holds the only exemption from the hold, for the single cloud agent host, so the Mac Studio needs an explicit amendment.

## Boundary

- In scope: in-place amendments to GDR-KI-ARCADIA-004 and the hold's "Agent-host exemption" section, worded by role and machine.
- Out of scope: any change on the Mac Studio itself, which follows the [rig.mac-studio-bootstrap](../../+/_CHECKPOINTS/rig.mac-studio-bootstrap.md) checkpoint runbook; any widening beyond this one owned machine; and acceptance, which is the island owner's.

## Steps

- [x] Reserve KI-ARCADIA-GOV-033 in the issue ledger.
- [x] GDR-KI-ARCADIA-004: add a Context paragraph for the owner's approval, widen the Decision lead to the owned remote agent host, add an "Owned remote agent host" bullet (scope, differences from the cloud host, kill switch, teardown and the disk-encryption constraint), widen Bounds to one cloud host and the one owned host, and add a consequence. (Decision Records link only to sibling records, so the GDR cites no work record.)
- [x] Techne Programme Hold: record the addition in the exemption paragraph, add a matching "Owned remote agent host" bullet, widen Bounds the same way and refresh `updated`.
- [x] Run the verification below and write the review packet.

## Files touched

- `Admin/Governance/Decisions/GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold.md`
- `Admin/Governance/Policies/Techne Programme Hold.md`
- `Streams/Roadmap/_ISSUES.md` (reservation)
- this record

## Verify

- `ki repo audit --repo .` passes.
- The amendments name roles ("the island owner", "the binding owner") and the machine, not a person; no added line contains an en-dash or em-dash.

## Dependencies / blocks

None. The bootstrap runbook in the [rig.mac-studio-bootstrap](../../+/_CHECKPOINTS/rig.mac-studio-bootstrap.md) checkpoint relies on this exemption for its remote steps.

## Review

### Delivered

The amendments to GDR-KI-ARCADIA-004 and the Techne Programme Hold, with this record, landed in commit `ff54792` on 2026-10-08, touching the three planned files and nothing else.

### Change Summary

- GDR-KI-ARCADIA-004 now carries two exempt hosts: the cloud agent host and the owner's Mac Studio as an owned remote agent host. The Mac Studio is covered for bootstrap and maintenance, its tailnet daemon and entries, remote administration over Tailscale SSH and Screen Sharing, and agent runs. The cloud host's bounds, prerequisites, credentials and term apply, adapted to an owned machine: no stack, account or operator role, the owner's own identities, a kill switch of ending sessions and stopping the tailnet daemon, and a teardown that removes agent credentials and the tailnet node without wiping the workstation. Disk encryption means a restart needs an in-person unlock.
- The hold's exemption section mirrors this and now says the exemption covers the agent host and the owned remote agent host and nothing more.

### Verification

- `ki repo audit --repo .` on 2026-10-08: PASS=22 WARN=2 FAIL=0. The two warnings, CI-1 (inline `KI_VERSION` pin) and HOOK-1 (no committed `.githooks/pre-commit`), predate this record.
- No added line contains an en-dash or em-dash; the amendments name roles and the machine, not a person.

### Outstanding concerns

- The record keeps the existing title of GDR-KI-ARCADIA-004 ("Standing agent-host exemption"), which still reads correctly; the owner may prefer a broader title.
- The Project note [[mac-studio-bootstrap]] still describes the Mac Studio as attended-only and outside agent-host; its wording can follow on acceptance.

### Post-change review

This is the implementing agent's own check, not an independent review.

### Mini recap

The Mac Studio is now an exempt owned remote agent host alongside the cloud agent host, so its bootstrap runbook may run remotely. The Project note's attended-only wording remains to follow.

### Acceptance

Accepted as done on 2026-10-08 under Kris's approval (mac-studio-bootstrap decisions log, Decision 2: "KI-ARCADIA-GOV-033 - accepted").

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of the `ready` record.
