# gate-scope · Run report at 19:35 BST

---

---

---

## [Knowledge Islands model](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Initiatives/knowledge-islands-model/knowledge-islands-model.md) › [Ways of working](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/ways-of-working.md) › gate-scope

**Run report at 19:35 BST · last mark 14:58 BST**

---

### Done

Design only, as asked: no file outside this report was edited, no record was opened, nothing was committed. The design follows Kris's instruction of 19:26 BST on 2026-10-14: "propose scoping ki-principal's pre-commit audit to staged files, whole-tree audit kept in CI or the regular audit run; report the design before changing anything".

**The hook and its history.** `.githooks/pre-commit` in ki-principal runs the Husky gate (lint-staged, then check-only syncpack) and then `exec ki repo audit --repo "$root" --skill ki-repo-kb`. It was committed on 2026-10-10 in `d191eff`, "chore(hooks): commit the pre-commit and commit-msg gate", whose message says it binds `core.hooksPath` "so every working tree, including an uninstalled linked worktree, runs the Husky gate and the check-only Knowledge Base audit instead of committing unchecked". The hook's own comment says the focused audit "leaves machine-local checks, such as registry and runtime activation, to the full audit and CI". Nothing in it, or in the standard behind it, chose whole-tree deliberately: whole-tree is simply the only scope `ki repo audit` offers. The governing decision is [ADR-KI-HARNESS-SKILLS-017](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/decisions/ADR-KI-HARNESS-SKILLS-017-commit-gate-existence-and-content-are-owned-separately.md), "Commit-gate existence and content are owned separately": `ki-repo` HOOK-1 and HOOK-2 own that a hook exists and is bound, `ki-repo-kb` GATE-1 owns what a Knowledge Base hook runs, and "Content is check-only... a content criterion rejects its expected command when the same line carries `--fix` or `--write`". GATE-1 in `standards-knowledge-base.md` line 100 requires only that the hook "runs `ki repo audit`" check-only; its checker in `ki-repo-kb/scripts/rubric/contexts/kb.ts` rejects a `ki repo conform` line and a rewriting flag and nothing else, so a scoping flag on the same line passes GATE-1 as it stands. The mechanism came from [KI-HARNESS-GOV-109 (pruned)](https://github.com/knowledgeislands/ki-agentic-harness/blob/6387e0d29ff3d75cb20bcae042342df1c1752f77/docs/roadmap/KI-HARNESS-GOV-109-fail-when-commit-gates-absent.md). No decision record in ki-principal's `Admin/Governance/Decisions/` mentions the hook. There is no hook template in tools-ki or under the `ki-repo-*` skills; each repository's stub is its own file, and the ADR says "Adding a stub to a repository is that repository's change, raised as a receiver-owned trade".

**Who else runs it.** No other island has a `.githooks/pre-commit`: er-principal, hnr-principal, legal-principal, personal-principal, si-principal, tmx-principal, va-principal and hnr-shared all lack one, and HOOK-1 is still a warning. The only other hook in the estate is the harness's own, and it is the precedent for scoping: `ki-agentic-harness/.husky/pre-commit` reads the staged paths with `git diff --cached --name-only --no-renames --diff-filter=ACMDT`, runs `tsc` only when a `.ts` file is staged, and runs `ki repo audit --skill ki-skills` only when something under `skills/` is staged, against a focused snapshot built with `git checkout-index` so that "moving a governed file cannot hide its original scope". The harness already treats the audit as a staged-triggered check with set-level siblings included.

**Staged scoping in `ki repo audit` today: none.** The command takes `--skill`, `--progress`, `--progress-style`, `--reporter-levels` and `--concise` only. It resolves the skill and its overlays, so `--skill ki-repo-kb` also runs `ki-repo-kb-streams`, `ki-repo-kb-activities` and `ki-repo-kb-live-artifacts`; the failing criterion STREAM-9 belongs to the streams overlay. Each rubric context builder receives one repository root and walks it, as `collectKbAuditEvidence(target)` does in `kb.ts`. Every finding already carries a repository-relative `path` (`tools-ki/src/core/rubric/index.ts` line 28), rendered after the criterion, as in `fail [upward-only registry notes (STREAM-9)] Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md`. There is no machine-readable reporter, so a hook cannot filter the output safely without parsing the rendered tree.

