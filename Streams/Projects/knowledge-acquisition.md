---
note_type: streams/project
slug: knowledge-acquisition
title: Knowledge acquisition
outcome: The provider-neutral acquisition lifecycle is documented in one Pillars note, AI sessions are acquired into their owning repositories with verified retirement of the source, and the browser-runtime and WhatsApp spool questions are settled.
initiative: knowledge-islands-model
lifecycle: active
lead: Kris Brown
target: null
updated: 2026-10-14T23:30:00Z
author: Written with Claude
---

# Knowledge Acquisition

## Outcome

Document the provider-neutral knowledge acquisition lifecycle in one Pillars note, acquire AI sessions into their owning repositories with source conversations retired only once each move is verified, and settle the browser-runtime and WhatsApp spool questions. The test: every record that names this Project is delivered or closed. The direction follows [[ADR-KI-PRINCIPAL-001-provider-neutral-knowledge-acquisition|ADR-KI-PRINCIPAL-001]]; Kris is to confirm the finite outcome.

This Project sits in [[knowledge-islands-model|Knowledge Islands model]].

---

## Notes

- The lifecycle note changes `Pillars/`, so it runs through the [[Admin/Operations/Processes/Enactment Process|Enactment Process]].
- The harness's AI-session acquisition is the work in flight; whether the lifecycle note should lead the remaining acquisition work depends on what that delivery has learnt.
- **The harness record was narrowed on 2026-10-14.** Kris chose in the state-of-play thread's roadmap census, answering its rescope question for the harness acquisition record with 'rescope now', to narrow the harness's AI-session acquisition record to what it has delivered: the read-only Claude, Codex and ChatGPT source adapters, the `tools-ki` acquisition command and registry, the published `ki-acquire-chatgpt` capability with its project-selector contract, and the one-time conversion and staging of the official ChatGPT account export into its territories with explicit omissions. That record is awaiting review. The unfinished steps of its original plan now sit here until a record is opened for each in its owning repository:
  1. Evaluate the hybrid incremental path: local-cache change nomination, browser retrieval of new or changed readable sessions through the isolated browser trial, and periodic full-export reconciliation before browser coverage is trusted.
  2. Connect ChatGPT acquisition to a readable, authorised source that can enumerate projects and return complete conversations with their write-ups and assets.
  3. Represent unmapped projects, overlapping receiver mappings, missing sessions, changed sessions and failed reads explicitly without guessing or silently dropping content.
  4. Add receiver-local triage after acquisition so complete sessions can be harvested, retained as source evidence, routed onward, or marked as containing no residual knowledge.
  5. Separate Claude and Codex acquisition guidance from their housekeeping skills, using exception-based full-session import rather than routine bulk import.
  6. Decide whether the existing `mcp-housekeeping-*` repositories remain shared read-only source adapters or need acquisition-specific names or projections.
  7. Implement a separately invoked source-retirement manifest and provider-supported deletion path that fails closed on incomplete, changed, uncommitted or unverifiable acquisitions; deletion stays unavailable until every manifest entry has a recoverable acquired copy, the source still matches the manifest and the human approves that exact current manifest.
  8. Verify one complete ChatGPT project move and one completed agent-session no-op before enabling any source deletion.

  Open questions carried with them: the provisional Spirituality project binding, and what happens to the 77 export files referenced by no conversation. The harness's staging checkpoint of 2026-10-14 holds the evidence pattern (immutable project bindings, explicit omissions, checksums from a clean checkout) the Pillars lifecycle note can draw on.
- **Known World part, 2026-10-15.** On 15 October Kris placed the foundations model in [[Known World]] and gave this Project its part: the inception loop, publishing a seed into acquire's ChatGPT context and folding back the capture that returns with `ki_project`. [[Known World]] is the loop's first pilot, and an [[Emerging Concepts]] note is a seed and fold-back target as well as a Project's Notes.
