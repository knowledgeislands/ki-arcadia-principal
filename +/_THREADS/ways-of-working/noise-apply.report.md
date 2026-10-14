# noise-apply: Kris's signal-and-noise answers applied

Run `ways-of-working`, agent `noise-apply`, 2026-10-14. Authority: Kris's words in the [decisions log](</Users/krisbrown/.local/state/ki/agents/ways-of-working/decisions.md>), verified by file read: "PROMPT-PROTECT - (a), plus the two (c) rules in ki-delegation." "COORD-STYLE - (c) in the pilot; (a) now." "HOOK-LINE - (b)." "CODEX-NOISE - (a) and (b)." "PUSH-HARNESS - wait for the other session; push ours once its commits land."

## What has been done

### PROMPT-PROTECT (a)

- `HEADROOM_COMPRESS_USER_MESSAGES=0` is declared for the `init-user` profile in the chezmoi source, in the two places that hold the profile's arguments today: the install command in the [Headroom guide](</Users/krisbrown/.local/share/chezmoi/docs/guides/tools/headroom.md>) and the shell export file `dot_zsh/50_headroom`.
- [KB-DOTFILES-UE-087](</Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-087-manage-headroom-profile-arguments.md>) has a dated Discussion entry quoting the decision; it stays in `triage`, because two declaration sites are still not the single declared source that record asks for.
- `chezmoi diff` showed only the intended lines on `~/.zsh/50_headroom`, `~/.claude/communication.md` and `~/.codex/AGENTS.md`; `chezmoi apply` on those three targets left an empty diff.
- The proxy needs a restart. The running proxy reads the variable once at start from `~/.headroom/deploy/init-user/run-headroom.sh`, which Headroom writes and which still lacks the export. See `RESTART-PROXY` below. Nothing was restarted.
- `KB-DOTFILES-UE-086` was not touched; the chezmoi checkout was clean of it when this run began.

### PROMPT-PROTECT (c) rules

- The [background-run standard](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/skills/governance/ki-delegation/references/standards-background-runs.md>) Decisions log section now carries two rules: log an owner decision in the turn it arrives, while that turn is still uncompressed; and verify any later quotation of the owner's words against the transcript file read with the file-read tool, never from in-context recall or shell output.

### COORD-STYLE (a) now, (c) recorded

- The standard's Reporting section opens with one sentence: an owner report, in every form including the full summary, is a complete deliverable whose sections, queries and reply block are never shortened by any output style, proxy shaping block or communication level.
- The chezmoi sources of `~/.claude/communication.md` and `~/.codex/AGENTS.md` each carry a one-line pointer to that rule.
- [KI-PRINCIPAL-ECO-013](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Roadmap/KI-PRINCIPAL-ECO-013-pmo-extraction-pilot.md>) gains scope item 7, the harness-shipped coordinator output style selected per repository, quoting "COORD-STYLE - (c) in the pilot; (a) now", with its first check as an open question: whether a project-level `outputStyle` overrides the user-level one.

### HOOK-LINE (b)

- The line in [coordinator-reminder.sh](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/hooks/coordinator-reminder.sh>) now ends "Give a timestamped one-line update when you launch, when an agent finishes and while you wait, and report in owner-report form." The test, the hooks README and HARN-012 in the [harness specification](</Users/krisbrown/workspaces/knowledge-islands/ki-agentic-harness/docs/specs/harness.md>) say the line restates the rules, including cadence, and names the form without restating it. A matching `Cadence` rule was added under Coordinator responsiveness in the standard, so the hook restates a rule the standard owns.
- The README and HARN-012 verify command was corrected from `bun hooks/coordinator-reminder.test.ts`, which Bun refuses outside its test runner, to `bun test hooks/coordinator-reminder.test.ts`.
- No chezmoi change was needed: the Codex trust hashes in `config.toml` cover the handler entry in `hooks.json`, not the script contents, so the registration and hashes are unchanged and still valid.
- Verified by hand with a terminal in the hook's ancestry: a coordinating checkout gets the new line; with `KI_AGENT_RUN` set, or in an ordinary repository, the hook prints nothing. The replay suite passes, 11 tests.

### CODEX-NOISE (b)

