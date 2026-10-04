---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-009
area: ECO
title: Gather evidence for a legacy serve fallback policy
theme: ecosystem-coordination
horizon: triage
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-04T11:57:35Z
updated_at: 2026-10-04T11:57:35Z
---

# Gather Evidence for a Legacy Serve Fallback Policy

This record is a discussion proposal carved out of [[KI-ARCADIA-ECO-004-route-deferred-mcp-findings|KI-ARCADIA-ECO-004]]. It is not accepted, prioritised, or implementation authority.

## Goal

Decide whether the estate should keep or retire the `legacy: 'serve'` fallback in migrated MCP servers, once observed client compatibility evidence supports a decision either way.

## Context

The 2026-10-04 reconciliation in KI-ARCADIA-ECO-004 found six migrated MCP servers retaining `legacy: 'serve'`. The Agentic Harness transition contract permits it, so retention is not a conformance defect. A retirement policy would affect every client that still launches servers through the legacy entry point, so it needs evidence of which supported clients still depend on it.

## Boundary

This record covers gathering client compatibility evidence and, if warranted, proposing a policy to the harness, which owns the MCP transition contract. It does not change any MCP server, alter the harness contract, or retire the fallback in any repository.

## Discussion

Useful evidence would show, for each supported runtime and binding surface, whether any configured server is still invoked through the legacy entry point. If none is, the harness could time-box the fallback; if some are, the policy should name the migration path first. Any adopted outcome becomes a harness handoff under the cross-repository convention in `AGENTS.md`, with receiver repositories scheduling their own removal.

## Governance

This roadmap record adheres to [[Enactment Process]].
