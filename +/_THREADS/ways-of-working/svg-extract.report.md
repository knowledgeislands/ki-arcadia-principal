# Owner report - browser-free SVG extractor compared with the viewer export

Outcome: the browser-free extractor does not match the viewer export, so by Kris's criterion option (b) applies: Playwright stays the adopting repository's development dependency and the `ki-diagrams` standard is unchanged. The finding is recorded in [KI-HARNESS-GOV-177](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-177-browser-free-svg-extractor.md), committed and pushed.

## Decided

Kris, Decision 23 in [decisions.md](/Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md): "PLAYWRIGHT-DEP - (a) build and compare a browser-free extractor; adopt only if output matches, else (b)." Applied as written: built, compared, no match, (b).

## What has been done

- **Built the extractor.** A Bun-only port of the Archify 3.0.1 viewer's `serializeSvg(1, { theme: 'auto' })` path with a minimal XML DOM and no dependency: clone cleaning, root attribute edits, font inlining, viewer-stylesheet rule selection, dark and light variable resolution, XML serialisation, and the same fail-closed checks as `export-svg.ts` plus an Archify version pin. It lives in the run state, not the repository: [extract-svg.ts](/Users/krisbrown/.local/state/ki/agents/ways-of-working/svg-extract-work/extract-svg.ts).
- **Produced the reference exports** through `export-svg.ts` with `NODE_PATH` on the Observatory's Playwright 1.63.0 and cached Chromium, no network fetch. Each reference is byte-identical to the SVG already committed from the same HTML: [skill-graph.ref.svg](/Users/krisbrown/.local/state/ki/agents/ways-of-working/svg-extract-work/skill-graph.ref.svg), [change-management-skills.ref.svg](/Users/krisbrown/.local/state/ki/agents/ways-of-working/svg-extract-work/change-management-skills.ref.svg).
- **Compared.** Both diagrams differ from the reference, first at byte 103930, inside the `<style>` element; nothing outside the stylesheet differs. 37 of the 211 copied viewer-stylesheet rules differ (74 diff lines): [port-vs-ref.diff](/Users/krisbrown/.local/state/ki/agents/ways-of-working/svg-extract-work/sg/port-vs-ref.diff).
- **Isolated the cause.** With the browser's serialised stylesheet substituted into the port, the output is byte-identical to the reference for both diagrams. Every divergence is Chromium's CSS Object Model re-serialisation of rule values (`rule.cssText`), which the viewer copies instead of the stylesheet text: string re-quoting, `0` to `0px`, hex colours to `rgb()`, `currentColor` to `currentcolor`, `box-shadow` and `drop-shadow` operand reordering, default `ease` dropped from `transition`, `stroke-dasharray` comma separators, `-webkit-mask-image` to `mask-image`. Reproducing that needs a property-grammar-aware serialiser tracking Chromium, which is the drifting serialiser the exporter's rationale rejects. The reference itself also moves with Chromium releases, not only with Archify.
- **Also established:** the copied stylesheet is identical across the two diagrams and Archify's five shipped examples of all five types, so it is a constant of the Archify release, not of the diagram. The port's theme-variable cascade reproduced all 33 variables for both themes exactly.
- **Recorded and committed** under harness rules: ledger reservation `5ee71dc9bc012eab684c973b8957c519e691c9df`, record `73fa21c2d52f839acc2290b2b01345dd6f4236c1`, both pushed fast-forward to `origin/main` of `ki-agentic-harness`. Nothing else was committed, as the decision directs for a mismatch. No change in `ki-principal`.
- **Checks:** `ki repo audit --skill ki-work-roadmap` PASS; `ki repo audit --skill ki-diagrams` PASS; `bun run test` 1100 pass, 0 fail; `bunx tsc --noEmit` clean; skill-graph sync check in sync; pre-commit hooks passed on both commits.
- **Limitations:** the prototype has no test file because it is not adopted; its verification was the byte comparison against two browser exports. `references/sources.md` of `ki-diagrams` was not touched, per "commit nothing beyond the record's findings"; its 2026-10-08 "Last review" line remains accurate.

## What is in progress

Nothing running.

Outstanding - no action requested now:

- Receiver-owned: [KI-HARNESS-GOV-177](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-177-browser-free-svg-extractor.md) sits at `awaiting-review` with its review packet; acceptance through `ki-accept` is Kris's.
- Retained: the run-state work folder [svg-extract-work](/Users/krisbrown/.local/state/ki/agents/ways-of-working/svg-extract-work) holds the prototype, references and diffs until the thread's state cleanup (Decision 23, "STATE-CLEANUP") sweeps it.

## Outstanding queries

### EXTRACT-PIN - a pinned browser-verified stylesheet would make the extractor byte-exact

Summary: because the copied viewer stylesheet is a constant of the Archify release, the extractor becomes byte-identical to the viewer export if it carries the browser's serialised stylesheet block (about 34 KB) as a fixture pinned to the Archify version, refuses any other version, and the fixture is regenerated and verified through `export-svg.ts` once per Archify release using the Observatory's Playwright route. Playwright would leave every adopting repository and every routine export, and committed SVGs would stop drifting with Chromium releases. The cost is one browser-derived fixture committed in the harness and one browser run per Archify upgrade. This is outside the (a) or (b) choice already made, so it was not taken.

Need you: whether to open a `deliver` record against `ki-diagrams` for the pinned-stylesheet extractor, or to leave (b) as decided.

Recommendation: open the record. The evidence that it is byte-exact is in hand, and it answers the original objection to the dependency.

### ACCEPT-177 - accept the investigation record

Summary: KI-HARNESS-GOV-177 is an `investigate` record closed on its finding, at `awaiting-review` with its review packet complete.

Need you: acceptance through `ki-accept`, or changes to the record first.

Recommendation: accept.

```text
EXTRACT-PIN - open a deliver record against ki-diagrams for the pinned-stylesheet extractor.
ACCEPT-177 - accept KI-HARNESS-GOV-177 through ki-accept.
```
