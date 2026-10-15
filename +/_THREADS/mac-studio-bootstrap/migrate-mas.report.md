# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) › migrate-mas

**Run report at 10:58 BST · last mark 17:47 BST**

---

## Done

All fourteen App Store apps in chezmoi now use Rig's own `mas` provider instead of Homebrew. On a copy of sol's config, `rig doctor` shows no deprecation warnings: `warn=13` went to `warn=0`.

- **Order kept.** I confirmed that provider-resume's tools-rig commit `a9570bb` and its gate were in place. I then waited for apps-resume, adobe-sweep and hostkey-check to finish, and started from chezmoi HEAD `ace1863` with a clean working tree.
- **Commit:** chezmoi `8d86b58` `feat(rig): declare App Store apps through the mas provider`. It is local on sol, `main`, staged by explicit path and not pushed.
- **What changed:**
  - Fourteen declarations moved to `install.provider = "mas"`, `install.kind = "app"`, each keeping its App Store number: Actions, Amazon Kindle, Amphetamine, Apple Configurator, DaisyDisk, DaVinci Resolve, GarageBand, Goodnotes, Home Assistant, HP, iMovie, Telegram, UTM (added by adobe-sweep) and WhatsApp.
  - Each one has `requires = ["mas"]`, so a fresh Mac installs the `mas` command first.
  - `tool.mas` joined the `public` view, because Rig refuses a public tool that depends on a non-public one. I tested this: without the change, Rig stops with `view profile 'public' dependency 'mas' is not explicitly opted in`. See MAS-PUBLIC.
- **Tests and guides:** The catalogue test now rejects the old Homebrew form for App Store apps and checks the new one. `docs/guides/tools/rig.md` explains how to declare an App Store app. The setup guide's App Store sign-in step now says that Rig installs App Store apps through `mas`. No guide had said App Store apps come through Homebrew, so nothing else needed changing.
- **Gate:**
  - `rumdl check .`: clean, 90 files.
  - `node --test tests/*.test.mjs`: 245 tests, 241 pass, 2 skipped, and the 2 known failures (`ki-self-skill` and "the real source's isolated exit 40 reaches the wrapper reporter").
  - `ki repo audit --repo .`: one failure, the known missing `.claude/skills/ki-self` projection, which this change did not cause.
- **Rig checks on a copy of the config:**
  - `rig doctor` before (live config): `warn=13 fail=1`.
  - `rig doctor` after (copy): `warn=0 fail=2`. Both exit 1.
  - The two findings, read in full:
    - `port.headroom` conflicting: the known Headroom started by hand, already there before this change.
    - `utm: drifted via mas`: sol still has the Homebrew UTM. This came from adobe-sweep's `219607f`, not from this change, and is already the UTM-SOL query.
  - `rig apply --dry-run` on the copy: exit 0, `planned=232 failed=0 skipped=17`. Every App Store app plans through `mas`, after the Homebrew `mas` formula.
- **Clean-up:** I deleted the temporary folder, and only that folder. No `chezmoi apply`, `rig apply`, push or network call, and no secrets were read. Doctor and dry-run output are in `~/.local/state/ki/agents/mac-studio-bootstrap/migrate-mas.*`.

## In Progress

Nothing is running from this run. The live config on each Mac still uses the old form until Kris applies.

**On sol, at the screen.** These steps also apply the chezmoi commits already waiting there: the Adobe retirement, UTM moving to the App Store and the terra SSH alias.

1. In Terminal, run:

   ```sh
   chezmoi diff ~/.config/rig
   ```

   Expect: fourteen App Store tools change from `homebrew` / `mas` to `mas` / `app` and gain `requires = ["mas"]`, plus the Adobe and UTM changes from adobe-sweep.

2. Run:

   ```sh
   chezmoi apply ~/.config/rig && rig doctor
   ```

   Expect: the `Checks:` line shows `warn=0`, and there is no `Warnings:` entry for `homebrew-mas-alias`. Until the UTM swap (UTM-SOL) is done, the only findings are `port.headroom` and `utm: drifted via mas`.

3. Run:

   ```sh
   rig status | grep -iE 'telegram|whatsapp'
   ```

   Expect: both rows name `mas`, not `homebrew`.

**On terra, at the screen, only after TERRA-ORDER:** terra's Rig needs tools-rig `a9570bb`, and its chezmoi needs `8d86b58`. Neither has been pushed, and terra's current Rig does not know the `mas` provider.

1. In Terminal, run:

   ```sh
   git -C ~/workspaces/knowledge-islands/tools-rig pull --ff-only && git -C ~/.local/share/chezmoi pull --ff-only
   ```

   Expect: both fast-forward. tools-rig lands on `a9570bb` or later, and chezmoi on `8d86b58` or later.

2. Run:

   ```sh
   chezmoi diff ~/.config/rig
   ```

   Expect: the same App Store changes as on sol.

3. Run:

   ```sh
   chezmoi apply ~/.config/rig && rig doctor
   ```

   Expect: `warn=0` on the `Checks:` line. If terra's UTM is still the Homebrew copy, `utm: drifted via mas` appears. Handle it as UTM-SOL describes.

CORE-059-ACCEPT from provider-resume is still open. Its condition, `warn=0` on sol, is sol step 2 above.

## Queries

### MAS-PUBLIC: keep `mas` in the public view

**Context.** Eleven public App Store apps now require `mas`, and Rig refuses a public tool that depends on a non-public one. So `tool.mas` joined the `public` view, the small catalogue meant for the personal site. It shows only that the `mas` command is used, and the App Store apps listed there already imply that.

**Query.** Keep `mas` in the public view?

**Options.** a) (recommended) Keep it as committed in `8d86b58`. b) Take `requires = ["mas"]` off the public apps and take `mas` back out of `public`. A fresh Mac would then rely on the apply order alone to install `mas` first.

### TERRA-ORDER: get the provider and migration to terra

**Context.** terra can only take this change once it has tools-rig `a9570bb` and chezmoi `8d86b58`. Both are local on sol and unpushed, because pushing was not authorised. If terra applied the new config with its current Rig, the `mas` provider would be unknown there.

**Query.** How should terra get both commits?

**Options.** a) (recommended) Authorise a push of tools-rig `main` and chezmoi `main` from sol. Kris then runs the terra steps above. b) Leave terra on the old form for now. It keeps working, with 13 or 14 deprecation warnings, until a later push.

```text
MAS-PUBLIC - a) keep mas in the public view as committed in 8d86b58
TERRA-ORDER - a) push tools-rig main and chezmoi main from sol; I then run the terra steps (pull both, chezmoi diff, chezmoi apply ~/.config/rig, rig doctor shows warn=0)
```

```text
╭─ run report · 2026-10-15T09:58:00Z ──────────────╮
│                                                  │
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · run done                │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · App Store migrated      │
│  █  █ █▄▄▄ ▄▄▄█   █    · 2 queries               │
│                                                  │
╰──────────────────────────────────────────────────╯
```

- [at rest] migrate-mas finished; nothing running from this run
- [waiting on Kris] sol steps 1–3; terra steps after TERRA-ORDER
- [queries] MAS-PUBLIC, TERRA-ORDER; carried: CORE-059-ACCEPT, UTM-SOL
- [uncommitted] this report (state folder and thread folder)
- [unpushed] chezmoi `8d86b58` (and earlier local commits) and tools-rig `a9570bb` on sol, `main`; pushing was not authorised

Resume Rig: mac-studio-bootstrap under current ki-pmo and ki-delegation since 2026-10-14T16:47Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
