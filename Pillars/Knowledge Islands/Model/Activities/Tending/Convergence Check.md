---
tags:
  - card/note
  - topic/productivity
  - topic/automation
  - topic/knowledge-management
  - source/claude
status: current - April 2026
author: Written with Claude
---

# Convergence Check

## Overview

An adhoc activity that compares the generic Knowledge Islands notes across all islands, surfaces any drift that has accumulated, and
propagates improvements from one Knowledge Island to the others. Ensures the portability model stays intact: Knowledge Island specific
content stays in [[Knowledge Capital]], everything else stays identical.

Run this when changes have been made to shared notes in one Knowledge Island, when a new Knowledge Island is being onboarded, or as a
quarterly health check on the portability structure.

---

## When

Adhoc - _"ki convergence check"_.

---

## What It Does

1. Identifies all islands with the generic Knowledge Islands structure
2. Compares each shared note across islands, flagging any divergence to check if its intentional drift or accidental. Resolves any
   accidental drift by reverting to the most recently updated version. Intentional drift is a signal that it needs reviewing.
3. Checks Knowledge Capital files for new parameters that should be standardised
4. Merges and cross-pollinates confirmed improvements back to all islands
5. Reports what was synced, deferred, or intentionally kept different

---

## Shared notes (must be identical across all islands)

These notes must remain byte-for-byte identical. Any difference is drift to be resolved. Paths are full paths.

- `Pillars/Knowledge Islands/` (entire folder)

---

## Legitimately island-specific notes (expected to differ)

These notes are intentionally different between islands. Do not flag differences here as drift - verify only that the correct version is
internally consistent.

| Note                                 | Why it differs                                                                                       |
| ------------------------------------ | ---------------------------------------------------------------------------------------------------- |
| `Knowledge Capital/` (entire folder) | Identity, skill name, task prefix, integrations, routing rules, and canonical notes list - by design |
