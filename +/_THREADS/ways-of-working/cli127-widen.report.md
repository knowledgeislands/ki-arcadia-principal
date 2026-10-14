# cli127-widen - owner report

Run `cli127-widen`, Project [ways-of-working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md), Initiative [knowledge-islands-model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md). Record change only in `tools-ki`; no code, no release.

## Done

- **[KI-TOOL-KI-CLI-127](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-127-agent-status-live-threads.md) widened** under "KI-HANDOFFS - widen KI-TOOL-KI-CLI-127 to carry all four plus the link printer" and "LINK-GUARD - approve: hook line plus KI-HARNESS-GOV-188 in the harness, link printer in KI-TOOL-KI-CLI-127, output style handed to Rig: chezmoi". Retitled "Agent thread coordination commands"; still `draft`, horizon next, Project `ways-of-working`. The filename keeps its original slug so the one existing link to it, in the `cli124-fix` report, still opens.
- **Five items carried**, each with Steps and a Verify block: live-thread listing on `ki agent status`; a decision class beside `home:` on `ki agent decide` and `reconcile`, with the `close` gate reading it; `ki agent send` writing to a tracked inbox in the receiving thread's folder, cited to "REBOOT-ALL - after GOV-187 is accepted and reply-stack lands, this thread re-bootstraps first, then the Master sends each live coordination thread its one-line re-bootstrap opener"; the `KI_AGENT_RUN` pin on the Codex launcher; and the link printer, marked first to deliver.
- **The `home:` gap, checked.** [KI-HARNESS-GOV-187](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-187-thread-model-and-banner.md) and the `ki-pmo` standard ask that each entry carry its class, "operational, rule, standalone or held, each with its home named in the log". [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md) delivered the home only. The gap is the class and the gate's reading of it: an operational entry that is its own home, and a held entry homed in an untracked checkpoint, both block `close` today. The record's Discussion says so.
- **The Codex marker, checked.** The Codex launcher already sets `KI_AGENT_RUN`, released in 0.10.2. The record carries only a two-runtime pinning test and a guide sentence; dropping the Codex terminal check is a harness hook change, named under Dependencies for the harness to capture. The harness link check [KI-HARNESS-GOV-188](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-188-report-record-links.md) is linked as the printer's counterpart.
- **Checks.** `ki repo audit --skill ki-work-roadmap` passes. Committed as `3941aa3` on `tools-ki` `main`, rebased on `origin/main`, pushed fast-forward.

## In progress

Nothing. The run is complete.

## Flag

The push was fast-forward but carried two commits already sitting unpushed on local `main` before this run started: `909cfef docs(acquire): plan Granola retention defect` and `3019c39 docs(roadmap): reserve Granola defect identity`, both authored as Kris Brown by an earlier session. I should have stopped and asked before pushing them; they are now on `origin/main`. No force-push was made and none will be.

## Needs from you

### PUSH-EXTRA - the two Granola commits that went up with mine

**Summary.** Two earlier local commits on `tools-ki` `main` were pushed alongside `3941aa3` because the push was a plain fast-forward of the branch.

**Need from you.** Whether that is acceptable as it stands, or whether you want them reverted by a new commit.

**Recommendation.** Accept: both are record-only commits from your own session and were ahead of the remote in any case.

### LINK-FORM - which link a pruned record gets

**Summary.** The printer's pruned-record fallback can print a `git show <rev>:<path>` locator, which needs no file, or a path into a materialised copy, which opens in an editor. KI-HARNESS-GOV-188's check should accept whichever is chosen.

**Need from you.** Which form, when the printer is planned.

**Recommendation.** The `git show` locator, since it is honest about the record being gone and needs no scratch file.

```text
PUSH-EXTRA - accept as pushed
LINK-FORM - git show locator

---
PUSH-EXTRA - accept as pushed | revert the two Granola commits
LINK-FORM - git show locator | materialised copy | decide at planning
```
