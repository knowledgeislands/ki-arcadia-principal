# Harness: accept TECHNE-TOOLS-OPS-015 and strip pruned record IDs

Commits (local, not pushed): `09e5763` accept TECHNE-TOOLS-OPS-015; `104ca60` remove pruned record IDs. Checks: `bun run test` passed; `ki repo audit --repo .` FAIL=0 WARN=2, the same two warnings as the 2026-10-08 baseline.

## Done

- TECHNE-TOOLS-OPS-015 is accepted as done under Decision 35 and kept, not pruned.
- Mentions of pruned records are gone from the harness comments, checks, recipe files and operator guide. Each one now describes the behaviour in plain words. Removed: TECHNE-TOOLS-OPS-008, -011, -012, -013, -014 and -022, and KI-ARCADIA-GOV-025. The guide's opening also no longer names KI-ARCADIA-GOV-020.

## Needs the owner

- Some IDs are still in place because removing them would change something real:
  - TECHNE-TOOLS-OPS-011 is in the marker text that converge.sh writes into the host's `.bashrc` and uses to find older blocks. Changing it would break re-runs on existing hosts.
  - TECHNE-TOOLS-OPS-022 appears three times in the stack's instance user data. Changing user data disrupts the instance on the next deploy.
  - KI-ARCADIA-GOV-020 is the value of the `ki-work-item` tag and the stack description, across the stack, provision.sh, recipe.toml, the stack check and the guide's provision command. Changing them would alter live resource tags.
  - Say if you want any of these changed with the next rebuild.
- The operator guide links KI-TOOL-CLI-115 (an open record in tools-ki) to a filename that no longer exists; it is now `KI-TOOL-CLI-115-enforce-roadmap-writing-checkout.md`. That also breaks the AGENTS.md rule against linking other repositories' records. I left it alone because it is an open record.
