# quotes-fix - owner report (2026-10-14)

## What has been done

- Kris's quoted words were restored verbatim from the session transcript by a `python3 -I` script at `/Users/krisbrown/.local/state/ki/agents/ways-of-working/quotes-fix-work/fix_quotes.py`, under the approval "FIX-QUOTES - approve the scripted correction from the transcript." The script extracted 41 genuine user text turns (one skipped as private: it matched a legal marker), aligned every double-quoted span in the target files to a source turn as a token subsequence, and replaced only clean subsequence matches at ratio 0.65 or above (0.80 for spans under six tokens). No model read the user turns; nothing is paraphrased. The proposal table with every span, status, ratio and source timestamp is `/Users/krisbrown/.local/state/ki/agents/ways-of-working/quotes-fix-work/proposals.md`.
- Replacements applied: 41 spans across eight files. Spans already verbatim: 32. Spans left untouched: 202 unmatched (not Kris's words, or no clean source) and 32 too short to align. Nine spans aligned to a source but fell below the threshold and were left as they were (three in the design decisions file, six in the report).
- Decisions log `/Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md`: five quotes in Decision 25 restored; a dated note records the restoration and the approval. The stale "quoted as received" sentence in the design decisions file was likewise updated to say the words were restored from the transcript.
- Spot-checks by file read: PILOT-SCOPE and COORD-DEFAULT in the design decisions file (lines 9 and 10) and Decision 25 in the log now carry Kris's full sentences, including the query titles he answered under.
- Commits (explicit paths, trailer per standard):
  - ki-principal `b37a91f` docs(design): restore Kris's verbatim words from the session transcript - pushed fast-forward to origin.
  - tools-ki `71aaef7` docs(roadmap): restore Kris's verbatim words in KI-TOOL-KI-CLI-124 - pushed fast-forward to origin.
  - ki-agentic-harness `49fde031` docs(roadmap): restore Kris's verbatim words in KI-HARNESS-GOV-179 and KI-HARNESS-GOV-180 - local only, under PUSH-HARNESS.
- Pre-commit hooks passed in all three repositories. Audits: no new FAIL. Pre-existing failures unrelated to the touched files remain: ki-principal, the Observatory checkpoint lifecycle; harness, Biome on the other session's dirty TypeScript, the .ki.toml table order and the rubric catalogue; tools-ki, knip and the rumdl dependency window.
- Records touched, verified paths:
  - [KI-HARNESS-GOV-179](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-179-diagram-html-commit-opt-in.md)
  - [KI-HARNESS-GOV-180](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-180-tracked-thread-decisions-home.md)
  - [KI-HARNESS-GOV-177](/Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/roadmap/KI-HARNESS-GOV-177-browser-free-svg-extractor.md) - its two quotes were already verbatim; no change.
  - [KI-PRINCIPAL-ECO-013](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md)
  - [KI-PRINCIPAL-ECO-014](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-014-decision-citation-and-run-folder-sweep.md)
  - [KI-TOOL-KI-CLI-124](/Users/krisbrown/workspaces/knowledge-islands/tools-ki/docs/roadmap/KI-TOOL-KI-CLI-124-agent-run-close.md)
  - [change-management-decisions](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-decisions.md) and [change-management-report](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/change-management-report.md)

## What is in progress

Nothing running.

Outstanding - no action requested now:

- Harness push held (PUSH-HARNESS): the three commits named in the brief are now on origin, but `main` still carries one other-session commit not on origin, `df08e1e5` feat(ki-repo-harness): generate a skill map beside the skill graph, ahead of mine. Per Kris's words "wait for the other session; push ours once its commits land", `49fde031` stays local until that commit lands. The harness working tree also has that session's uncommitted skill-graph and rubric files; untouched.
- Verification limitation: the Bash tool's output reaches me through the same proxy, so console views of file text are themselves compressed; the spot-checks therefore used the file-read tool, which was not compressed.
- Retained defect, not mine to fix mechanically: the design decisions file has a pre-existing splice on its line 49, where entry 30 (EXTRACT-PIN / EXPORT-ROUTE) was inserted mid-sentence into entry 29 (ACCEPT-177), leaving "was accepte30." and a dangling tail "...no install.s `EXPORT-ROUTE`; the deliver record is opened against whichever route Kris chooses." The missing words of entry 29 cannot be recovered by script.
- Unmatched quotes in Decision 17 of the log and in prose attributed to Kris without double quotes were out of the scripted scope (quoted spans only); they stand as written.

## Outstanding queries

### SPLICE-29 - repair the spliced entries 29 and 30 in the design decisions file

- Summary: line 49 of `change-management-decisions.md` holds entry 30 inside entry 29's final sentence, so entry 29's ending and the start of entry 30's tail sentence are lost. The file is otherwise consistent and now verbatim.
- Need you: permission for a bounded manual repair of those two entries, and whether the tail sentence ("the deliver record is opened against whichever route Kris chooses") should be deleted as superseded by EXPORT-ROUTE (a).
- Recommendation: approve the repair; delete the superseded tail, close entry 29 with "was accepted through `ki-accept`." and keep entry 30 as it stands.

```text
SPLICE-29 - approve the bounded repair; delete the superseded tail sentence.
PUSH-HARNESS - still held; push 49fde031 once df08e1e5 lands on origin.
```
