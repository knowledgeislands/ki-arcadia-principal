# Rig vocabulary note — report

Decision 8 (2026-10-09). Commit `5d6f43a` in the chezmoi repository (local only, not pushed).

## Done

- Updated `dot_claude/private_communication.md` → `## Vocabulary`: added a new Rig paragraph that says to resolve garbles by context, and listed the observed chezmoi garbles in the existing paragraph.
- Applied `~/.claude/communication.md` alone; `chezmoi diff` for it is now empty.
- Checks: `ki repo audit --repo .` PASS=19 WARN=2 FAIL=0. Both warnings were already there: no pre-commit hook, and the arcadia territory registry is unavailable. `node --test tests/*.test.mjs` 174 pass, 0 fail, 2 skipped. `rumdl check .` clean.

## Garbles found

Sources: 880 transcripts and about 3,000 distinct user turns. A turn counted for Rig only when the assistant's reply around it was about Rig. Counts are distinct utterances, approximately, because some turns are repeated in summaries.

| Meant | Heard as | Utterances |
| --- | --- | --- |
| Rig | big ("big doctor findings", "big apply", "big export", "big tooling", "big initiative", "big JSON") | ~7 |
| Rig | wig ("tools wig", "Wig Export", "local wig", "through wig") | ~6 |
| Rig | Rick ("Rick deciding") | 1 |
| chezmoi | Shame Wa / Shamewa | ~6 |
| chezmoi | Cheyenne Wa / Wai / Wair | ~5 |
| chezmoi | Shane Wa / Wai | ~3 |
| chezmoi | Shame Wire / Shamewire | ~3 |
| chezmoi | Shame While | 1–2 |
| chezmoi | Chez Moir / Chez Moire | 2 |

No rigg, wrig, ridge, brig or grig forms were found in a Rig context.

## Failed

None.

## Needs Kris

None.
