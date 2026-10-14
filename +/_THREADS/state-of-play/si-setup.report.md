# si-principal setup - report

## Done

- I set up the Sacred Inquiry Capital in `~/workspaces/sacred-inquiry/si-principal`, using the Techmedix and Valle Armonia Capitals as models. No content from either was carried over. It has the full identity (`SI-PRINCIPAL`, kb, private, MIT, Capital, `sacred-inquiry` territory, Paperclip organisation `SI`, work area `KB` only), a governance set (a Charter with WEALTH and the strapline, Known Lands, Conformance, Conventions, Decisions, Source Filing Policy and Frontmatter Conventions), the Operations and Enactment Process, `Calendar/`, `Resources/`, `Streams/Roadmap/` and five Pillars: Spirituality, Religion, Research, Intentional Communities and Conversations. Each Pillar has an index note and a MEMORY.md. All text uses British English and ASCII hyphens.
- Commit `a8dc141` "feat(repo): establish the Sacred Inquiry Capital" is pushed to `origin/main` (first push, fast-forward).
- The GitHub description is now "Sacred Inquiry knowledge base.". GitHub shows the default branch as `main` and the licence as MIT.
- The repository is registered locally. `ki territory list` shows `sacred-inquiry` (Capital si-principal, 1 member), and `ki territory audit --estate` reports 42 repositories, 0 findings, healthy.
- Checks: rumdl reports no issues in 37 files. `ki repo audit --repo .` passes 20 of 21 skill groups; every local finding is fixed.

## Failed

- `ki repo audit` still fails `ki-repo` on 7 GitHub settings. I left them alone because the brief only authorised the description edit: merge methods (squash only is wanted), auto-delete of head branches, Issues on, Projects on, Dependabot alerts off, Dependabot security updates off, and "always suggest updating PR branches" off.
- There is also a warning (HOOK-1): no committed `.githooks/pre-commit`. The reference Capitals don't have one either.
- `ki repo repair` cannot run while the declared sources store is unbound. Instead I linked the skill projections (which are gitignored) with `ki repo skill add` for each declared skill. `.ki.toml` was unchanged by this.

## Needs Kris

- **GitHub settings:** approve fixing the 7 findings above, for example `gh repo edit sacred-inquiry/si-principal --enable-merge-commit=false --enable-rebase-merge=false --enable-squash-merge --delete-branch-on-merge --enable-issues=false --enable-projects=false --allow-update-branch` plus turning on Dependabot alerts and security updates.
- **Source store:** create the OneDrive folder `sources-sacred-inquiry`, then run `ki repo --repo ~/workspaces/sacred-inquiry/si-principal store bind sources <path>`. After that, `ki repo repair` will run cleanly.
- **Store aliases:** I wrote `sacred-inquiry-notes` and `sacred-inquiry-sources` in the prose, following the territory handle instead of the older `kit-<x>-` pattern. Confirm, or ask for a rename.
- **Decision Record:** the audit requires every collection to begin with an adopting record, so I added `GDR-SI-PRINCIPAL-001` (Adopting Decision Records). Confirm you are happy with it.
- **Out of scope, not done:** the territory alias `si` binding, chezmoi, mcporter/launchd/MCP config, a Paperclip company, acquire/Granola wiring, and adding Sacred Inquiry to the other Capitals' Known Lands.
