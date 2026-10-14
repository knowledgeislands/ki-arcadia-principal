# Pin-bump record — report

**Done**

- Captured, adopted into Next and planned [TECHNE-TOOLS-OPS-024](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-024-weekly-pin-bump.md) (weekly pin bump), left `draft`. A weekly housekeeping template (`TECHNE-TOOLS-HK-001`, to be added by the record) makes `ki-next` spawn a run on the Mac. The run raises the pins in `recipes/agent-host/rig.toml` with a new `bun run self:pins:bump`, runs `bun run test`, commits only the pin file and stops at awaiting-review. It never accepts, pushes or reruns setup. The host picks up new versions when Kris next reruns setup.
- The same record removes the "This workstation against the pins" section from `operations/aws/agent-host/status.sh`, plus its check and guide sentence.
- It also makes the offline checks read versions from the pin file. Today they hard-code mise, ki, codex and rig versions, so any bump would fail `bun run test`.
- Commits (local, not pushed): `3cad4ba` reserves the record number; `e954a60` adds the record.
- Checks: `bun run test` passes with mise's Python 3.12 first on `PATH`. `ki repo audit` shows no failures and 2 warnings that were already there (CI `KI_VERSION` pin, no committed pre-commit gate).

**Needs the owner**

Four decisions are in the record, each with a recommendation:

1. Node: stay on the pinned major line (24), and treat a new major as a separate decision. (Recommended.)
2. Claude Code: don't raise its minimum weekly, because it updates itself. (Recommended.)
3. Trigger: the run happens when `ki-next` finds it due on the Mac, with no launchd scheduler for now. (Recommended.)
4. Other tools: raise to the latest release even across major versions, with the tests and your review as the gate. (Recommended.)

Approve the record for Ready once these are settled.
