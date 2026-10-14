# banner-letters report - ways-of-working run

Design only. Two design notes amended, committed and pushed; no skill, record, checkpoint or protected-zone edit.

## What has been done

- Amended [thread-banner-and-re-anchoring](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-banner-and-re-anchoring.md): section 1 now mocks REST, BUSY and DONE in the `ki-recap` frame with four-letter block words in `ki-recap`'s glyphs (each framed line verified at 52 columns), label and running, queued and waiting lines below the frame, a housekeeping line, and the resume line. No evidence line cites a decision by number; the mark is cited by time and the mark unit row reads "decisions logged to <UTC of last entry>". The resume line's steps are re-bootstrap, mark, fresh summary since the mark with carried-forward open points, take stock, restart work given since, then banner; "re-output the summary it last gave" is gone from section 1, section 5, the re-anchoring text and the red-x recovery steps. BANNER-FRAME and AT-REST are settled quoting Kris; a new CLOSE-TIDY query asks Kris to confirm the four tidy steps DONE requires.
- Aligned [thread-types-and-durable-decisions](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/ways-of-working/design/thread-types-and-durable-decisions.md): conversational ends DONE; coordination and state-of-play alternate BUSY and REST and reach DONE only at Project or territory close after the tidy. CLOSED is removed from the type table, section 2.2, the promotion table, the unit model, the pending-records notes and the reply block; CLOSE-BANNER is settled quoting Kris verbatim.
- Committed as `docs(design): settle banner letters REST, BUSY and DONE and the fresh-summary resume line` (ki-principal `1baba54`), explicit paths, co-author trailer naming Claude Fable 5.1. `git pull --rebase` conflicted with the Master's upstream commit `e3ef135` (which replaced "Decision 175" with dates in the same note); resolved by keeping the upstream date wording and adding this run's text. Push to `origin/main` was fast-forward.
- Checks: `rumdl check` clean on both files; pre-commit rumdl and KI repo audit passed (two pre-existing STREAM-10 warnings on the `paperclip-bootstrap-and-recovery` and `website` Projects, unrelated); no en or em dash; no "Decision <N>" citation remains in either note.

## Three mock banners and the resume line, verbatim

### REST

```text
╭──────────────────────────────────────────────────╮
│  █▀▀▄ █▀▀▀ █▀▀▀ ▀▀█▀   · thread at rest          │
│  █▀▀▄ █▀▀  ▀▀▀█   █    · nothing running         │
│  █  █ █▄▄▄ ▄▄▄█   █    · nothing queued          │
╰──────────────────────────────────────────────────╯
   KI Model: ways-of-working · mark 2026-10-13T04:03Z
   waiting on you: KI-RELEASE, RESUME-COMPACT
   checkpoint committed and pushed · banner 2026-10-14T09:04Z · held: PAPERCLIP-REQ until Wave F · parked: 1
```

```text
Resume KI Model: ways-of-working under ki-delegation since 2026-10-14T09:04Z: re-bootstrap, mark, fresh summary since the mark with carried-forward open points, take stock, restart work given since, then banner.
```

### BUSY

```text
╭──────────────────────────────────────────────────╮
│  █▀▀▄ █  █ █▀▀▀ █  █   · thread busy             │
│  █▀▀▄ █  █ ▀▀▀█  ▀█▀   · running or queued work  │
│  █▄▄▀ █▄▄█ ▄▄▄█   █    · lines below say which   │
╰──────────────────────────────────────────────────╯
   KI Model: ways-of-working · mark 2026-10-13T04:03Z
   running: harness-push
   queued: mark-tidy, apps-sweep, principal-enact
   waiting on you: KI-RELEASE, RESUME-COMPACT
   checkpoint committed, 1 commit unpushed · banner 2026-10-14T09:04Z · held: PAPERCLIP-REQ until Wave F · parked: 1
```

```text
Resume KI Model: ways-of-working under ki-delegation since 2026-10-14T09:04Z: re-bootstrap, mark, fresh summary since the mark with carried-forward open points, take stock, restart work given since, then banner.
```

### DONE

