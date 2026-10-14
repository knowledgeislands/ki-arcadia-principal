# Rig release: default-application support — owner report

Authority: Decision 160 (RIG-RELEASE, KI tap only). Repository: `knowledgeislands/tools-rig`, on this Mac.

## Done

- **Rig v0.6.1 is live, and this Mac runs it from the Homebrew tap.** `brew upgrade knowledgeislands/tap/rig` installed `rig 0.6.1`. A throwaway catalogue declaring `.svg` → Chrome now shows as `present`; switching it to `.txt` shows `drifted` with the real current handler (TextEdit).
- **v0.6.0 was released first, and its default-application feature turned out to be broken.** Every declaration showed as `unknown invalid-handler-response`, and `apply` refused to assign anything. The cause: macOS hands back the current handler as a native reference, and Rig read it as the text `[object Ref]` instead of a bundle ID. I fixed it, added a test against the real macOS lookup (it failed before the fix and passes after), and released **v0.6.1** through the same authorised route. v0.6.0 stays published and immutable; its successor's notes explain the fix.
- **`e028775` is on main and pushed.** Since v0.5.0, these have landed and are in v0.6.x:
  - default applications;
  - attended `apply --sudo`;
  - explicit `rig remove`;
  - self-updating and other-source macOS apps;
  - tailnet-only firewall restrictions on macOS (pf) and Linux (nftables), pushed by another thread during this run;
  - protection for retained uv requirements;
  - roadmap and repository re-key commits.
- **CI on main had been failing since `0d6a342`, and is now green.** The release guide forbids tagging over failing CI. The fixes:
  - a real Linux defect: on Bash 5, a failed `apply --sudo` refresh killed `rig` itself with SIGUSR1;
  - tests that only worked with macOS `sed` and `stat`;
  - a ShellCheck finding;
  - a firewall test whose result depended on the runner's sort order.
- **Release process followed for both versions** ([release guide](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/guides/developer/releasing.md)):
  - every local check passed: 539 tests, ShellCheck, assembly check, mandoc, benchmark, native-provider smoke, and a trial install from the checkout;
  - CI on main and on each tag passed, including the tag/version match;
  - both GitHub releases are published and confirmed immutable;
  - the immutable installer was checked in throwaway folders;
  - tap PRs knowledgeislands/homebrew-tap#34 (v0.6.0) and #35 (v0.6.1) merged automatically once their checks passed.
- **Commits, all fast-forward to main:**
  - `bd02c50` v0.6.0 candidate;
  - `3ac4b6d` sudo-keeper fix and portable tests;
  - `1cee9cf` firewall test sort order;
  - `0505857` default-application handler fix;
  - `35dd715` v0.6.1 candidate (tagged v0.6.1);
  - `8322aff` back to `0.6.1+dev`.
- **Housekeeping:** the release work happened in a temporary separate checkout, so another thread's open firewall edits were never touched. That checkout has been removed, and the primary checkout is level with origin and clean.

## What chezmoi needs to know

- Require **Rig ≥ 0.6.1**. Versions 0.5.0 and earlier reject the declaration; 0.6.0 accepts it but can never confirm or assign it.
- The declaration shape:

  ```toml
  [default-application.svg]
  name = "SVG viewer"
  purpose = "Open SVGs in Chrome"
  rationale = "…"
  provider = "macos-handlers"
  tool = "<the catalogue id of the Chrome tool>"
  bundle-id = "com.google.Chrome"
  kind = "extension"        # or "uti" with value "public.svg-image"
  value = ".svg"
  platforms = ["macos"]
  ```

- The Chrome tool entry must declare its app artifact, for example `artifacts = ["/Applications/Google Chrome.app"]`. Without it, Rig refuses to assign the handler.
- Select the declaration in a profile in one of two ways, never both. Either list it centrally in the profile (`default-applications = ["svg"]`) or give the declaration its own `profiles = [...]`. Mixing them is rejected.
- The assignment happens in a normal `rig apply` and needs no `--sudo`. On this Mac SVGs already open in Chrome, so `rig status` will show `present` and `apply` will do nothing.
- The user guide is `docs/guides/user/default-applications.md` in tools-rig.

## In progress

Nothing.

## Needs the owner

- **RIG-REL-PATCH** — I published a second release, v0.6.1, beyond the single minor version named in the task. I did it because v0.6.0 could not deliver the SVG → Chrome purpose. _Recommendation:_ accept it; it used the same KI tap and GitHub route that Decision 160 authorises, and nothing else changed. If you'd rather I had stopped and asked first, say so and I'll treat future follow-up releases that way.

```text
RIG-REL-PATCH: accept | stop-and-ask-next-time
```
