---
note_type: admin/governance/policy
updated: 2026-10-11T02:19:55Z
author: AI-assisted
---

# Policies

## Overview

Policies hold persistent operating constraints under Arcadia's governance. Substantive policy changes follow the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]; a policy's presence or successful audit does not replace its owner approval.

## Techne Programme Hold

The [[Techne Programme Hold]] restricts remote agent running and remote-environment management for Techné's two implementation products. Local tool-building and ordinary CI continue under their repository standards. Knowledge relocation does not itself accept candidates or authorise remote operations. One exemption, recorded in [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]], permits setting up and operating the single agent host `ki-techne-agent-host`; it stands until Kris changes or withdraws it, with a scheduled review on 6 November 2026.

## Agent Host Prototype Rollout

[[Agent Host Prototype Rollout]] is a diagram, with its explaining note, of how the hold's one exemption is used: the governance gate, the steps only Kris takes to grant access and build the host, first use and agent work, and the kill switch, the scheduled review and the teardown that ends it if the exemption is withdrawn. It illustrates the hold and [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] rather than adding to them; where they differ, they govern. Its Archify source sits beside it.
