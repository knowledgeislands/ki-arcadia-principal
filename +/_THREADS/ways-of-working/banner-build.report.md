# banner-build: thread banner normative and reply block prefilled

Run `ways-of-working`, agent `banner-build`, 2026-10-14. Delivered under [KI-HARNESS-GOV-186](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-186-thread-banner-and-prefilled-reply.md), opened for this request as a Kris-requested deliver record at horizon now, verified and closed on Kris's words in the brief, "Close the record if verified."

## What has been done

- **Banner normative in `ki-pmo`.** The coordinating-thread standard gained a `Banner` subsection under its practices carrying the REST, BUSY and DONE frames from the design note, byte-identical at 52 columns, the label, running, queued, waiting and housekeeping lines beneath, and the resume line in its own text block: `Resume <label> under current ki-pmo and ki-delegation since <mark>: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.` Every Summary, recap, full summary and re-bootstrap report keeps its opening `#` heading and closes with the frame and the resume line; the heading's state now has to agree with the frame. DONE is shown once only at Project close with no resume line. No decision number appears anywhere in the banner, mark or resume line. Kris's words carried inline: the request, the frame approval "(a). Yeah, that's great.", the busy or at rest states, the compaction order, and the re-bootstrap complaint that prompted this.
- **Re-bootstrap renders it.** The Bootstrap rule now ends its three-line report with the same frame and resume line as a Summary, and names the resume line as a bootstrap trigger. The hook line in `hooks/coordinator-reminder.sh` names the closing banner and the prefilled reply block on every owner message and after compaction; its test asserts the new line for Claude Code and Codex payloads. The `ki-coordinator` output style carries both frames byte-identical, the lines beneath, the resume line and the reply-block rule.
- **Reply block prefilled in `ki-delegation`.** The owner-report rule now says one line per query, `<tag> - <recommended instruction>`, ready to send as it stands or edit, never a menu of the options, with an angle-bracket placeholder only where the owner alone can supply a value; the old `<a / b>` example is gone. Kris's correction is quoted inline: "the proposed copy block is including all the options, rather than the recommended option." The Needs-tags rule and `ki-pmo`'s full-summary text say the same. RUN-4 and PMO-6 review both; the generated rubrics were regenerated.
- **`ki-recap` reconciled.** Its standard says the single-session DONE frame never renders in a coordinating thread and that `ki-pmo`'s DONE shares the glyphs with its own side lines.
- **Mechanical check.** A new frame test under `ki-pmo`'s scripts holds the standard, the output style and `ki-recap`'s glyphs together: 52 code points per framed line, REST and BUSY byte-identical across standard and style, the DONE block word shared with `ki-recap` and the side lines different, the resume line shared, the hook line naming the banner. HARN-012 and HARN-013 in the harness specification name the banner, and the hook README describes it.
- **Derived publications.** The capability catalogue followed the changed `ki-pmo` description and the diagram manifest stamps moved; the diagram sources were unchanged and in sync.
- **Verification.** Full test suite 1133 pass, 0 fail; TypeScript clean; skill-graph check in sync; `ki repo audit` for `ki-pmo`, `ki-delegation`, `ki-skills`, `ki-work-roadmap` and `ki-repo-harness` pass, with only the two pre-existing refresh-cadence warnings on other skills' sources. Both rubrics report in sync.
- **Commits and push.** Four commits on harness `main`, pushed fast-forward to `origin/main` after a clean rebase pull: `c63c7ea2` ledger advance, `bb8d50c6` banner and reply block with the record and frame test, `0aa8248c` regenerated rubrics, `dd5761c6` catalogue, diagram stamps and record closure. The task worktree and its merged branch were removed; the older `pilot/ki-pmo` worktree from the previous run was left untouched.
- **Limitations.** `ki repo audit --skill ki-recap` cannot run: `ki-recap` is a global process skill with no declaration table, so the command refuses it; its tests ran in the suite and the `ki-skills` fleet audit covers its SKILL.md. `ki dev skill rubric --write` publishes only into the primary checkout, so the rubrics and the closing commit were made there after fast-forwarding it to the worktree commits. The record's title and shape needed one correction after the roadmap audit, folded into the closing commit.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- Receiver-owned: the user-environment manager deploys the changed `output-styles/ki-coordinator.md` to `~/.claude/output-styles/`; until then a live thread sees the new banner rule through the hook line and the standard, not the style.
- Retained material: the other units of the design note, re-anchoring after compaction, the thread status line, the inbox channel, red-x recovery and the `/compact` option, stay with the `ways-of-working` Project and were not built.
- Verification limitation: the SVG exports under `docs/diagrams/` were not re-exported; only the manifest stamps moved because the sources did not change.

## Outstanding queries

No outstanding queries.

```text
No reply needed.
```

╭──────────────────────────────────────────────────╮ │ █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀ · thread at rest │ │ █▀▀▄ █▀▀ ▀▀▀█ █    · nothing running │ │ █ █ █▄▄▄ ▄▄▄█ █    · nothing queued │ ╰──────────────────────────────────────────────────╯    KI Model: ways-of-working · mark 2026-10-14T10:55:24Z    harness main pushed · banner 2026-10-14T11:18Z · banner-build report written

```text
Resume KI Model: ways-of-working under current ki-pmo and ki-delegation since 2026-10-14T10:55:24Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
