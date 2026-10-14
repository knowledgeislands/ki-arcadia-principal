# Clear old KI-ARCADIA names in ki-principal - report

Authority: Decision 150 (ARCADIA-NAME). Commit `cdf558e` on `knowledgeislands/ki-principal` main, pushed fast-forward. Pre-commit gate and `ki repo audit --skill ki-repo-kb`: PASS, FAIL=0, two existing STREAM-10 close-out warnings (paperclip-bootstrap-and-recovery, website) unrelated.

## Done

- [Techne Programme Hold](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Policies/Techne Programme Hold.md>): six links repointed from `ki-arcadia-principal` to `ki-principal`; cited records now read KI-PRINCIPAL-GOV-013/020/021/023/033 and KI-PRINCIPAL-ECO-007/008.
- [design.md](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/design/design.md): KI-ARCADIA-GOV-028 now cited as KI-PRINCIPAL-GOV-028.
- [Agent Host Prototype Rollout](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Policies/Agent Host Prototype Rollout.md>): links repointed; KI-PRINCIPAL-GOV-020/021.
- [Known Lands](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Known Lands.md>): links repointed; KI-PRINCIPAL-ECO-008/010.
- Diagrams and Agent Host Prototype Concept Map (Pillars/Engineering Practice/Architecture/Diagrams): KI-PRINCIPAL-GOV-020/022.
- `knip.ts` comment and `bun.lock` workspace name now `ki-principal` (lockfile verified with `bun install --frozen-lockfile`).
- Method: serials kept because `Streams/Roadmap/_ISSUES.md` carried the old high-water marks over (GOV 33, ECO 11), so no collision; pinned file paths inside the URLs stay as they were at each commit.
- AGENTS.md left unchanged: the Charter still names the Capital "Arcadia", so per the brief its Territorial authority wording stays. Decision records, checkpoints, Calendar and Roadmap records left as history.

## Needs Kris

- Charter vs GDR-KI-PRINCIPAL-008: the [Charter](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Charter.md) Identity table still says Capital "Arcadia", skill name `arcadia-principal`, task prefix `arcadia-principal-` and auto-memory prefix `arcadia-principal`, while [GDR-KI-PRINCIPAL-008](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Decisions/GDR-KI-PRINCIPAL-008-capital-naming.md) names the Capital "Knowledge Islands Principal". Changing those rows is a constitutional amendment, so I left them, along with AGENTS.md "Arcadia is the Capital" and two Pillars examples quoting `arcadia-principal-` (Realisation/Charter, Realisation/Configuration). Decide: keep "Arcadia" as the Capital's name, or amend the Charter and follow through.
