# Phase 7 post-move sweep — report

## Done

- **Path and identity sweep.** All 19 commits below are pushed fast-forward to `origin` (files changed in brackets):
  - 5g-emerge-testbed `48b5a44` (1)
  - hnr-agentic-harness `5b6a7bb` (1)
  - homebrew-tap `ea261af` (1)
  - va-site-markhowarth.com `f8f7c4c` (2)
  - va-site-vallearmonia.com `2614f69` (4)
  - site-midnight.ninja `76572af` (2)
  - ki-specifications `9e09968` (2)
  - er-principal `38cc5ff` (5)
  - apps-observatory `89f9997` (1)
  - tools-techne `0be1627` (11)
  - ki-agentic-harness `58bdbe31` (31)
  - ki-techne-harness `32ac343` (20)
  - ki-website `2e1aa1e` (5)
  - hnr-principal `f87bb3b` (25), plus a Known Lands clarification `4455b7d`
  - legal-principal `ac0bad65` (56)
  - tmx-principal `f15e941` (6)
  - va-principal `b2a51f8` (8)
  - ki-principal `6ca5269` (26)
  - personal-principal `335e354` (16)
- **Arcadia Principal → Knowledge Islands Principal in living docs.** These are pushed:
  - ki-agentic-harness `71185261`, which also fixes the paperclip Project link in AGENTS.md;
  - ki-principal `1ebce92`;
  - ki-specifications `5694a2b`;
  - ki-techne-harness `c26887a`;
  - ki-website `5568e04`;
  - tools-techne `1115313`;
  - personal-principal `f16aff0`.
- **ki-website.** The project slug is now `ki-principal`, with a 301 redirect from `/projects/ki-arcadia-principal`.
- **ki-agentic-harness.** `ENFORCING_CAPITAL` is now `ki-principal`.
- **chezmoi.** Branch `phase7-sweep` (`011cfab`) is pushed but not applied. It renames ODR-KI-ARCADIA-001 to ODR-KI-PRINCIPAL-001 in `.chezmoitemplates/personal-two-checkouts-md`.
- **Skill links.** `ki repo --estate repair` removed 192 dangling links and added 38. None of them are tracked.
- **Trusted folder.** The stale `5g-emerge-testbed-website` entry is removed from `~/.claude/settings.json`. The backup is `phase7-sweep/backups/claude-settings.json.20261012053714`, and `chezmoi diff` for the file is clean.
- **Checks.**
  - The `ki repo audit` before/after comparison showed 0 new findings in every repo.
  - rumdl was clean.
  - Tests passed:
    - ki-agentic-harness: 1072
    - apps-observatory: 318
    - tools-techne: 89
    - chezmoi: 210, with 2 skipped
    - ki-techne-harness, on Python 3.13
  - The ki-website build and `verify:reachable` pass after `ki:site:clean`.
- **Residue.** The list is in [phase7-sweep.residue.md](phase7-sweep.residue.md).

## Failed

- **tools-ki is not pushed.** Commit `cb331a3` (6 files) is local. The primary checkout is 5 commits ahead, with the other thread's commits `24d9fd9`, `104ab7b` and `bd8b008` between mine, and has uncommitted KI-TOOL-CLI-120 work. So I did not push.

## Needs Kris/owner

- **tools-ki owner:** push `main`, which includes `cb331a3`. Then make the README "Arcadia Principal" → "Knowledge Islands Principal" change.
- **Master thread:** review and merge the chezmoi `phase7-sweep` branch, then run `chezmoi apply`.
- **ki-principal:** an Enactment record is needed for the `Admin/Governance/` prose that still names `ki-arcadia-principal`, KI-ARCADIA or "Arcadia Principal". The files are:
  - Charter
  - Known Lands
  - Conformance
  - Physical Locations
  - Agent Host Prototype Rollout
  - Techne Programme Hold
  - GDR-KI-PRINCIPAL-006
- **ki-agentic-harness:** cut a harness release so `ENFORCING_CAPITAL = ki-principal` reaches the other repos.
- **mcp-git-audit and mcp-gsuite:** regenerate the `src/generated` clients, which still hold old paths.
- **ki-website:** the public URL `/projects/ki-arcadia-principal` now redirects to `/projects/ki-principal/` (deploy pending). The pushes to ki-website and ki-agentic-harness reported a bypassed branch-protection rule; direct-to-main is the documented workflow.
- **Decision 80:** when it lands, va-site-vallearmonia.com `GITHUB_REPO` needs changing again.
- **Optional:** `~/.claude.json` project history still lists the retired `5g-emerge-testbed-website` path.
