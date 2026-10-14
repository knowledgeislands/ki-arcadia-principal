# Estate map - paperclip placement settled

**Done**

- Map published: personal-principal `b9197f5` on `main`, pushed fast-forward and level with origin. Only `Estate Map.html` was committed; `Estate Targets.json` came out of the regeneration unchanged. `git pull --rebase` was clean.
- `knowledgeislands/paperclip` shows as a grey row in the Knowledge Islands table, and nothing about its placement is pending. Its status reads "local, unregistered" because a checkout exists, the same as the agreed unadopted kw-website and hnr repositories. A targets entry (`agreed by Kris`, "unadopted (not registered); Decision 99") records the decision.
- The tracker's Territory membership row is now agreed and done (struck through).
- Plan step 9: the "Placement of `knowledgeislands/paperclip`" item is struck through and reads "done - settled: unadopted in knowledge-islands, Decision 99".
- Checks:
  - The live snapshot was refreshed with git worktrees left out; the registry, territories and checkouts were unchanged.
  - The generator ran cleanly ("applied 28 corrections").
  - The page does not contain "today".
  - The diff covers only the tracker row, the plan item and the timestamp.
- Backups: `/tmp/estate-map-gen.py.bak-emappaperclip`, `/tmp/estate-map-targets.json.bak-emappaperclip`, `/tmp/estate-map-plan.html.bak-emappaperclip`, `/tmp/emap-live.bak-emappaperclip`.
