# sol-scope - owner report (SOL-SCOPE, SOL-REGISTRY, LOCAL-MODE-CHECK)

Run on `sol`, 2026-10-14, about 17:49 to 17:52 BST, under Kris's 2026-10-14 SOL-FOLD approval. Nothing was committed, registered, applied or switched. This report is not committed; the coordinator commits it with the thread folder.

## What has been done

- **SOL-SCOPE: all seven groups are present and declared on sol, plus an eighth.**
  - `equal-remedy`, `humans-not-robots`, `knowledge-islands`, `legal`, `personal`, `techmedix` and `valle-armonia` all sit under `~/workspaces`. The chezmoi source `workspaces/dot_mgit.toml` lists each as a member, and so does the applied `~/workspaces/.mgit.toml`.
  - Each group's own manifest in the chezmoi source names exactly the checkouts on disk: 3, 12, 22, 2, 7, 4 and 4. Every applied `.mgit.toml` is identical to its source.
  - `sacred-inquiry` is an eighth group, with 2 checkouts. It is declared the same way and appears in the `ki` territory ranking, so I left it in scope.
  - That makes 56 checkouts, all Git working trees.
- **SOL-REGISTRY: the dry-run is one entry short of the laptop's 52, so I did not register.**
  - sol's registry is empty. `ki registry add --dry-run` from `~/workspaces` would register 50 repositories: knowledge-islands 20, humans-not-robots 8, and 22 in the other six groups. A separate dry-run for `~/.local/share/chezmoi` adds 1, giving 51.
  - The six checkouts it skips have no `.ki.toml`, so they aren't KI repositories: `hnr-backend`, `hnr-benchmarks`, `hnr-frontend`, `hnr-shared`, `kw-website` and `paperclip`. All 24 workspace paths in sol's `~/.config/ki/config.toml` are among the 50.
  - The laptop has 52: KI 20, HNR 8, other groups 23, plus chezmoi, according to the `old-trees` report. The KI, HNR and chezmoi counts match. The other groups come to 23 on terra and 22 on sol, and the layout doesn't explain the difference.
  - **terra refused SSH.** Port 22 on `100.96.126.29` is closed, although terra is on the tailnet. No saved copy of terra's 52 entries exists, so I can't name the missing entry. See SOL-REGISTRY-DIFF and TERRA-SSH.
- **LOCAL-MODE-CHECK: local mode is still on, so I left it alone.**
  - `chezmoi status` now shows only `.config/rig/conf.d/10-applications.toml`. `~/.config/ki/config.toml` no longer appears, so the chezmoi-fix apply has brought it into line with the source.
  - The apply did not turn off local mode. Local mode is the link `~/.local/share/ki/harnesses/knowledgeislands/ki-agentic-harness`, which points to the checkout and is outside chezmoi. The `[locals.*]` paths are also in the chezmoi source. `ki doctor` reports "Local development knowledgeislands/ki-agentic-harness: active".
  - Re-running `ki dev local on` would change nothing. It would also rewrite `config.toml` and drop `humansnotrobots/hnr-agentic-harness` again, as it did in the `sol-build` run. That would put back the chezmoi drift that the apply has just cleared.
  - `ki doctor` is unhealthy, with 14 checks passing and 1 failing. The failure is "Harness inventory: missing humansnotrobots/hnr-agentic-harness", which is the parked SOL-HNR-HARNESS and not a local-mode problem.

## What is in progress

Nothing is running.

Outstanding, with no action requested now:

- `chezmoi status` shows `.config/rig/conf.d/10-applications.toml` as modified on sol. This is new since the sol-fix run and outside this brief. It is the Telegram rationale edit in commit `bd82eda` (RIG-SITE-REFRESH), which removes the internal references. sol will pick it up at the next `chezmoi apply`.
- SOL-HNR-HARNESS stays parked, and it is the only `ki doctor` failure.

## Outstanding queries

### SOL-REGISTRY-DIFF - sol would register 51, the laptop has 52

**Summary:** sol's dry-run would register every KI repository on sol: 50 workspace repositories plus chezmoi. The laptop's registry has one more entry in the non-KI, non-HNR groups (23 against 22). I can't see which entry it is, because terra refuses SSH.

**Need from you:** choose one:

- register sol's 51 now and settle the extra entry from terra later; or
- first get terra's list, by running `ki registry list` on terra and pasting it, or by turning on Remote Login for TERRA-SSH.

**Recommendation:** register the 51 now. Each one is a real KI checkout on sol. A registration is local, adds entries only, and can be undone with `ki registry remove`. The extra terra entry is either a repository missing from sol or a stale entry on the laptop. A later read of terra's list settles which, and either `ki registry add --repo <path>` on sol or a removal on terra fixes it.

### TERRA-SSH - terra refuses SSH

**Summary:** terra is on the tailnet, but its port 22 refuses connections, so agents on sol can't read the laptop. This also limits the `rig-diff` comparison. It is most likely Remote Login being off on terra. The tailnet-only firewall never touches port 22.

**Need from you:** decide whether agents on sol may reach terra read-only.

**Recommendation:** turn on Remote Login on terra only when a comparison needs it. Until then, use evidence pasted from terra.

### Reply block

```text
SOL-REGISTRY-DIFF: register sol's 51 now, settle terra's extra entry later / wait for terra's list - <notes>
TERRA-SSH: I'll turn on Remote Login on terra when needed / paste terra evidence instead - <notes>
```
