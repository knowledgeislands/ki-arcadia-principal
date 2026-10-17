# [Rig](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/rig.md) › [Mac Studio setup](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-setup/mac-studio-setup.md) › core059-prune

**Run report at 18:16 BST**

---

## Done

- Pruned [KI-TOOL-RIG-CORE-059 (pruned)](https://github.com/knowledgeislands/tools-rig/blob/9b4de28918972ec1e5d05a6b084219d77f7f0fb3/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md) from tools-rig under `ki-accept`, with your approval quoted in the brief. The record was `done`, had no trade link and nothing else in the repository linked to it. The last revision holding the file is `9b4de28` (`docs(roadmap): accept [KI-TOOL-RIG-CORE-059 (pruned)](https://github.com/knowledgeislands/tools-rig/blob/9b4de28918972ec1e5d05a6b084219d77f7f0fb3/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md)`).
- Prune commit `1d4db6a` (`chore(roadmap): prune 1 done work record`, body `- [KI-TOOL-RIG-CORE-059 (pruned)](https://github.com/knowledgeislands/tools-rig/blob/9b4de28918972ec1e5d05a6b084219d77f7f0fb3/docs/roadmap/KI-TOOL-RIG-CORE-059-mac-app-store-provider.md)`) removes only that record. It is committed locally on `main` in tools-rig and not pushed.
- The issue ledger `docs/roadmap/_ISSUES.md` is unchanged, which is correct: it keeps CORE reserved through 059 so the number is never reused. `ROADMAP.md` did not list the record, so no index entry needed removing.
- `ki repo audit --repo .` reports PASS=19, WARN=1 and FAIL=0. The one warning was already there and is unrelated: there is no committed `.githooks/pre-commit` gate.

## In Progress

Nothing.

## Queries

**Needs-PUSH-RIG-PRUNE**

**Context:** tools-rig `main` on this Mac Studio is 1 commit ahead of `origin/main`. That commit is the prune `1d4db6a`. This run was not authorised to push.

**Query:** Should the prune commit be pushed?

**Options:** a) (recommended) Push tools-rig `main` to `origin` from this machine so the prune is safe on the remote. b) Leave it local for now and push it with the next tools-rig change.

```text
Needs-PUSH-RIG-PRUNE: a) Push tools-rig main to origin from this machine so the prune is safe on the remote.
```
