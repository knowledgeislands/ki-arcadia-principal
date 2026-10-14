# Rig and Techne boundary audit - report

**Done**

- Wrote the assessment: ki-arcadia-principal/Streams/Projects/agent-host/design/rig-techne-boundary-audit.md, added to design/design.md, marked cross-project for state-of-play. Commit 621da82 (local, not pushed).
- Answer in short: Kris is not confusing things. The framing holds. The confusion comes from the labels and from one bundle. tools-rig is already portable (Linux core, mise, uv, npm and direct-download providers); only Kris's chezmoi catalogue is macOS-only (404 of 406 entries), and Arcadia's Rig Initiative calls Rig "the workstation". The agent-host recipe bundles base, role (the rig.toml pins, installed by converge.sh rather than by Rig) and the personal hook. The missing word is "role": vega and sol are both remote agentic rigs on different bases. A fifth, "workspace", layer (repositories, ki bootstrap, writing-checkout rules) belongs to Techne through ki.
- Also found: Arcadia's ADR-KI-ARCADIA-003, ADR-KI-ARCADIA-006, ODR-KI-ARCADIA-001 and GDR-KI-ARCADIA-004 still say `direct-host` (Decision 30 not applied); GDR-KI-ARCADIA-004 names the instance `ki-techne-agent-host`, which TECHNE-TOOLS-OPS-017's rename to vega will make stale; the recipe pins Rig 0.4.0 against the 0.5.0 release; no linux-arm64 builds of ki or techne.
- Checks: `ki repo audit` - my files are clean. The pre-commit audit passed (FAIL=0, one existing STREAM-10 warning on island-model-and-tending). The full audit still fails on +/_CHECKPOINTS/rig.chezmoi.md (RECORD-2 headings and content), which belongs to another thread's committed file and was left untouched.

**Decisions for Kris** (recommendations in brackets)

1. Adopt the layers: base (Techne), role (Rig), workspace (Techne through ki), personal (chezmoi or Cheztoi), with packaging as a separate supply concern. [yes]
2. "Remote agentic rig" names the role; keep the recipe name `agent-host`, described as the AWS base for one, rather than renaming it in the rebuild. [keep]
3. Home of the agentic-rig role profile: ki-techne-harness `roles/` (outside any recipe), tools-ki, or chezmoi. [ki-techne-harness roles/, so sol can include it later]
4. Version policy per role: exact pins for rebuildable hosts, newest via Homebrew for workstations, minimums in the role. [yes]
5. A signed-release install kind in tools-rig replaces TECHNE-TOOLS-OPS-016's harness provider (amends ADR-KI-ARCADIA-003 decision 3). [yes]
6. Packaging: one signed KI release contract (with linux-arm64) and three channels: the Homebrew tap, the Rig kind and the installer; defer apt, AUR and Nix. [yes]
7. Omarchy: keep vega on Ubuntu LTS and get the feel through the role and personal layers; keep Omarchy for a future owned Linux workstation. [yes]
8. Release the holds: build TECHNE-TOOLS-OPS-017 as planned; approve TECHNE-TOOLS-OPS-024's stop-comparing-the-Mac part, and hold its pin-bump tool until decision 3. [yes]
9. Record "appliance" as a third role, with no recipe until the hold is reshaped. [yes]
10. State-of-play turns accepted decisions into handoffs across ki-techne-harness, tools-rig, tools-ki, tools-techne, chezmoi and Arcadia. [yes]

**Failed**

- None.

**Needs the owner**

- Answer decisions 1-10. Push ki-arcadia-principal when ready (commit 621da82).
