# ready-28 report

**Done**

- TECHNE-TOOLS-OPS-022 is `ready`; the plan records Kris's approval, including the daily 04:00 restart timer (Decision 28). `ki-techne-harness` commit 3659997.
- TECHNE-TOOLS-OPS-015 is `ready`. `converge.sh` now checks `target_host` against the host name (`host.hostname` from `status.sh`), not `host.id`. Same commit, 3659997.
- DOTFILES-UE-073 is `ready`. It also checks `target_host` against the host name. The open point is resolved: a host manifest no longer has to change after a rebuild. The manifest file takes the host's name, which is `ki-techne-agent-host` today. chezmoi commit d2500e6.
- The Arcadia checkpoint `+/_CHECKPOINTS/techne.agent-host.md` is current: all three plans are ready, the reboot window is daily, and Kris's choice of host name is the first open question. `ki-arcadia-principal` commit cad1f76.
- Checks: `ki repo audit` reports FAIL=0 in all three repositories. The warnings were already there: ki-techne-harness WARN=2, chezmoi WARN=2 (matching its baseline), ki-arcadia-principal WARN=3. `rumdl` is clean on every changed file. Nothing was pushed. Another session's uncommitted DOTFILES-UE-079 change in chezmoi was left alone.

**Needs the owner**

- Choose the agent host's name, in the celestial convention.
- Until the host is rebuilt, its OS still reports the AWS default name, `ip-10-90-0-40`. A payload for it must either leave out `target_host` or name `ip-10-90-0-40`. Both plans now say this.
