# Agent host as Kris's working machine: review by codex

**Reviewer:** Codex · **Date:** 2026-10-07 · **Read-only:** yes

## Own view

A deliberately small personal profile, rendered on the Mac and delivered through the existing setup command, is a sound design. It preserves the separation between the harness's working environment and Kris's preferences without giving the host access to the full dotfiles source or 1Password. The useful contract is an explicit list of files, executables, versions and dependencies, with one writer for each destination.

The current sources materially change the proposed delivery. `DOTFILES-UE-020` has been cancelled with Kris's approval, and its resolution says to capture the host-profile slice afresh if the November review keeps the host. The design may retain its projection idea, but cannot treat the record as a stale hold to release. Any earlier delivery now needs an explicit owner decision.

I would also keep detached delegation outside the first pilot until its relationship with the session-only exemption is settled. The present `claude-bg` deliberately survives interruption of the launching session. A familiar working machine should first establish reliable tools, shell behaviour and instructions; adding background execution requires a clear supervision and termination rule.

## Fact check

Paths below are relative to the named repository or chezmoi source unless otherwise stated.

- The standing exemption covers one host's setup, updates and status, with a review on 2026-11-06 - confirmed. It has no automatic lapse and prohibits unattended or scheduled agents. Arcadia: `Admin/Governance/Policies/Techne Programme Hold.md:27-33`; `Admin/Governance/Decisions/GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold.md:26-30`.
- Recipe, binding and CLI ownership are separate - confirmed, but ADR-TECHNE-003's live home is Arcadia, not the harness's `docs/decisions/`. Arcadia: `Admin/Governance/Decisions/ADR-TECHNE-003-techne-implementation-ownership.md:38-41,59`. The harness scripts still contain person-specific fallback values: `ki-techne-harness/operations/aws/agent-host/setup.sh:10-17`.
- The stack installs zsh while creating the user with Bash - confirmed. `ki-techne-harness/infra/aws/agent-host-stack.yaml:269-282`. The addendum supersedes the brief's pending-rebuild wording; this local review cannot independently verify the actual rebuild, convergence results or live repository count.
- The convergence pins and competing configuration destinations are accurately described - confirmed. `ki-techne-harness/operations/aws/agent-host/host/converge.sh:8-13,131-133,172-178,341-358`; chezmoi: `dot_config/mise/config.toml:15-16`. Node `24` is a moving major selector, rather than an exact version. Installed Mac and host versions remain reported observations; the current `tools-ki/package.json` declares source version `0.8.3`.
- `mgit` supports the host's platform and layout; `ki` has a signed Linux installer - confirmed. `tools-mgit/README.md:19-37`; `tools-ki/README.md:194-202`. The `techne` installer supports Linux but is checksum-verified, not signature-verified: `tools-techne/install.sh:84,121-126`.
- Only GitHub and Claude credentials exist on the host - too categorical. The stack establishes AWS instance-role access and Tailscale authentication; the guide also requires interactive Codex login. `ki-techne-harness/infra/aws/agent-host-stack.yaml:171-196,305-310`; `ki-techne-harness/docs/guides/operator/agent-host.md:245`. The stated GitHub scope and unused model API key are confirmed at guide lines 25 and 207-222.
- `DOTFILES-UE-020` is held awaiting deleted prerequisites - superseded. It is now `cancelled`, resolution `rejected`, with owner-approved cancellation and conditional future recapture. Chezмoi source: `docs/roadmap/DOTFILES-UE-020-implement-cheztoi-profile.md:8-14,33-37`.
- The existing instruction projection omits `claude-bg` - confirmed. `ki-techne-harness/operations/aws/agent-host/setup.sh:34-42`; chezmoi: `dot_claude/private_delegation.md:5`. Its implementation also requires Perl and launches detached agents: `bin/executable_claude-bg:99-105`.
- Full-source application presents secret-resolution and ownership conflicts - confirmed. Chezмoi: `.chezmoitemplates/mcp-servers-json:57,67`; harness convergence destinations above. Rendering an allowlisted filename alone does not establish that its resulting contents are safe.

