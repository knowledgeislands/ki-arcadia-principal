# Gate baseline: chezmoi source

The gate passes again. All five failing tests have been fixed and `ki repo audit --repo .` now exits 0, in three local commits that have not been pushed.

## Done

| Commit | Change |
| --- | --- |
| `e18b58f` | fix(skills): follow the `ki-work-housekeeping` rename to `ki-work-recurring` |
| `f27f7ed` | test(techne): make the tests read the host name from the agent-host binding |
| `8efa6df` | docs(zed): name the agent host `vega` in the remote host guide |

### What caused each failure

- **Skill rename.** The harness renamed `ki-work-housekeeping` to `ki-work-recurring` (commit `0b6349c8`, [KI-HARNESS-GOV-182](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-182-wave-e-skill-renames.md)). Because `.ki.toml` still declared the old name, `.agents/skills/ki-work-housekeeping` was left as a dangling link. `chezmoi execute-template` stops when it hits that link, which caused three failures:
  - the `tests/config-fragments.test.mjs` file failed to load;
  - "host manifest vega.toml lists only plain, secret-free targets" failed;
  - "the vega payload renders, passes validation and carries the host variants" failed.

  Those last two were in the vega group but had nothing to do with `264341f`. It also made the audit exit 1.

  **Fix:** I renamed the declaration and the live references in `AGENTS.md`, `docs/guides/agents/audits.md`, the `ki-self` skill and `tests/ki-self-skill.test.mjs`. Then I ran `ki repo repair`, dry run first. It relinked the ignored `.agents/skills` and `.claude/skills` projections and removed the dangling ones. `ki repo conform --dry-run` had nothing to change, so `repair` is the command that maintains these links.
- **`ki-self-skill`.** It did not fail when I ran it before the fix. It only needed its expected text updated for the rename. So I could not confirm the rename as the cause of a `ki-self-skill` failure: none happened here.
- **vega/techne.** "the SSH and Zed entries log in to the agent host as techne" and "the derived host name has a managed SSH entry" broke because `264341f` renamed the SSH `Host` and Zed entries to `vega` but did not update the tests. They still expected `ki-techne-agent-host`.
  - The source is right. The binding now sets `host_name = "vega"`, and the agent-host recipe in tools-techne builds the "SSH entry" from `host_name`. It only falls back to `ki-techne-{name}` when `host_name` is not set.
  - **Fix:** both tests now read the host name from the binding and fall back to that default. The Zed guide still named the old alias, so I corrected it.
  - Nothing that gets deployed to a host changed, and no design choice was needed.

### Check results

- `node --test tests/*.test.mjs`: 228 tests, 226 pass, 0 fail, 2 skipped. Both skips are the "pinned migration …" tests, which are marked SKIP in their own suite.
- `ki repo audit --repo .`: exit 0, with FAIL=0 and two warnings:
  - BODY-12: `ADR-KB-DOTFILES-003` has an "Amendment 2026-10-12" section.
  - HOOK-1: there is no committed pre-commit hook. `AGENTS.md` says this is deliberate, pending KI-HARNESS-GOV-117.

  I left both alone because neither is a defect in this scope.
- `rumdl check .`: no issues.
- Nothing was changed on the machine itself and no Git locks were left behind. The coordinator's change to `dot_config/rig/conf.d/private_40-macos.toml` is untouched and unstaged.

### Left unchanged on purpose

- [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) is an in-progress work record owned by another thread. It still mentions `ki-work-housekeeping`.
- `docs/guides/tools/claude-code.md` still names `ki-techne-agent-host`, but only in a dated observation from 2026-10-07.

## In progress

Nothing.

## Outstanding queries

- **Needs: push.** The three commits are on `main` on this laptop and have not been pushed. Should I push them?

```text
Needs push: <yes / no>
```
