# harness-017 report — pins, TECHNE-TOOLS-OPS-017 scope, adoption and plan

Commits (ki-techne-harness, local only, not pushed):

- `41cb1ec` chore(recipe): raise the mise pin to 2026.10.6 and Codex to 0.162.0
- `10c27bc` docs(roadmap): fold record-identifier removal into TECHNE-TOOLS-OPS-017
- `81a1592` docs(roadmap): adopt and plan TECHNE-TOOLS-OPS-017

Checks: `bun run test` passes and `ki repo audit` gives FAIL=0 WARN=2 (the same two warnings as before) after every commit.

## Done

- The recipe now pins mise 2026.10.6 and Codex 0.162.0. The offline checks that repeat those pins were updated to match.
- How the versions were checked: the changelog of the Mac's installed mise (2026.10.7) lists 2026.10.6, released 2026-10-09. Nothing installed on the Mac shows Codex 0.162.0, because Homebrew keeps only 0.162.1. For Codex I relied on the earlier session's observation in the decisions log that the Mac ran 0.162.0. No network check was made.
- TECHNE-TOOLS-OPS-017's scope now includes removing the remaining record identifiers at the rebuild:
  - TECHNE-TOOLS-OPS-011 in the start-up marker.
  - TECHNE-TOOLS-OPS-022 in the boot script, which also covers the apt configuration it writes and the reboot unit.
  - KI-ARCADIA-GOV-020 and KI-ARCADIA-GOV-023 in the tags, the stack description, `provision.sh`, the recipe and the guide.
- On existing hosts, converge will recognise the old marker by its pattern rather than by the record's name. It then replaces the old block instead of adding a second one.
- TECHNE-TOOLS-OPS-017 is adopted into Next as `deliver` and fully planned. It stays `draft` until you approve it, and it links no other repository's roadmap record.

## Failed

- Nothing failed outright. One thing to know: `bun run test` fails in a plain shell here, because the default `python3` is the system's 3.9, which lacks `tomllib`. It passes with mise's Python 3.12 first on `PATH`. This was already the case before my change.

## Needs the owner

- **The Mac has moved on.** It now runs mise 2026.10.7 and Codex 0.162.1, so the new pins are already one patch behind. Recommendation: raise them again to those versions if you want the pins to keep matching the Mac.
- **Decisions in TECHNE-TOOLS-OPS-017 before it becomes Ready:**
  1. **The `ki-work-item` tag:** recommend replacing it with `ki-authority = GDR-KI-ARCADIA-004`, the durable decision record. The alternative is to drop the tag.
  2. **The `.bashrc` hand-off:** recommend removing it outright once the provider sets the login shell, with converge warning if the login shell differs from your choice. The alternative is to keep it dormant as a fallback.
  3. **How far the identifier clean-up goes:** recommend removing every record identifier from the agent-host code, recipe, checks and guide, not just the four named, and adding a check that enforces it. The controller and target stacks also carry `ki-work-item` tags, one naming a retired identifier; recommend capturing those as a separate triage item.
  4. **Name examples:** recommend that the guide uses `vega` for this host while the recipe's defaults stay person-neutral.
  5. **The before-a-rebuild check:** it expects "No changes", but this work changes the template on purpose. Recommend running that check at the last commit before this work lands, then rebuilding from the new template.
- **Handoff to chezmoi** (not blocking): set the binding's host and Tailscale names and the payload's `target_host` to `vega`, rename the SSH alias, and drop the old `known_hosts` entry after the rebuild.