- `chezmoi source-path ~/.codex/instructions.md` answers "not managed", so there is no chezmoi source; the file was edited in place.
- The "Headroom Learned Patterns" block was the whole file: 18 lines removed, nothing else in it. The file now exists with zero bytes.

### Verification

- Harness: `bun run test` 1107 pass, 0 fail; `bunx tsc --noEmit` clean; `ki repo audit --skill ki-delegation` PASS; `--skill ki-specs` PASS. `ki repo audit --repo .` reports one FAIL that predates this run and is not in a touched path: `.ki.toml` FILES-10, `[skills.ki-trades]` must be the last table, introduced when `[skills.ki-diagrams]` was appended after it in commit `a85d0062`.
- chezmoi: `node --test tests/*.test.mjs` 226 pass, 2 skipped, 0 fail; `ki repo audit --repo .` FAIL=0 after I removed a cross-collection link my guide edit had introduced (GUIDE-4). The chezmoi repository has no Git hooks of its own; its tests are the check it declares.
- ki-principal: `ki repo audit --repo .` FAIL=0.

### Commits

- `ki-agentic-harness` `12c791b7` feat(hooks): add the coordinator cadence clause and protect owner reports. Local only, under the push hold.
- chezmoi `881d529` feat(headroom): keep user turns whole and protect owner reports. Local only: `647e137` from another session is unpushed ahead of it, so pushing would publish a commit I did not make.
- `ki-principal` `9b45c0d` docs(roadmap): record COORD-STYLE (c) against KI-PRINCIPAL-ECO-013. Pushed fast-forward; level with `origin/main`.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- Receiver-owned: the harness push hold. `git fetch` shows `main` ahead of `origin` by twelve commits, of which eleven are from other sessions: the three named in the brief plus `626c89a0`, `b1e3375b`, `ae645d01`, `e88725eb`, `3a4f5447`, `342e14ab`, `5b436748` and `464e3257`. Mine is `12c791b7`.
- Receiver-owned: chezmoi has another session's unpushed `647e137` and an untracked `dot_config/rig/conf.d/private_56-firewall.toml`; both left alone.
- Verification limitation: the harness `.ki.toml` FILES-10 failure above is pre-existing and untouched.
- Retained: the decisions log gained Decisions 27 and 28 during this run; neither is in this brief and no new work record was created, in keeping with Decision 28's "Create no new feature records".

## Outstanding queries

### RESTART-PROXY - restart Headroom so the new variable takes effect

Summary: the declaration is in the chezmoi source and the shell export, but the running proxy was started by Headroom's own `run-headroom.sh`, which does not export `HEADROOM_COMPRESS_USER_MESSAGES`. Until the profile is re-applied and restarted, earlier user turns are still compressed. The guide says an agent routed through the proxy must not restart it, so this stayed with you.

Need from you: run the guide's `headroom install apply` command, now carrying `--env HEADROOM_COMPRESS_USER_MESSAGES=0`, from a terminal not routed through the proxy, then confirm `grep COMPRESS ~/.headroom/deploy/init-user/run-headroom.sh` and that the next proxy start logs `compress_user=False`.

Recommendation: do it at the next natural break between sessions, since the restart severs every routed session.

### PUSH-CHEZMOI - publish the chezmoi commit

Summary: chezmoi `881d529` is local. Pushing would also publish `647e137` from another session, which this run may not do.

Need from you: say whether to push both, or leave it for the other session.

Recommendation: push both once that session confirms `647e137` is complete.

### PUSH-HARNESS - harness push hold

Summary: `12c791b7` sits on top of eleven other-session commits. Your instruction stands: "wait for the other session; push ours once its commits land."

Need from you: nothing until the other session pushes; then an instruction to push.

Recommendation: keep the hold.

### DEFAULTS - defaults unless you say otherwise

- `~/.codex/instructions.md` is left as an empty file rather than deleted.
- `KB-DOTFILES-UE-087` stays in `triage` with its Discussion entry, not advanced.

Need from you: nothing, unless you object.

Recommendation: keep the defaults.

```text
RESTART-PROXY - re-run the guide's headroom install apply command from an unrouted terminal and restart the proxy.
PUSH-CHEZMOI - <push both 647e137 and 881d529 / leave for the other session>.
PUSH-HARNESS - keep the hold; push 12c791b7 once the other session's commits land.
DEFAULTS - keep the defaults.
```
