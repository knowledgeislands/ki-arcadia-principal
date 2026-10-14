# observa-tabfix — artifacts view overlapping other views

Record: [KI-OBSERVA-INT-002](/Users/krisbrown/workspaces/knowledge-islands/apps-observatory.local/docs/roadmap/KI-OBSERVA-INT-002-portable-live-artifact-interface.md), still `awaiting-review`, with its review packet updated.

## Done

- **Cause.** The `#artifacts` style set `display: flex`. An id rule outranks the browser's `[hidden]` rule, so the shell's hiding did nothing, and the list and frame stayed on screen over every other view. Leaving the view also never closed the frame, so it kept running.
- **Fix.**
  - The page hides any hidden view with `display: none !important`.
  - Leaving artifacts closes the frame, and returning frames it again.
- **Same class across instruments, fixed.**
  - Going back to another view used to show what was last open there and then rewrite the history entry. It now reopens what the entry named.
  - The `kb` and note parameters no longer leak from one view's address into another's.
  - A read that lands after its view was left no longer writes the status or summary line under another view (new `voice.ts` guard in every instrument).
- **Tests.** The browser smoke reproduced the bug before the fix, and passes with it. It switches 11 views to and from an open artifact, in order and in reverse, with reload and back/forward. There are new shell, page, activity and documents unit tests.
- **Flaky evidence test, named.** The likely culprit is the `ki.test.ts` shim tests: a 300 ms limit raced the shim's 40–80 ms start-up under load. They now retry with longer limits. The failure did not recur in 57 runs, so this is attributed by measurement only.
- **Commits** (pushed fast-forward, `80fbb8a..aa11699`):
  - `5c79f94` fix(shell)
  - `067b94e` test(evidence)
  - `aa11699` docs(roadmap)
- **Checks.**
  - `bun run test --force`: contracts 387, instruments 255, site 197, evidence 331; 0 fail.
  - Typecheck 8/8 and build 4/4.
  - Browser smoke passed.
  - Biome adds no new finding.
  - `ki repo audit` passed for ki-work, ki-work-roadmap and ki-authoring.
  - rumdl and `git diff --check` are clean.

## Needs the owner

- **Restart due** (not run by this detached session): `launchctl kickstart -k "gui/$(id -u)/uk.me.kris.rig.observatory"`.
- **How Kris can check it.**
  1. Open `http://127.0.0.1:1675/?view=artifacts`, open HNR Council, then choose **activity**. Only Activity should show.
  2. Choose **artifacts** again: Council is framed again.
  3. Press Back and Forward: each step shows the view and artifact that entry named.
  4. Reload on either view: it shows only that view.