## Points

| Point | Mark | Reason and evidence |
| --- | --- | --- |
| 1 | Agree | Separate executable ownership from personal configuration, while declaring their dependencies together. |
| 2 | Agree | The ownership split fits the ADR. Exact baseline membership is a design choice, rather than an ADR requirement. |
| 3 | Differ | Mac-side projection remains sound, but UE-020 is cancelled and cannot supply a live delivery mandate. † |
| 4 | Agree | Avoid applying the full workstation source. A standalone chezmoi executable need not imply source access. |
| 5 | Agree | Use named entries, with validation of rendered contents and their dependencies as well as filenames. |
| 6 | Agree | Reuse setup delivery, with a declared person-neutral payload contract and explicit invocation. |
| 7 | Agree | Bash, Git, Linux installation and the existing workspace layout make mgit a useful first tool. |
| 8 | Differ | AWS access and Tailscale already exist on the host. Missing operator privileges are the actual limitation. ‡ |
| 9 | Agree | Declare exact desired versions and report drift. Include boot-installed Node and unpinned Claude Code. |
| 10 | Agree | Manage the default shell and zsh startup explicitly; also provide interactive mise activation. |
| 11 | Differ | Some excluded fragments are portable. Oh-my-zsh is neither inherently Mac-only nor credential-bound. § |
| 12 | Agree | Instructions must match delivered tools and host authority; prefer a host variant until delegation is settled. |
| 13 | Differ | Setup fits the exemption, but the proposed detached helper does not establish session-only execution. ¶ |
| 14 | Differ | Preserve the approved cancellation. Capture new work under the recorded condition or a new owner decision. † |
| 15 | Differ | Use fresh records and settle timing and detached execution before selecting the proposed pilot. † ¶ |
| - | Add | Define payload revision, file ownership, permissions, removal rules, validation and rollback. |
| - | Add | Test login, interactive, non-interactive SSH and Git-hook shells, including repository mise environments. |
| - | Add | Include Codex instructions and authentication in the workstation inventory; current projection favours Claude. ‖ |
| - | Add | Repository risk status does not cover personal profile or runtime state; document their recovery separately. ‖ |

† Chezмoi: `docs/roadmap/DOTFILES-UE-020-implement-cheztoi-profile.md:8-14,33-37` records cancellation, approval and recapture after the 2026-11-06 review if the host is retained. The design-loop standard at `/Users/krisbrown/.claude/skills/ki-design-loop/references/standards-design-loop.md:35-36` assigns decisions to the owner and rollout to ordinary work records.

‡ `ki-techne-harness/infra/aws/agent-host-stack.yaml:171-196,270,305-310` establishes the instance role, AWS CLI and authenticated Tailscale installation. These do not confer the Mac's operator permissions. Arcadia's `Admin/Governance/Policies/Techne Programme Hold.md:31` governs AWS credential use; it does not impose a blanket prohibition on installing `techne` or storing a non-secret binding.

§ Chezмoi: `dot_zsh/50_oh_my_zsh:1-2,32-35` uses a home-relative installation, conditionally enables Brew integration and guards sourcing. Excluding it from a minimal pilot is reasonable, but should follow dependency and usefulness assessment. `dot_zsh/50_mise:4-9` also demonstrates portable functionality needed for repository environment activation.

¶ Chezмoi: `bin/executable_claude-bg:99-105` detaches agents with `setsid` and `nohup`; `dot_claude/private_delegation.md:3-5` makes detached delegation the default. Arcadia: `Admin/Governance/Policies/Techne Programme Hold.md:28` permits agents only in sessions Kris opens and excludes unattended agents. The design needs supervision and termination rules before assuming that helper satisfies the exemption.

‖ `ki-techne-harness/operations/aws/agent-host/setup.sh:16-17,34-42` projects Claude instructions only; `docs/guides/operator/agent-host.md:245` separately requires Codex login. `operations/aws/agent-host/host/status.sh:25-46` assesses Git checkout state, not personal configuration, authentication state or profile recovery.
