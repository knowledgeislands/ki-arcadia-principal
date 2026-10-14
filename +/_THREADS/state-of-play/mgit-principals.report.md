# tools-mgit --principals selector — report

**Done**

- `mgit --principals` selects the territory Capitals through `ki territory roots --null --principals` and keeps ki's order (Knowledge Islands Principal first, then the rest alphabetically). It can't be combined with `--estate` or `--territory`, works with `--filter`, `-W`, `sync` and pass-through, and is refused wherever `--estate` is.
- Help, Bash/Zsh completion, man page, README, spec (MGIT-WS-006/022/023), running-commands guide and changelog updated.
- Record [KI-MGIT-CLI-016](/Users/krisbrown/workspaces/knowledge-islands/tools-mgit/docs/roadmap/KI-MGIT-CLI-016-principals-selector.md) is `awaiting-review` with its review packet (not accepted).
- Commits fast-forwarded to `main` and pushed (ac1b66c..8aab359): 8251307 (reserve CLI-016), c062410 (plan), 90decfe (feature), 8aab359 (submit review). No release, version bump or Homebrew publish.
- Checks: shellcheck, bash -n, mandoc lint and diff check passed; `bats tests/` 93/93; with the committed tools-ki main (0e8b317) as `MGIT_KI_PRODUCER`, 93/93 with zero skips, including a new real-producer principals proof; `ki repo audit` on main is clean (PASS=18, FAIL=0). A read-only live listing returned all eight Principals in order (ki, er, hnr, legal, personal, si, tmx, va).

**Needs the owner**

- The installed `ki` doesn't have `--principals` yet, so `mgit --principals` fails until a ki release containing KI-TOOL-CLI-119 is installed. To try it now with the committed ki: `cd ~/workspaces && PATH="$HOME/workspaces/knowledge-islands/tools-ki/bin:$PATH" ~/workspaces/knowledge-islands/tools-mgit/bin/mgit --principals status`. The installed mgit (0.16.0) also predates this change; `mgit --principals` works once both a ki and an mgit release are installed.
- Review and accept KI-MGIT-CLI-016.
