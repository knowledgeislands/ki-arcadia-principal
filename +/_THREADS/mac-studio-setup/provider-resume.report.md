# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › provider-resume

**Run report at 10:36 BST · last mark 17:47 BST**

---

## Done

The Mac App Store now has its own provider in Rig, called `mas`. Rig output names `mas` for App Store apps and never `homebrew`. The old Homebrew form still works, so the live configurations on sol and terra keep working until they are migrated. This run picked up where mas-provider stopped at about 02:45 BST, when it hit its session limit. Its uncommitted edits were sound and are kept. This run added the missing pieces, ran the full gate and committed.

- **Commit:** tools-rig `a9570bb` `feat(providers): add a built-in mas provider for Mac App Store apps`, local on sol, `main`. It delivers [KI-TOOL-RIG-CORE-059](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md), which mas-provider captured in `67328f4` citing Kris's "Lets do this now, so its done done.", and moves it to Awaiting review.
- **What changed:** check, install, upgrade and removal for App Store apps moved from `homebrew:mas` to `mas:app`, along with numeric-identity validation, update policy and app-source detection. An unattended upgrade still reports these apps as `interactive-required`. `rig doctor` gained a Warnings section with a real `warn` count, and lists each old-form declaration there without changing the verdict. An earlier Homebrew `mas` formula can supply the `mas` command for later App Store installs in the same apply.
- **Added in this run:** App Store installs declared for Linux are now rejected. The specifications were aligned ([RIG-CONF-013](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/specs/configuration.md), [RIG-CONF-028](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/specs/configuration.md), [RIG-ORCH-006](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/specs/orchestration.md), [RIG-ORCH-017](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/specs/orchestration.md), [RIG-ORCH-018](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/specs/orchestration.md), [RIG-ORCH-024](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/specs/orchestration.md), [RIG-ORCH-034](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/specs/orchestration.md), [RIG-ORCH-042](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/specs/orchestration.md), [RIG-STATE-015](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/specs/state.md) and [RIG-CAT-009](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/specs/catalogue.md)). So were the getting-started guide, with a new declaration and migration section, the commands guide, the manual and the changelog. The run also wrote the record's review.
- **Checks:** all pass. `ki repo audit` gives 19 pass, 1 warning and 0 failures. The warning was already there: the repository has no committed pre-commit hook. `shellcheck`, `bash -n`, `assemble-rig --check`, `benchmark-rig`, `smoke-native-providers` (including `mas`), `bats` (550 of 550), `mandoc -T lint` and `git diff --check` are all clean. No `rig apply`, `chezmoi apply`, push or network call was made.

**Declaration form for the chezmoi migration.** For each of the 13 App Store tools in `dot_config/rig/conf.d/private_10-applications.toml`, change two lines and keep the locator:

```toml
install.provider = "mas"
install.kind = "app"
install.locator = "747648890"
```

Variants use `variant.ID.install.provider = "mas"` and `variant.ID.install.kind = "app"`. `[remove.ID]` uses `provider = "mas"` and `kind = "app"`. `tool.mas` stays a Homebrew formula (`install.provider = "homebrew"`, `install.kind = "formula"`, `install.locator = "mas"`). App Store tools may add `requires = ["mas"]` so that a fresh Mac installs `mas` first.

## In Progress

Nothing is running from this run. sol's `rig` runs from this checkout, so the new provider is live there now. Kris can see it at sol's screen:

1. In Terminal on sol, run:

   ```sh
   rig doctor
   ```

   Expect: a `Warnings:` section listing 13 lines like `tool.telegram: deprecated (homebrew-mas-alias); owner=configuration; action=declare-provider-mas-kind-app`, `warn=13` on the `Checks:` line, and the same `Verdict:` as before.

2. Run:

   ```sh
   rig status | grep -i telegram
   ```

   Expect: a row that names `mas`, not `homebrew`, for Telegram.

chezmoi has uncommitted edits to `private_10-applications.toml`, `tests/rig-catalogue.test.mjs` and the [KB-DOTFILES-UE-086](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-086-finish-software-alignment.md) record. These belong to the rig-apps resume, not to this run, and this run left them alone. The queued mas-migrate run should start only after rig-apps has committed.

## Queries

### MAS-MIGRATE-ORDER: when to migrate the 13 App Store declarations

**Context.** The provider is committed and the old form works with a doctor warning. The chezmoi migration is queued as its own run (mas-migrate). rig-apps is still changing the same file (`private_10-applications.toml`), so starting both at once would mix their edits.

**Query.** When should mas-migrate run?

**Options.** a) (recommended) Run it right after rig-apps commits, on sol. It changes every App Store declaration to the form above, adds `requires = ["mas"]`, runs the chezmoi gate and commits locally. Kris then applies chezmoi on each Mac, and `rig doctor` should show `warn=0`. b) Run it now, alongside rig-apps, and accept the risk of mixed edits. c) Leave the alias in place for now and live with the 13 doctor warnings.

### CORE-059-ACCEPT: review the Mac App Store provider

**Context.** [KI-TOOL-RIG-CORE-059](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md) is Awaiting review. Two choices in it need Kris's review. First, Linux is rejected only when a `mas` install names `linux` itself, not when the tool alone lists it, because a Linux variant may legitimately sit beside it. Second, Homebrew provider arguments no longer reach `mas`.

**Query.** Accept [KI-TOOL-RIG-CORE-059](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md)?

**Options.** a) (recommended) Accept after mas-migrate's `rig doctor` on sol shows `warn=0` and App Store rows naming `mas`; an agent then closes the record under `ki-accept`. b) Accept now, on the fixture evidence. c) Hold it and say what to change.

```text
MAS-MIGRATE-ORDER - a) run mas-migrate right after rig-apps commits, on sol: change every App Store declaration to install.provider = "mas" and install.kind = "app", keep each locator, add requires = ["mas"], run the chezmoi gate and commit locally; Kris then applies chezmoi on each Mac and rig doctor should show warn=0
CORE-059-ACCEPT - a) accept KI-TOOL-RIG-CORE-059 once mas-migrate's rig doctor on sol shows warn=0 and App Store rows naming mas; an agent then closes the record under ki-accept
```

```text
╭─ run report · 2026-10-15T09:36:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · mas provider committed  │
│  █  █ █▄▄▄ ▄▄▄█   █    · 2 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] provider-resume finished; nothing running from this run
- [waiting on Kris] the two `rig doctor` and `rig status` checks at sol's screen
- [queries] MAS-MIGRATE-ORDER, CORE-059-ACCEPT
- [uncommitted] this report (state folder and thread folder); chezmoi edits belonging to rig-apps
- [unpushed] tools-rig `b5011d5`, `67328f4` and `a9570bb` on sol, `main`; pushing was not authorised

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
