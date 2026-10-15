# chezmoi-fix - chezmoi source fixes, sol apply and the Rig setup guide - owner report

Thread [rig.mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/rig.mac-studio-bootstrap.md). Run on sol, locally, 2026-10-14 17:35 to 17:50 BST. Authority: Kris's approvals of 2026-10-14 in the decisions log (CODEX-GROUPS, SKILLS-CONFIG, OLD-SOURCE-DIRS, RIG-GUIDE-HOME).

All four items are done. There are three local commits in `~/.local/share/chezmoi`, which is now 7 ahead of `origin/main` and not pushed. Plain `chezmoi status` runs again, and `ki-pmo` and `ki-pmo-design` are linked for Claude Code and Codex. No pushes, fetches, `brew`, `rig apply`, `rig upgrade` or reboots. Nothing was done in hnr-org. No secrets were read or printed. The draft in ki-principal is untouched.

## What has been done

- **CODEX-GROUPS (`5a9a87b`).** Line 23 of `.chezmoitemplates/codex-trusted-projects-json` now uses the `dig` form that reads both mgit root schemas.
  - The repository has no Git hook (AGENTS.md, KI-HARNESS-GOV-117). The render check therefore went into the local gate as `tests/chezmoi-templates.test.mjs`. It renders both Codex templates through `chezmoi execute-template` with an empty config, and also checks a schema-1 root.
  - Against the old line, 3 of its 4 tests fail. Against the fix, all 4 pass.
  - On sol I reviewed the per-file diff before applying:
    - `~/.codex/config.toml` only removes 37 trusted-project entries for retired `kit` and `hnr` folders.
    - The 10 `.mgit.toml` manifests change schema only, with identical members.
    - `40-macos.toml` adds the SVG handler.
  - Then I ran `chezmoi apply ~/.codex ~/workspaces ~/.config/rig/conf.d/40-macos.toml`. Plain `chezmoi status` now completes (exit 0).
- **SKILLS-CONFIG (`38d0f00`).** `dot_config/ki/config.toml` now declares `ki-pmo` and `ki-pmo-design` in place of `ki-design-loop`. I applied it on sol and ran `ki repair --apply` (PASS). It linked both skills in `~/.claude/skills` and `~/.agents/skills`, and the links resolve. The `ki-design-loop` failure in `ki doctor` is gone.
- **OLD-SOURCE-DIRS (no commit needed).** I removed the six retired OneDrive `sources-*` entries from `~/.claude/settings.json`, taking `additionalDirectories` from 64 to 58 entries, with no backup as instructed.
  - All other keys are identical, the order is kept and the mode stays 600.
  - The chezmoi source never declared any of them, and `chezmoi status ~/.claude` is clean.
- **RIG-GUIDE-HOME (`5afc058`).** The guide is now [Set up a Mac as a Rig](/Users/krisbrown/.local/share/chezmoi/docs/guides/user/setup-mac-rig.md).
  - It folds in the old new-machine notes (profiles, sudo, 1Password over Screen Sharing, self-updating apps, FileVault restarts) and today's three fixes.
  - The "Set up a new machine" section of `macos-workstation.md` now links to it, as does its FileVault anchor. The user-guides index lists it.
  - The guide is British English, ASCII-only, with no addresses or secrets. Roadmap IDs are plain text, because the `ki-guides` audit forbids links outside the guide collection.
  - The guide cites KI-TOOL-RIG-CORE-054 and KI-TOOL-RIG-CORE-055. They were on disk in tools-rig from the concurrent tool-records run.
  - [KB-DOTFILES-UE-090](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-090-close-rig-bring-up-gaps.md) now points to the guide and records what has landed and what stays open.
- **Gate.** `rumdl check .` is clean. `node --test` gives 228 pass and 4 fail. The same 4 fail on a clean export of HEAD from before this run: `ki-self-skill`, two `rig-catalogue` tests and `scheduled-emerge-session`. `ki repo audit` gives FAIL=2: runtime coverage and the missing local registry, both sol host state (SOL-REGISTRY). Neither is new.

| Final check | Result |
| --- | --- |
| `rig doctor` | unhealthy: pass=228 fail=3 skipped=19. `telegram` missing (SOL-TELEGRAM, parked); `port.headroom` falsely "conflicting (owner: Python)" (KI-TOOL-RIG-CORE-055); **new:** `default-application.svg` drifted (ImageOptim holds SVG; the declaration wants Chrome), see SVG-HANDLER |
| `chezmoi status` | runs, exit 0; one target, `.config/rig/conf.d/10-applications.toml`, from someone else's uncommitted source edit (see OTHER-EDIT) |
| `ki doctor` | unhealthy: pass=15 fail=1, only `humansnotrobots/hnr-agentic-harness` missing (SOL-HNR-HARNESS, unchanged) |

## What is in progress

Nothing in this run. Pending handoff: `~/.local/share/chezmoi` on sol, branch `main`, is 7 commits ahead of `origin/main`, unpushed. These are the 3 earlier record commits plus `5a9a87b`, `38d0f00` and `5afc058`. terra needs these before it applies, because every host on `8a58442` still fails the Codex render.

## Outstanding queries

### SVG-HANDLER - the new SVG declaration needs a Rig apply

**Summary:** applying `40-macos.toml` added the declared SVG handler, and `rig doctor` now reports it as drifted, because ImageOptim still holds SVG. Only `rig apply` sets the handler, and it was outside this run's authority. That makes three findings, where there were two before. **Need you:** review and run, or approve a run. **Recommendation:** at sol, `rig apply --dry-run`, check it only sets the SVG handler and the parked Telegram item, then `rig apply`.

### OTHER-EDIT - someone else's uncommitted edit in the chezmoi source

**Summary:** `dot_config/rig/conf.d/private_10-applications.toml` has an uncommitted change that I did not make. It drops "(KB-DOTFILES-UE-079, chezmoi thread Decision 49)" from Telegram's rationale. I left it alone. It shows as the only `chezmoi status` drift. **Need you:** say whose it is and whether to keep it. **Recommendation:** let the session that made it commit it. Otherwise discard it, because it removes a record reference.

### RENDER-HOOK - "pre-commit" means the local gate here

**Summary:** this repository deliberately has no Git hook (AGENTS.md, KI-HARNESS-GOV-117). I added the render check to the local gate (`node --test`), which AGENTS.md says to run before every commit, rather than installing an untracked `.git/hooks/pre-commit`. **Need you:** confirm, or ask for a hook. **Recommendation:** keep it in the gate, and let KI-HARNESS-GOV-117 decide on hooks estate-wide.

```text
SVG-HANDLER - 
OTHER-EDIT - 
RENDER-HOOK - 
```
