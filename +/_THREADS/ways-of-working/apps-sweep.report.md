# Owner report: HOUSEKEEPING-DECLS (b) - apps repositories sweep

Thread: KI Model ways-of-working. Owner decision (Kris, verbatim): "HOUSEKEEPING-DECLS - (b) sweep the three apps repos after the harness push; hand chezmoi and legal-principal to their own threads."

Driver: the harness skill `ki-work-housekeeping` is now `ki-work-recurring` under KI-HARNESS-GOV-182 (harness `main` at `86744bfd docs(roadmap): accept KI-HARNESS-GOV-182`, level with origin).

## Done

Each repository had `[skills.ki-work-housekeeping]` in `.ki.toml`; the Rig and Tower repositories also named the old skill once in `AGENTS.md`. Both were renamed. No other reference existed in any of the three (README, ROADMAP, CLAUDE.md, docs). The `docs/housekeeping/` folder name is unchanged because the renamed skill still places project templates there.

| Repository | Files | Commit | Checks | Push |
|---|---|---|---|---|
| `/Users/krisbrown/workspaces/personal/apps-midnight.ninja` | `.ki.toml` | `207052f` | `ki repo audit --repo .` PASS=19 WARN=2 FAIL=0 | fast-forward, level with `origin/main` |
| `/Users/krisbrown/workspaces/personal/apps-rig.midnight.ninja` | `.ki.toml`, `AGENTS.md` | `87ee495` | `ki repo audit --repo .` PASS=19 WARN=2 FAIL=0; pre-commit lint-staged (rumdl) clean | fast-forward, level with `origin/main` |
| `/Users/krisbrown/workspaces/personal/apps-tower.midnight.ninja` | `.ki.toml`, `AGENTS.md` | `440b1a3` | `ki repo audit --repo .` PASS=20 WARN=1 FAIL=0; pre-commit lint-staged (rumdl) clean | fast-forward, level with `origin/main` |

The audit warnings are pre-existing and unrelated to this change: a `turbo.json` `dev` task with no package script (midnight, rig) and no committed `.githooks/pre-commit` gate (all three). The audits resolved `ki-work-recurring` as a declared skill in every repository, confirming the rename is recognised.

Commit message in each: `chore(ki): rename ki-work-housekeeping declaration to ki-work-recurring`, with the `Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>` trailer. Working trees were clean before and after; nothing else was staged or touched.

Note for the Project: each push to `origin/main` in these repositories triggers a Workers Builds deploy, as their AGENTS.md states; pushing was authorised by the decision above.

## In progress

Nothing.

## Outstanding queries

None. chezmoi and legal-principal were not touched, per the decision.

```text
HOUSEKEEPING-DECLS (b): noted, no reply needed.
```
