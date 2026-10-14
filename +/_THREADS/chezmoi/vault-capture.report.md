# vault-capture — 1Password vault reorganisation roadmap record

## Done

- Captured [DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-077-reorganise-1password-vaults-safely.md) "Reorganise 1Password vaults safely", in triage (no horizon or kind), `initiative: ki-arcadia-principal/rig`, `component: secrets`, no Project. It covers the goal, the failure mode, the reference inventory from the op-gsuite report, the ADR-DOTFILES-003 cache consequences, a boundary, and four discussion points: stable versus ID references, a pre-apply check, sequencing moves with updates, and the target layout being Kris's decision.
- Commits (local, not pushed):
  - `b957df2` chore(roadmap): reserve DOTFILES-UE-077 (`docs/roadmap/_ISSUES.md` only)
  - `8a55700` docs(roadmap): capture DOTFILES-UE-077 safe 1Password vault reorganisation (the record only)
- Checks:
  - `ki repo audit --repo .`: PASS=19 WARN=2 FAIL=0. Both warnings were already present: no committed pre-commit hook, and territory `ki-arcadia-principal` is not a registered Capital handle.
  - `ki repo roadmap list`: lists DOTFILES-UE-077 [triage].
  - `node --test tests/*.test.mjs`: 174 pass, 0 fail, 2 skipped.
  - `rumdl check .`: no issues.
- Other sessions' unpushed commits were left alone. The working tree is clean and no Git lock files remain.

## Failed

- None.

## Needs Kris

- Decide the target vault layout, or list the items to move, before DOTFILES-UE-077 is adopted and planned.
- `chezmoi_op` aliases in `~/.config/chezmoi-op/aliases` may hold ID-based references. They were not inventoried, and the record notes this.
