# Handoff rule - report (Decision 33)

## Done

- Cross-repository choreography rule rewritten identically in ki-arcadia-principal (df6542e), ki-techne-harness (6a8c105), tools-techne (684de1f), ki-specifications (027750e) and ki-website (a2c064a): a handoff names the originating repository, states the need plainly, says in plain words whether it blocks, and links only durable documentation, never another repository's roadmap record or identifier. Rest of each section unchanged.
- Shared guidance updated in ki-agentic-harness (4de7f5a2): `ki-work-roadmap` work-item format now says `blocks`/`blocked_by` name local records only, with cross-repository needs described in prose; the `ki-repo` review checklist no longer asks for reciprocal links to downstream records in other repositories.
- Open records cleaned of cross-repository record IDs and links: KI-HARNESS-GOV-168 and KI-HARNESS-OPS-005 (4de7f5a2), KI-ARCADIA-MOD-006 (df6542e), TECHNE-TOOLS-OPS-015 (6a8c105), TECHNE-TOOL-CLI-006 (684de1f), KI-WEB-SITE-001 (a2c064a), KI-TOOL-CLI-115 (1d00d71). Done/cancelled records and Decision Records untouched.
- Substantial change captured as a record rather than made: KI-HARNESS-GOV-170 (triage, `docs/roadmap/KI-HARNESS-GOV-170-keep-resolution-targets-local.md`) - the work-item standard and rubric still accept a `resolution_target` in another repository; restricting it changes audit behaviour in the harness and the matching parser in tools-ki.
- Checks: `ki repo audit` passes with no failures in all seven repositories (warnings only, pre-existing). Tests pass: ki-agentic-harness 1062/1062, tools-ki, tools-techne, ki-techne-harness and ki-website all green; ki-arcadia-principal and ki-specifications have no test suite. No push.

## Failed

- Nothing. (First commit attempt in six repositories was rejected by commitlint for a long body line; re-committed with a wrapped body.)

## Needs the owner

- No files were skipped: no repository had other uncommitted changes.
- Not changed, for your call: `ki-accept`'s cross-repository reference preflight (it repairs existing links before pruning, so still useful), and `ki-delegation`'s rule that threads and checkpoints cite every record by full identifier, which can put another repository's record IDs into checkpoints.
- Arcadia records still cite KI-ARCADIA-GOV-020 (their own repository) as "GOV-020"; left as is.
- KI-HARNESS-GOV-170 needs triage/adoption; tools-ki will need a plain-language handoff when it is planned.