```text
╭──────────────────────────────────────────────────╮
│  █▀▀▄ █▀▀█ █▄ █ █▀▀▀   · project closed          │
│  █  █ █  █ █ ██ █▀▀    · decisions promoted      │
│  █▄▄▀ █▄▄█ █  █ █▄▄▄   · thread tidied away      │
╰──────────────────────────────────────────────────╯
   KI Model: ways-of-working · closed 2026-11-02T16:10Z
   decisions: every entry logged since 13 October promoted, none held
   design folder resolved · checkpoint retired · run archived
   outcome: the Project note links the Decision Record on thread working and the ki-pmo standard
```

No resume line follows DONE: there is nothing to resume, and reopening the Project is a new opener from the state-of-play thread.

### RESTORE-HOME - where the rule lives

- Summary: `ki-delegation` Coordination plus every rules footer, and a core subsection in the `ki-engineering` standard; Rig and chezmoi cite it.
- Need from you: approve the two homes.
- Recommendation: approve. Both runtimes load both skills, and the footer puts it in front of every background agent.

### HOOK-RUNTIME - telling Claude from Codex

- Summary: the hook skips `has_terminal` when `CLAUDECODE` is set; Codex keeps it until `KI_AGENT_RUN` ships in the KI-RELEASE.
- Need from you: approve the environment-variable split.
- Recommendation: approve. The variable is present in this session and in Zed; the test suite fakes it.

### RESUME-COMPACT - does the resume line also compact

- Summary: `/compact` ends the turn, so it cannot sit on the resume line; the option is an optional `/compact <keep list>` first paste, with the Zed pass-through test in section 5.1.
- Need from you: choose one of: resume line alone (default), optional first paste when the thread is long, or always compact first; and whether you run the Zed test or want it left until the hook change ships.
- Recommendation: optional first paste, your call per resume. Run the Zed test once in a throwaway thread; it takes two minutes and settles whether Codex and Claude threads in Zed can be compacted by paste at all.

### SURFACE - where cross-session work shows

- Summary: a backend reply is not visible progress; messages reach you through the thread's next owner turn (a `Messages` line in Summary), the checkpoint, a one-line thread status file, and later a notification under KI-PRINCIPAL-ECO-012.
- Need from you: approve the rule and the four surfaces, and say whether the thread status line is worth the tools-ki follow-on to list threads beside runs in `ki agent status`.
- Recommendation: approve. The rule stops a thread calling a handoff done because another backend said so; the status line costs one write per report and gives `ki agent status` a view of live threads without Zed.

### REDX - recovering a thread showing a red x

- Summary: paste the thread's resume line into the same Zed thread; if Zed will not send, open a new thread in the same folder and paste it there; the thread reports what it missed and marks the banner `recovered`.
- Need from you: approve the procedure, or say a red x thread should always be replaced by a new one.
- Recommendation: approve. The same-thread paste keeps the transcript where it was; the checkpoint and inbox make the new-thread fallback lossless either way.

```text
RESUME-COMPACT - optional first paste; run the Zed test
SURFACE - approve the rule and the four surfaces; status line yes
REDX - approve the procedure
RESUME-GUARD - keep the thread name on the line
CLOSE-TIDY - confirm the four tidy steps
INBOX - approve the inbox channel and session naming
RESTORE-HOME - approve ki-delegation and ki-engineering
HOOK-RUNTIME - approve the CLAUDECODE split
```

## In progress

Nothing. Status file ends DONE.

## Outstanding queries

### CLOSE-TIDY - what the close-out tidy contains

- Summary: DONE is shown once, after the tidy: every logged decision promoted to its home, the design folder resolved, the checkpoint retired, the run archived by `ki agent close`.
- Need from you: confirm those four, or add to them.
- Recommendation: confirm. The thread-types note's Project close row lists the same four and `ki agent close` can gate each.

### REST-SCOPE - open queries under REST

- Summary: following "a coordination thread can either be busy or at rest", REST now means only that nothing runs or is queued; open Needs tags, an uncommitted checkpoint and unlogged decisions show on the lines below the frame but do not make the thread BUSY. The earlier draft made them block AT REST.
- Need from you: confirm that reading, or say an open query should keep the thread BUSY.
- Recommendation: confirm. A thread waiting only on you is not working, and the waiting line says so.

```text
CLOSE-TIDY - confirm the four tidy steps
REST-SCOPE - confirm: open queries do not make a thread BUSY
```
