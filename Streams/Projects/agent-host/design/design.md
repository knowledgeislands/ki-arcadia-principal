---
note_type: streams/index
updated: 2026-10-09T17:00:00Z
author: Written with Claude
---

# Design

## Overview

This folder holds the working papers for design questions in the [[agent-host|Agent host]] Project that are still open. Its first paper explains, for Kris, what the workstation bundle sends to the agent host and weighs where the per-host sharing manifest should live, ahead of the approval of DOTFILES-UE-073 and TECHNE-TOOLS-OPS-015. The papers are temporary: once their outcome is consolidated into those records or into [[ADR-KI-ARCADIA-003-the-agent-host-workstation-model|ADR-KI-ARCADIA-003]], they are deleted in one commit.

## Workstation bundle walkthrough

[[workstation-bundle-walkthrough]] lists the files the host receives today and after the pilot, shows an example manifest, explains how Kris controls what is shared and compares four homes for the manifest capability, ending with a recommendation and its effect on the two pilot records.
