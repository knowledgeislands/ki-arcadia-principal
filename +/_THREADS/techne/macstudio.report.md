# macstudio report - 2026-10-08

## Done

- [KI-ARCADIA-GOV-033](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md) is captured and at `awaiting-review`, not accepted. It applies Decision 14: the Mac Studio is an exempt remote agent host outside the hold, treated like the agent host.
- [GDR-KI-ARCADIA-004](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Governance/Decisions/GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold.md) and the [Techne Programme Hold](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Governance/Policies/Techne%20Programme%20Hold.md) are amended in place. Both use roles ("the island owner"), not names. A new "Owned remote agent host" bullet covers what is in scope, how it differs from the cloud host, the kill switch, teardown and the FileVault constraint. Bounds now read one cloud host plus one owned host. Neither file was dirty before the edit.
- The [mac-studio-bootstrap checkpoint](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/+/_CHECKPOINTS/mac-studio-bootstrap.md) has a 12-step remote runbook in place of the old first-steps list. Each step is marked SSH, SSH + Kris or Screen, and cites the chezmoi, Rig, tools-ki, tools-mgit and homebrew-tap guides. It includes the `tailscaled` replacement step and the FileVault caveat.
- Commits, pushed fast-forward to origin/main (ac79533..cf94cd5; there were no other commits upstream): 81a1d23 (reserve GOV-033), ff54792 (exemption), 2fc2007 (runbook), cf94cd5 (checkpoint heading fix).
- Checks: `ki repo audit --repo .` PASS=22 WARN=2 FAIL=0. The two warnings, CI-1 and HOOK-1, predate this work. No en-dashes or em-dashes were added. Nothing on the Mac Studio was contacted.

## Failed

- None. Two audit failures came up along the way and were fixed. A Decision Record may not link to a work record, so GDR-KI-ARCADIA-004 does not cite GOV-033. A checkpoint subheading broke the checkpoint schema; it was fixed in cf94cd5. Commit 2fc2007 went in before that fix.

## Needs Kris

- Review and accept or return [KI-ARCADIA-GOV-033](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-GOV-033-exempt-the-mac-studio-as-a-remote-agent-host.md).
- Tailscale conflict: Rig declares the Tailscale GUI app (`tailscale-app` cask) for every machine. A later `rig apply` would reinstall it after the `tailscaled` swap. The chezmoi Rig declaration needs a Mac Studio exception before runbook step 11. No record has been raised for this yet.
- Runbook step 11 (the GUI-to-daemon swap) drops the tailnet route while it runs. It needs Kris at the machine or on its local network, and the new node must be renamed `sol` with key expiry disabled again.
- After any restart, FileVault keeps the Mac Studio offline until it is unlocked in person.
- The [Project note](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Projects/mac-studio-bootstrap.md) still says the Mac Studio is attended-only and outside agent-host; it was left unchanged.
