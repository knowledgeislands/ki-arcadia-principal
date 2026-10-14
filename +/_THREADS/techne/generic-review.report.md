# Generic review of the agent-host recipe

## Summary

The basic design already separates the shared recipe, the cloud provider and each person's settings, and it does so well. The documents built on that design have drifted towards one setup: Kris's Mac, Kris's tools and an Amazon cloud machine. A second person, or a second machine such as a Mac Studio at home, would hit about a dozen points that assume all three. Most of these need only rewording, such as "the operator's own machine" instead of "the Mac". Four need a real decision, chiefly that the shell choice (zsh) and the safety rules should not come only from Kris's personal setup. The work being built now (TECHNE-TOOLS-OPS-013) is sound and should continue. Its cloud-specific rebuild and withdraw steps belong to the cloud provider, which is correct. It needs two small changes before it ships: one field renamed, and two leftover lines in the guide corrected. A home Mac Studio would also need a governance decision, because the current exemption covers only the one cloud machine.

## Reference records

- Decisions (in `ki-arcadia-principal/Admin/Governance/Decisions/`): [ADR-KI-ARCADIA-003](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Governance/Decisions/ADR-KI-ARCADIA-003-the-agent-host-workstation-model.md), [ODR-KI-ARCADIA-001](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Governance/Decisions/ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host.md), [GDR-KI-ARCADIA-004](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Governance/Decisions/GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold.md), [ADR-TECHNE-003](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Governance/Decisions/ADR-TECHNE-003-techne-implementation-ownership.md).
- Harness records (in `ki-techne-harness/docs/roadmap/`): [TECHNE-TOOLS-OPS-013](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-013-guard-agent-host-work.md), [TECHNE-TOOLS-OPS-014](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-014-agent-host-pins-and-expiries.md), [TECHNE-TOOLS-OPS-015](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-015-agent-host-workstation-pilot.md), [TECHNE-TOOLS-OPS-016](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-016-rig-provider-for-ki.md), [TECHNE-TOOLS-OPS-017](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-017-zsh-shell-at-rebuild.md), [TECHNE-TOOLS-OPS-018](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-018-converge-tools-through-rig.md).
- chezmoi records (in `~/.local/share/chezmoi/docs/roadmap/`): [DOTFILES-UE-072](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-072-machine-neutral-two-checkout-rule.md), [DOTFILES-UE-073](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-073-cheztoi-host-profile.md), [DOTFILES-UE-074](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-074-host-detached-delegation.md).

In the tables below, paths are shortened: `harness/` is `ki-techne-harness/`, `arcadia/` is `ki-arcadia-principal/Admin/Governance/Decisions/`, `dotfiles/` is `~/.local/share/chezmoi/docs/roadmap/`. Line numbers refer to the working tree on 2026-10-08, including the uncommitted TECHNE-TOOLS-OPS-013 edits.

## 1. Layer classification

The layers are: **(a)** generic recipe, **(b)** provider (AWS today, owned hardware later), **(c)** per-person binding, and **(d)** one person's personal layer.