**The smallest addition.** A `--staged` option on `ki repo audit` that keeps evaluation whole-tree and filters at the verdict: the index's staged set is read from Git, every criterion still runs over the whole tree, and a FAIL counts against the exit code only when its finding path is a staged path, a path deleted in the index, or a directory that contains a staged path. Findings outside the set are still rendered, labelled pre-existing, and do not fail the command. A sibling `--paths <path>...` taking an explicit list gives CI and a pre-push hook the same filter over a commit range. No rubric script in the harness changes, because filtering happens in tools-ki after the scripts return their findings.

**Criteria that are inherently repository-wide** and therefore cannot be judged from one file, which is why evaluation must stay whole-tree and only the verdict is scoped: RUBRIC-1 and CONFIG-0 to CONFIG-5 (configuration and catalogue), ZONE-1 to ZONE-4 (zone layout, same-name index notes, memory root, staging areas), ADMIN-1 to ADMIN-3, MEM-2, GATE-1, STREAM-1, STREAM-2 and STREAM-8 (areas, legacy folders, issue ledger), STREAM-6 (unique roadmap identity across all records), STREAM-10 (a Project's close-out depends on whether any record anywhere is open) and LINK-1 (wikilink resolution needs every target). The per-file criteria are NOTE-1 and NOTE-4 (frontmatter and mirrors), ZONE-5 and ZONE-6, STREAM-7 (record frontmatter) and STREAM-9 (registry notes). The directory-containment rule above is what lets a tree-wide finding still block when the staged change caused it: deleting a folder's index note stages a delete under that folder, so the ZONE-2 finding on the folder is in scope; staging a duplicate record identifier puts the STREAM-6 finding on the staged file.

**What keeps the whole-tree audit honest once the hook stops running it.** CI already does: `.github/workflows/ci.yml` installs the pinned released `ki`, registers the checkout and runs the full `ki repo audit --repo .` on every push to `main` and every pull request. ki-principal commits go straight to `main`, so CI is detection after the push rather than prevention, which is the right place for a tree-wide verdict that no single committer caused. The `Admin/Governance/Conformance.md` note already states that "mechanical conformance is checked through `ki repo audit --repo .`". The Tending activity's scheduled Health Check automation in `Admin/Operations/Activities/Tending Activity.md` is the natural second home if CI ever proves insufficient; nothing scheduled is needed now. A pre-push hook running the whole-tree audit would not help: after pulling, every pusher's tree contains the committed failing note, so it would spread the block rather than contain it. A pre-push hook running `--paths` over the pushed range is the one useful form, and it is optional.

**The two gaps.** A staged-only verdict lets through drift in committed files that a later standard change or another machine's push introduced, which the whole-tree hook catches today by blocking everyone; under the design that drift surfaces in CI on `main` and the full audit instead, and the committer is never blocked by a file they did not touch. The whole-tree hook, in the reverse direction, catches nothing that the staged verdict misses for the committer's own change, because evaluation stays whole-tree and the containment rule keeps caused findings in scope; what it does is block every thread for one thread's note. The live case shows the point: commit `9b852d8` on `sol` changed the mac-studio-bootstrap note itself, so under `--staged` the hook would have refused that commit on `sol`, and no other thread would have been blocked.

**Recommended design.** Pre-commit: lint-staged, syncpack, then `ki repo audit --repo "$root" --skill ki-repo-kb --staged`. Pre-push: none. CI: unchanged, whole-tree on push to `main` and pull requests. Scheduled: none now; the Tending Health Check is the fallback. Ownership: tools-ki owns `--staged` and `--paths` in the audit, a product change needing a `KI-TOOL-KI-CLI` record and Kris's acceptance; the harness owns one sentence in `standards-knowledge-base.md` GATE-1 saying a Knowledge Base hook may scope the audit's verdict to the index while the whole-tree verdict stays with CI, a standard change needing a `KI-HARNESS-GOV` record, with no checker change because `gate.ts` already accepts the flag; ki-principal owns its hook line and the `Conformance.md` sentence, which is a bounded owner instruction and needs no record. Rollout order matters: the tools-ki change must be in a released `ki` and the `.github/ki-version` pin bumped before the hook line changes, because the hook refuses to commit when the gate cannot run, and an unknown option is exactly that. Rollout to other islands: nothing to roll out, since none has a hook; when each adopts a stub through its receiver trade under ADR-017, it adopts the `--staged` form, and the harness's GATE-1 sentence is what carries the shape to them.

**Alternative.** No tools-ki change: the hook runs the audit, captures its output, and compares the paths in `fail [` lines with the staged set, failing only on a match. It needs no release and could ship today, but it parses a rendered tree that has no stability promise, so it would break silently on the next reporter change, and it cannot apply the directory-containment rule without re-implementing it in shell. Not recommended beyond an interim.

**Not changed.** The committed note `Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md` still fails STREAM-9, so the gate is still blocked in this checkout. This report is therefore left uncommitted under the thread's path; the commit rules in the run packet forbid `--no-verify`, and the Rules section forbids pushing, so the packet's "pull and push if fast-forward" line was not followed.

### In Progress

Nothing is running.

Outstanding - no action requested now:

- This report, `+/_THREADS/ways-of-working/gate-scope.report.md`, waits uncommitted for the gate to pass; the commit-gate report's open GATE-FIX query already asks the mac-studio-bootstrap thread to reword its note, which is the interim relief until `--staged` ships.
- The `+/_CHECKPOINTS/README.md`, `decisions.md` and other report files listed by the commit-gate run are still uncommitted in this checkout for the same reason. None was touched by this run.

### Queries

#### GATE-SCOPE - adopt the staged-verdict design and open its two records

**Context:** The hook audits the whole tree because `ki repo audit` has no narrower scope, not by decision. A `--staged` option in tools-ki that keeps evaluation whole-tree and scopes only the verdict to staged, deleted and containing paths unblocks unrelated threads while still refusing the commit that causes a finding. CI already runs the whole-tree audit on every push to `main`. The change needs a tools-ki product record and a one-sentence harness standard record; ki-principal's hook line and Conformance sentence need no record. The hook must not change until the released `ki` pin carries the option.

**Query:** Do you accept the recommended design and authorise the two records to be opened?

**Options:** a) (recommended) Accept: open a `KI-TOOL-KI-CLI` record in tools-ki for `--staged` and `--paths` on `ki repo audit` with verdict-only scoping and the containment rule, open a `KI-HARNESS-GOV` record for the GATE-1 sentence in `standards-knowledge-base.md`, and after release and pin bump change ki-principal's hook line and the Conformance sentence under this instruction. b) Interim only: change the hook to filter the rendered audit output in shell against the staged set now, with no tools-ki or harness change, and revisit when it breaks. c) Keep the whole-tree hook; rely on GATE-FIX and on each thread conforming its own notes before pushing.

```text
GATE-SCOPE

Accept the staged-verdict design. Open a KI-TOOL-KI-CLI record in tools-ki for --staged and --paths on ki repo audit, whole-tree evaluation with the verdict scoped to staged, deleted and containing paths, pre-existing findings rendered but not failing. Open a KI-HARNESS-GOV record for one sentence in ki-repo-kb standards-knowledge-base.md GATE-1 allowing a Knowledge Base hook to scope the audit verdict to the index while CI keeps the whole-tree verdict. Once the released ki pin carries the option, change ki-principal's .githooks/pre-commit audit line to add --staged and update the Conformance.md sentence under this instruction; CI stays whole-tree and nothing scheduled is added.
```

```text
╭─ issued 2026-10-14T18:35:00Z ────────────────────╮
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
╰──────────────────────────────────────────────────╯
```

- [at rest] nothing running or queued
- [waiting] GATE-SCOPE
- [blocked] this report's commit by the gate, STREAM-9 on the mac-studio-bootstrap note

```text
Resume ways-of-working under current ki-pmo and ki-delegation since 2026-10-14T13:58:48Z: re-bootstrap, mark, fresh summary with carried-forward open points, take stock, restart authorised work, then banner.
```
