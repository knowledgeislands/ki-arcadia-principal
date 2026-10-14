# DOTFILES-UE-077 agreed approach — report

**Done**

- Recorded the Decision 9 secrets approach in [DOTFILES-UE-077](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-077-reorganise-1password-vaults-safely.md): new "Agreed approach" section (automation vault, one secrets map, pre-apply check, stale-cache expiry, rejected title-search fallback). The "Stable versus ID references" discussion point was replaced; the remaining open questions are vault name, map mechanism, check mechanics, sequencing and the rest of the layout. Boundary updated to bring the automation vault and map in scope. Record stays in triage; `updated_at` bumped.
- Commit `1dbc983` (local only, that path only, not pushed).
- Checks: `rumdl check .` clean; `node --test tests/*.test.mjs` 174 pass, 0 fail, 2 skipped; `ki repo audit --repo .` FAIL=0, WARN=2. Both warnings were already there and are unrelated to this edit: no committed pre-commit hook (HOOK-1), and territory `ki-arcadia-principal` is not a registered Capital handle (ITEM-2).
- Checked locally: `~/.config/chezmoi-op/aliases` holds only comments, and no `.tmpl` calls `chezmoi_op`. The record now says so in place of "not inventoried".

**Needs Kris**

- Choose the automation vault's name (still open in the record).