| Concern | Layer | Where it lives today | Fit |
| --- | --- | --- | --- |
| Recipe, binding, provider and footprint model | a | ADR-TECHNE-003 lines 29-41 | Good: this is the standard the rest is measured against |
| Provider-neutral parameters (`host_name`, `tailscale_*`, `workspace`) | a | `harness/recipes/direct-host/recipe.toml` lines 54-82 | Good |
| AWS stack, SSM, IAM, selectors, tags, instance size | b | `recipe.toml` lines 84-167; `infra/aws/agent-host-stack.yaml` | Good: confined to `[providers.aws]` |
| Status contract (`clean`, `at-risk` or `unknown`), the guard and both overrides | a | ODR-KI-ARCADIA-001 lines 22-25; `recipe.toml` lines 30-52 | Good, apart from the instance-ID field (F5) |
| Rebuild and withdraw _mechanics_ (delete stack, keep or delete parameters) | b | ODR-KI-ARCADIA-001 line 25; TECHNE-TOOLS-OPS-013 line 53; `destroy.sh` | Correctly provider-layer in the code; worded as generic in the ODR (F3) |
| Recovery routes (push, then a verified bundle) | a | ODR-KI-ARCADIA-001 line 26 | Generic apart from "copied to the Mac" and EBS (F2) |
| Credential storage (SSM and Git credential helper) | b | guide lines 25 and 222; stack | Good |
| Pins and Rig `direct-host` profile | a | ODR-KI-ARCADIA-001 line 30; TECHNE-TOOLS-OPS-014 lines 23-24; `converge.sh` lines 8-13 | Generic, but "matching the Mac" and "Linux variants" (F2, F9) |
| `ki` Rig provider; converge through Rig | a | TECHNE-TOOLS-OPS-016; TECHNE-TOOLS-OPS-018 | Good |
| Expiry banner (GitHub token, Tailscale key) | a, with b sources | ODR-KI-ARCADIA-001 line 31; TECHNE-TOOLS-OPS-014 line 25 | Good |
| Roadmap writing-checkout rule and host marker | a | ODR-KI-ARCADIA-001 line 28; TECHNE-TOOLS-OPS-014 line 27 | Generic rule, but delivered through the personal layer (F7) |
| Two-checkout rule | a | ODR-KI-ARCADIA-001 lines 29 and 37; DOTFILES-UE-072 | Generic rule placed only in Kris's chezmoi source (F7) |
| Payload contract (revision, ownership, removal, validation) | a | ADR-KI-ARCADIA-003 line 26; TECHNE-TOOLS-OPS-015 line 28 | Good, apart from "Mac-only paths" validation (F10) |
| "No chezmoi on the host" | d stated as a | ADR-KI-ARCADIA-003 line 27 | Personal tool named in an architecture rule (F8) |
| zsh as the interactive shell | d | ADR-KI-ARCADIA-003 line 30; TECHNE-TOOLS-OPS-015 line 30; TECHNE-TOOLS-OPS-017 | Built into the recipe and stack (F6) |
| Personal tools through Rig, `mgit` first | d | ADR-KI-ARCADIA-003 line 28; TECHNE-TOOLS-OPS-015 line 29; DOTFILES-UE-073 line 33 | Correctly personal; the ADR names the tool (F8) |
| Cheztoi allowlist, renderer, host instruction variants | d | ADR-KI-ARCADIA-003 line 38; DOTFILES-UE-073 | Good, but the ADR assumes every owner uses chezmoi (F8) |
| Host detached delegation | d | DOTFILES-UE-074 | Good |
| Binding file: schema, name, recipe, `[aws]` account, region and two profiles | c | `~/.config/techne/hosts/agent-host.toml` lines 2-10 | Good and minimal; some per-person values are missing from it (F4) |
| Repository list and workspace layout | c, held as a | `recipe.toml` line 74; `host/repositories.txt` lines 1-2 | Kris's selection is shipped as the recipe default (F4) |
| Git identity | c | `setup.sh` line 30 (read from the operator machine's Git) | Generic enough |
| Instruction file list (`AGENT_HOST_INSTRUCTIONS`) | d | `setup.sh` lines 5, 16-17 and 29; guide line 54 | Kris's file names and a hard chezmoi requirement in the recipe's setup (F1) |
| Standing exemption for one named host | c+b governance | GDR-KI-ARCADIA-004 lines 26-31 | Correctly specific; blocks a second target (F12) |
| Operator guide | mixes a, b, c and d | `docs/guides/operator/agent-host.md` | A runbook for Kris's single instance (F11) |

## 2. Findings

| # | Finding | Kind | Evidence (file:line) |
| --- | --- | --- | --- |
| F1 | The recipe's setup step requires `chezmoi` on the operator's machine, renders "Kris's Claude instructions" and defaults to Kris's five file names. A second person without chezmoi cannot run setup at all. | Assumes Kris; blocks a second binding | `harness/operations/aws/agent-host/setup.sh:5`, `:16-17`, `:29`; guide `:54`, `:234`, `:241` |
| F2 | "The Mac" is written where "the operator's own machine" is meant: bundles are copied to the Mac, the Mac is the writing checkout, pins are compared with the Mac's versions, and recovery is by re-running setup from the Mac. With a Mac Studio as the _host_, "the Mac checkout" becomes ambiguous. | Assumes Mac; blocks a Mac target | ODR-KI-ARCADIA-001 `:26`, `:28`, `:30`; ADR-KI-ARCADIA-003 `:41`; `converge.sh:8`, `:156`, `:349`; `destroy.sh:90-92`; TECHNE-TOOLS-OPS-013 `:54`, `:63` |
| F3 | The durability ODR states rebuild and withdraw in AWS terms ("replaces the stack", "every parameter", "no EBS snapshot", "administrator session in the Techne account"), and its premise is a disposable cloud disk. On owned hardware, rebuild means resetting the operator user's home and withdraw means removing the workspace and tailnet device, but the guard is the same. | Assumes cloud in a generic layer | ODR-KI-ARCADIA-001 `:16`, `:25`, `:26`, `:27` |
| F4 | The scripts default every value to Kris's binding (account, region, profile names, host name), and the manifest check _requires_ each default to equal the `agent-host` binding's value. ADR-TECHNE-003 forbids person-specific defaults. Kris's repository selection and the `~/workspaces/kit` layout are the recipe default, and the binding has no field for repositories or a profile payload. | Assumes Kris; blocks a second binding | ADR-TECHNE-003 `:41`; `tooling/checks/recipe-manifest.py:14`, `:270-298`; `destroy.sh:20-22`; `provision.sh:7-11`; `stop.sh:14`; `setup.sh:11-12`; `status.sh:15`; `recipe.toml:74`, `:78-82`; `host/repositories.txt:1-2`; guide `:34`, `:56` |
| F5 | The status report's same-host check uses `host.instance_id`, read from cloud-init and compared with the stack output `AgentHostInstanceId`. An owned Mac has no cloud-init, so the provider-neutral v1 schema carries an EC2-only identifier. TECHNE-TOOL-CLI-006 is about to consume this schema. | Cloud field in a generic contract | `harness/operations/aws/agent-host/host/status.sh:170-178` (uncommitted); `destroy.sh:71`, `:97`; TECHNE-TOOLS-OPS-013 `:47`, `:55` |
| F6 | zsh, a personal shell choice, becomes recipe and stack behaviour: a `.bashrc` hand-off for everyone, then `--shell /bin/zsh` in the stack. A second person who wants bash, or fish, gets zsh. | Personal choice in the generic layer | ADR-KI-ARCADIA-003 `:30`; TECHNE-TOOLS-OPS-015 `:22`, `:30`, `:47`; TECHNE-TOOLS-OPS-017 `:20`, `:30`; `infra/aws/agent-host-stack.yaml:280` |
| F7 | The safety rules (two-checkout, not the writing checkout) are generic, but they reach the host only through the owner's personal chezmoi source. An owner without a payload gets "a complete host" without the rules that keep their work safe. | Generic rule delivered as personal; blocks a second binding | ODR-KI-ARCADIA-001 `:29`, `:37`; ADR-KI-ARCADIA-003 `:40`; TECHNE-TOOLS-OPS-014 `:26-27`; DOTFILES-UE-072 `:17`, `:29` |
| F8 | The workstation ADR is Kris-shaped in its premises and wording. It assumes the host is "not owned by the binding owner" with "no root access" (false for a Mac Studio). It forbids "chezmoi" by name rather than any personal-configuration tool on the host. It names `mgit` and Cheztoi. It says "the binding owner's chezmoi source owns Cheztoi", which assumes every owner uses chezmoi. | Assumes Kris and a cloud host | ADR-KI-ARCADIA-003 `:16`, `:18`, `:27`, `:28`, `:38` |
| F9 | The Rig `direct-host` profile is specified with "Linux variants", and the framing is Rig's "first proof on a real Linux host". A macOS target needs macOS variants of the same profile. | Blocks a Mac target | TECHNE-TOOLS-OPS-014 `:24`; ADR-KI-ARCADIA-003 `:18`, `:28`, `:39` |
| F10 | The payload validation refuses "Mac-only paths". That is correct for a Linux host but wrong for a macOS host: the rule should be "paths invalid on the target OS". | Blocks a Mac target | ADR-KI-ARCADIA-003 `:26`; TECHNE-TOOLS-OPS-015 `:28`; DOTFILES-UE-073 `:34`, `:51` |
| F11 | The operator guide is a runbook for Kris's one instance. It names Kris throughout, the account and region, Kris's SSO profile names, Kris's tailnet login in the policy (a personal identifier, not repeated here), macOS `pbpaste`, and the retired `techne-agent-host` helper. It also still shows a review date of 2026-11-06 and a "scheduled review", which Decision 6 removed, and a 30-day token expiry. | Assumes Kris, Mac and AWS; stale | `harness/docs/guides/operator/agent-host.md:3`, `:5`, `:11`, `:72`, `:85`, `:89`, `:102`, `:210`, `:224`, `:255`, `:261`; `host/status.sh:22-23`, `:227` |
| F12 | The exemption covers one EC2 host by account and tag, and holds "every other environment". A Mac Studio target, or a second person's host, is outside it. Running either is a governance change, not just engineering. | Blocks a second target (by design) | GDR-KI-ARCADIA-004 `:26`, `:31`, `:38` |
| F13 | The provider-neutral scripts (`setup.sh`, `status.sh`, `host/converge.sh`) live under `operations/aws/agent-host/`, and the recipe points its neutral `[paths]` there. The layout suggests AWS where the code is neutral. Some host-side content is also sized for this instance (`KNIP_DISABLE_RAW_TRANSFER` "on a 4 GB host"). | Cosmetic, provider leak | `recipe.toml:27-28`, `:74`; `converge.sh:119-121` |
| F14 | Only an AWS adapter exists in `tools-techne`, and the recipe declares only `[providers.aws]`. An owned machine reached over the tailnet needs a provider with no provision step, whose rebuild and withdraw act over SSH. ADR-TECHNE-003 already defines how to add one. | Missing provider; not a defect | `tools-techne/src/providers/aws/index.ts:18`; `recipe.toml:84`; ADR-TECHNE-003 `:40`, `:55` |

What already works well: ADR-TECHNE-003 lines 29-41 have the right model, and its manifest check rejects any AWS concept outside `[providers.aws]` (`recipe-manifest.py:40-41`, `:140`). The binding file is minimal and person-owned. ADR-KI-ARCADIA-003 line 40 already promises that a recipe-only host is complete. The uncommitted TECHNE-TOOLS-OPS-013 `[operations]` table (`recipe.toml:43-52`) is provider-neutral, because `script = "destroy"` resolves through each provider's `paths`.

## 3. Proposed changes (decisions for Kris)

### TECHNE-TOOLS-OPS-013, being built now

**Verdict: continue. Do not re-scope it.** Its EC2 rebuild and withdraw steps (TECHNE-TOOLS-OPS-013 lines 53 and 62) belong to the AWS provider. They sit in `destroy.sh` under `[providers.aws.paths]`, which is where ADR-TECHNE-003 puts provider mechanics. The generic parts (status contract, guard, overrides, operation names) are already neutral in `recipe.toml`. Three small in-flight changes are worth making before it reaches review, because TECHNE-TOOL-CLI-006 freezes the v1 schema next:

- **P1 - Recommended. Touches TECHNE-TOOLS-OPS-013, in progress.** Rename `host.instance_id` in `techne/host-workspace/v1` to a neutral `host.id`, documented as "a provider-defined identity of this machine": the cloud-init instance ID on AWS, a hardware or install UUID on owned hardware. The same-host check stays in the AWS `destroy.sh`. This is cheap now and a schema bump later. (F5)
- **P2 - Recommended. Touches TECHNE-TOOLS-OPS-013, in progress.** While it rewrites the guide, also remove the 2026-11-06 review date and the "scheduled review" (guide lines 5 and 255), which Decision 6 settled. Word the recovery route as "copied to the operator's machine" in the guide and in `destroy.sh` lines 90-92. Today TECHNE-TOOLS-OPS-014 removes only the `host/status.sh` line. (F2, F11)
- **P3 - Optional. Touches TECHNE-TOOLS-OPS-013, in progress.** Put the guard logic (read the report, check the discard lists, typed confirmation) in a provider-neutral helper that `destroy.sh` sources, so a second provider reuses it rather than copying it. Leave this for the owned-host provider record (P11) if the builder is far along. (F3, F14)

### Decision Records (Arcadia; Enactment as each needs)

- **P4 - Recommended. Amends ODR-KI-ARCADIA-001.** Replace "the Mac" with "the operator's workstation", defined as the machine the binding owner works from (lines 26, 28 and 30). State rebuild and withdraw by intent: "replace the host, keeping reusable credentials" and "remove the binding's footprint and credentials". Move "stack", "parameter", "EBS" and "administrator session in the Techne account" into a sentence that reads "for the AWS provider". Recast the premise at line 16 as "a host whose disk may be discarded", which covers both a cloud instance and a reset of an owned machine. (F2, F3)
- **P5 - Recommended. Amends ADR-KI-ARCADIA-003.** Restate the premises as cases: "a host the owner may not own or administer". Replace "no chezmoi on host" with "no personal-configuration tool is installed or applied on the host; the personal layer arrives only as the payload". Move the names `mgit`, Cheztoi and chezmoi into an example sentence: "for Kris, Cheztoi from his chezmoi source; `mgit` first". Make the Rig profile and payload validation target-OS-aware: Linux or macOS variants, and paths invalid on the target. (F8, F9, F10)
- **P6 - Recommended. Amends ADR-KI-ARCADIA-003 decision 4. Reshapes TECHNE-TOOLS-OPS-015 and TECHNE-TOOLS-OPS-017, not started.** The recipe stays shell-neutral: it installs zsh and keeps `env.sh` sourceable from any shell. The interactive-shell choice comes from the personal payload, which for Kris carries the `zsh -l` hand-off, or from an optional binding field `shell`. TECHNE-TOOLS-OPS-017's stack change then reads the binding's shell (default `/bin/bash`) rather than hard-coding zsh. (F6)
- **P7 - Recommended. Amends the ODR-KI-ARCADIA-001 consequence at line 37. Touches TECHNE-TOOLS-OPS-014 (triage) and DOTFILES-UE-072 (triage).** The recipe itself renders a small host-instructions file for both Claude and Codex, carrying the two-checkout rule and the writing-checkout rule. Kris's chezmoi source keeps his personal wording and style only. TECHNE-TOOLS-OPS-014's "Codex instructions" step becomes "the recipe's own instructions for both runtimes". DOTFILES-UE-072 narrows to Kris's personal phrasing, or is cancelled if the recipe text suffices. (F7)

### Harness records

- **P8 - Recommended. New harness record, after TECHNE-TOOLS-OPS-013: "Person-neutral recipe defaults".** Drop person-specific script defaults so values come only from the binding through the CLI, or from an explicit test fixture. Change `recipe-manifest.py`'s `check_binding_defaults` to check a fixture binding rather than Kris's live one. Ship `repositories.txt` as an example, and add binding fields `repositories` and `profile` (the payload source), so `AGENT_HOST_INSTRUCTIONS` and the hard `chezmoi` requirement in `setup.sh` go (folding into TECHNE-TOOLS-OPS-015's payload hook). Needs a paired `tools-techne` binding-schema record. (F1, F4)
- **P9 - Recommended. Reshapes TECHNE-TOOLS-OPS-015, draft.** Make its payload hook the only route for personal instructions, removing `setup.sh`'s `chezmoi cat` path rather than generalising beside it. Validate paths against the target OS. (F1, F10)
- **P10 - Optional. New harness record: "Split the operator guide".** Split it into a generic `direct-host` recipe guide, an AWS provider guide with placeholders, and Kris's deployment values. The deployment values go in his chezmoi source or Arcadia, not in the shared repository. (F11)
- **P11 - Optional. New paired records, triage only: "Owned-host provider".** A harness `[providers.tailnet]` (or `owned`) section, with no provision step. Rebuild resets the operator user's workspace and home over SSH; withdraw removes the workspace and lists the tailnet device and account as manual footprint. A matching `tools-techne` adapter. Capture it now so the design keeps the case in view; plan it only if a Mac Studio becomes real. (F3, F14)
- **P12 - Optional. Fold into P8 or P11.** Move the neutral scripts out of `operations/aws/agent-host/` into `operations/direct-host/`, and make instance-sized settings such as `KNIP_DISABLE_RAW_TRANSFER` conditional or provider-supplied. (F13)

### Governance

- **P13 - Recommended to note now; decide later.** Before any owned machine or second person's host runs agents, the Techne Programme Hold needs a decision: either a new exemption record per host, or a reshaped GDR-KI-ARCADIA-004 that exempts "hosts of the `direct-host` recipe under bindings the island owner approves". No change to the current exemption is proposed now. (F12)

### Not proposed

- No change to GDR-KI-ARCADIA-004's specifics for the current host. They are correctly specific.
- No change to TECHNE-TOOLS-OPS-016 or TECHNE-TOOLS-OPS-018. They are generic.
- No change to DOTFILES-UE-073 or DOTFILES-UE-074 beyond P5's OS-aware validation wording. They are correctly personal.

## Done / Failed / Needs the owner

**Done**

- Read all four decisions, TECHNE-TOOLS-OPS-013 to TECHNE-TOOLS-OPS-018, DOTFILES-UE-072 to DOTFILES-UE-074, the recipe, its scripts, the operator guide, and the binding's structure. No binding values were printed.
- Classified the concerns, recorded 14 findings with file and line, and proposed 13 changes.
- Commits: none. This was a read-only review, and no repository file was changed.
- Checks: none run. Nothing was built or changed to check.

**Failed**

- None.

**Needs the owner**

- Approve P1 and P2 for the builder of TECHNE-TOOLS-OPS-013 before it reaches review. The CLI freezes the status schema next.
- Decide P4 to P7, which reword the Arcadia decisions and reshape the triage and draft records TECHNE-TOOLS-OPS-014, TECHNE-TOOLS-OPS-015, TECHNE-TOOLS-OPS-017 and DOTFILES-UE-072.
- Decide whether to capture P8, which is recommended, and P10 to P12, which are optional, as new records.
- Note P13: a Mac Studio host needs a governance decision before use.

Line numbers for TECHNE-TOOLS-OPS-013's files are taken from the uncommitted working tree, so they may shift as the builder continues.
