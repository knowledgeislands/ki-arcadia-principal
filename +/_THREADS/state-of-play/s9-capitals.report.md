# Step 9b - harness repositories and Capital governance: report

## Done

- **Five harnesses created, private, on `main`, modelled on `er-agentic-harness`** (same layout, `.ki.toml` shape, UNLICENSED, `<ALIAS>-HARNESS` codes). Each was cloned to `~/workspaces/<territory>/<repo>`, registered, and got the standard GitHub settings (squash only, auto-delete branches, Issues and Projects off, Dependabot alerts and security fixes on, update-branch suggestions on):
  - `techmedix/tmx-agentic-harness`: `TMX-HARNESS`, commit `326c63e`
  - `vallearmonia/va-agentic-harness`: `VA-HARNESS`, commit `dd8a685`
  - `krisb/legal-agentic-harness`: `LGL-HARNESS`, commit `a2f2140`
  - `krisb/personal-agentic-harness`: `KB-HARNESS`, commit `33f6321`
  - `sacred-inquiry/si-agentic-harness`: `SI-HARNESS`, commit `83a38ba`
- **Starter content in each harness:** an adopting Decision Record (for example [GDR-TMX-HARNESS-001](/Users/krisbrown/workspaces/techmedix/tmx-agentic-harness/docs/decisions/GDR-TMX-HARNESS-001-adopting-decision-records.md), with the same pattern for VA, LGL, KB and SI). There is also one starter skill, `<alias>-extract-capability`, a generic copy of ER's `er-extract-capability`. The skill audit fails on a harness with no skills, so each needs one.
- **Capitals: every harness is added to its Capital's `territory_members` and Known Lands.** Every Capital's Known Lands now has a new "Estate territories" table listing all eight territories with handle, alias (ki, hnr, er, tmx, va, lgl, kb, si), class (entity or individual) and Capital. So Sacred Inquiry appears in every Capital, and Personal's external signposts also gained a Sacred Inquiry bullet. No Capital had an existing alias or class pattern to follow, so the table is new and uniform. Commits, all pushed fast-forward: er `029ddaa`, hnr `597d3e9`, ki `32531ae`, legal `cf78bdcd`, personal `8332cbb`, si `f9af35f`, tmx `84e346a`, va `ec5aaea`.
- **ki-principal `Admin/Governance/`:** the `ki-arcadia-principal`, `KI-ARCADIA` and "Arcadia Principal" names in prose are replaced, across the Charter, Known Lands, Conformance, Governance, Physical Locations and [GDR-KI-PRINCIPAL-006](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/GDR-KI-PRINCIPAL-006-knowledge-islands-ecosystem-fundamentals.md) (commit `32531ae`).
  - Left alone: historic records and their pinned links, and GDR-KI-PRINCIPAL-001 and GDR-KI-PRINCIPAL-008.
  - Also left alone: "Arcadia" where it names the Capital. The Charter still says "Capital | Arcadia".
- **Checks:**
  - All five harnesses pass `ki repo audit` with 0 failures. Their warnings: unused subagent opt-ins (kept to match ER's shape), no committed pre-commit hook (ER has none either), and the machine-wide Claude Desktop config drift.
  - `ki territory audit --estate`: healthy, 47 repositories, 0 findings.
  - The remaining Capital audit failures were already there before this run and are outside the files I touched: Markdown in unrelated notes, ambiguous wikilinks, the ki-principal `_state-of-play` checkpoint shape, and personal Decision Record links.

## Needs Kris

- **Personal harness Paperclip code:** `personal-agentic-harness` uses `organisation_code = "KIT"`, copied from its Capital, which still says `KIT` rather than `KB`. Confirm or ask for both to become `KB`.
- **ki-principal Charter identity rows** still read Skill name `arcadia-principal`, Task ID prefix `arcadia-principal-` and Auto-memory prefix `arcadia-principal`. These are Arcadia-concept names outside the brief's three strings, so I left them. Say if they should become `ki-principal`.
- **Wording:** the Techmedix Known Lands prose still spells it "TechMedix"; I did not change it.
