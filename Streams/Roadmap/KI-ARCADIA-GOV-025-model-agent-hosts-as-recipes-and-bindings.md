---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-025
area: GOV
title: Model agent hosts as recipes and bindings
theme: governance
horizon: now
status: draft
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-07T08:49:50Z
updated_at: 2026-10-07T09:32:07Z
---

# Model Agent Hosts as Recipes and Bindings

## Goal

Techné describes agent hosts as harness-defined **recipes** that a person **binds** through configuration into named, configured instances, so one person can hold more than one agent host and the `techne` command structure makes that model visible.

## Context

Kris Brown, 2026-10-07 (paraphrased from speech): the Techne harness should offer different recipes - harness-defined kinds of agent host. A person binds a recipe through configuration to get a named, configured instance, and nothing stops one person having two agent hosts. The current agent host is the first such footprint, built from a prototype recipe. What sets that recipe apart is that agents run directly on the host, not inside a runtime that can delegate agent work. The `techne` command structure should make the model visible, so it is clear how it works.

Decided by Kris, 2026-10-07:

- **Terms.** A **recipe** is a harness-defined kind of agent host. A **binding** is a person's named, configured instance of a recipe. **Footprint** remains the word for what a binding leaves in AWS and on the host, as in `TECHNE-TOOLS-OPS-011`.
- **Prototype recipe.** The prototype recipe is named `direct-host`. The existing host - tag `ki-agent-host-id=agent-host`, stack `ki-techne-agent-host` - is its first binding.
- **Binding selection grammar.** A `techne host` command picks its binding with a `--host <binding>` flag, falling back to a default binding when omitted; `teardown` requires the flag. Recipes have their own group, so the model is visible: `techne recipe list|show`, `techne host list|add`, `techne host connect --host scratch [path]`, `techne host status --all`. Chosen over a positional name, the name before the verb and the recipe in the command path, because it is never ambiguous with a path argument and completes cleanly.

Today the single host's identity is hard-coded across its tags, stack name, `/ki/techne/agent-host/` SSM parameters, Tailscale name and AWS profile. The standing exemption from the [[Techne Programme Hold]] ([[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]], via [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one|KI-ARCADIA-GOV-023]]) covers that one host only.

Related records:

- Arcadia: [[KI-ARCADIA-GOV-020-limited-remote-agent-prototype|KI-ARCADIA-GOV-020]], [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]] (scheduled review of the standing exemption), [[KI-ARCADIA-GOV-022-file-the-agent-host-prototype-diagrams|KI-ARCADIA-GOV-022]], [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one|KI-ARCADIA-GOV-023]], [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] and [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]].
- `ki-techne-harness`: `TECHNE-TOOLS-OPS-009` (prepare the agent-host build, done), `TECHNE-TOOLS-OPS-010` (diagram the agent-host runbook, done) and `TECHNE-TOOLS-OPS-011` (manage the agent-host footprint, awaiting review).
- `tools-techne`: `TECHNE-TOOL-CLI-004` (add the `techne host` command group, in progress).

## Boundary

- In scope: the recipe and binding model and its vocabulary; the `direct-host` recipe and its first binding; how the `techne` command structure exposes recipes and bindings; where recipe and binding definitions live and who owns them; the authority a second binding or a new recipe would need.
- Out of scope: editing `ki-techne-harness`, `tools-techne` or chezmoi from this record, whose own records own implementation; any AWS, Tailscale or other remote change; a second live binding or a binding of any other recipe; delegation-capable recipes, which are a separate future question to capture when one is proposed.

Adopted into Now on 2026-10-07 on Kris Brown's instruction ("lets get some movement on it"), which also asks for it to be planned. This record delivers Arcadia's part - the decision, the vocabulary and the three handoff items below - and closes when those items are placed in their receiving repositories; the receivers own implementation and its acceptance.

## Current state

Read on 2026-10-07 at `ki-techne-harness` `de05a78` (OPS-011 accepted), `tools-techne` `2efd4d7` plus the uncommitted CLI-004 working tree, and chezmoi `69fea20`.

Every per-host name already follows from the host id `agent-host`: stack and host `ki-techne-<id>`, parameters `/ki/techne/<id>/`, tailnet tag `tag:ki-techne-<id>`, operator role `ki-techne-<id>-operator`. A binding whose id is `agent-host` therefore reproduces today's footprint exactly. These are the single-host hard-codings a binding must parameterise:

| Value today | Where it is fixed | Binding field |
| --- | --- | --- |
| Host id tag `ki-agent-host-id=agent-host` | stack `AgentHostId` (a parameter); `provision.sh` `--parameter-overrides AgentHostId=agent-host` and `--tags`; `stop.sh` filter; `destroy.sh` stack-tag check; `tools-techne` `src/agent-host.ts` `TAG_VALUE`; the operator role's inline policy conditions ([[KI-ARCADIA-GOV-020-limited-remote-agent-prototype\|GOV-020]]) | `id` |
| Host name `ki-techne-agent-host` | stack: literal `Name` tag on every resource, cloud-init `set-hostname` and `/etc/hosts`, `tailscale up --hostname`, the `TailscaleHostname` output - none is a parameter; `stop.sh` `Name` filter; `setup.sh` and `status.sh` `AGENT_HOST_SSH` default; `tools-techne` `AGENT_HOST_NAME`; chezmoi SSH `Host` entry and Zed settings | `host_name` |
| Stack `ki-techne-agent-host` | `provision.sh` and `destroy.sh` `AGENT_HOST_STACK_NAME` default and the `CONFIRM_DESTROY_AGENT_HOST` guard | `stack_name` |
| Parameters `/ki/techne/agent-host/` | stack `ParameterPrefix` (a parameter); literal `parameter_prefix` in `provision.sh` and `destroy.sh`; the operator policy's parameter ARNs; the `tools-techne` teardown message | `parameter_prefix` |
| Tailnet tag `tag:ki-techne-agent-host` | stack `TailscaleTag` (a parameter); the tailnet policy, held only in the Tailscale console | `tailscale_tag` |
| Admin profile `knowledge-islands-techne` | `provision.sh` and `destroy.sh` `AWS_PROFILE` default; `tools-techne` `DEFAULTS.profile`, shared with the controller commands | `admin_profile` |
| Operator profile `knowledge-islands-techne-agent-host`, role `ki-techne-agent-host-operator` | `stop.sh` profile default; `tools-techne` `DEFAULTS.hostProfile`, `--host-profile`, `TECHNE_HOST_PROFILE` and `OPERATOR_ROLE`; chezmoi `~/.aws/config`; the role and its inline policy, created by hand in the account | `operator_profile`, `operator_role` |
| Account `655383751458`, region `eu-west-1` | every script's `EXPECTED_AWS_ACCOUNT` and `AWS_REGION` default; `tools-techne` `DEFAULTS`; the operator policy ARNs | `account`, `region` |
| Repository set | `operations/aws/agent-host/host/repositories.txt`; `setup.sh` `AGENT_HOST_REPOSITORIES` | `repositories` |
| Workspace `~/workspaces/kit` | `host/converge.sh` and `host/status.sh` `KI_AGENT_HOST_WORKSPACE` | `workspace` |
| Instance size `t3.medium`, 40 GiB | `provision.sh` `AGENT_HOST_INSTANCE_TYPE` and `AGENT_HOST_VOLUME_SIZE` | `instance_type`, `volume_size` (optional) |
| Personal instructions and Git identity | `setup.sh` renders five named `~/.claude/*.md` files with `chezmoi cat` and copies the Mac's global Git identity | person-specific; parameterised in the harness item |

Recipe-owned, not binding fields: the `ki-lifecycle=prototype` and `ki-work-item=KI-ARCADIA-GOV-020` tags (literal in the stack, `provision.sh --tags` and the `stop.sh` filter), the operator user `techne`, and the host-side paths `/var/lib/ki-agent-host` and `~/.config/ki-agent-host`, which are per instance. The VPC CIDR may repeat because each stack has its own VPC. The harness checkout path stays a CLI setting (`--harness-dir`, `TECHNE_HARNESS_DIR`). `tools-techne` reads no configuration file today: only flags, environment variables and built-in defaults (`src/config.ts`).

## Design

### Recipes

Recommendation: each recipe is a manifest at `ki-techne-harness` `recipes/<recipe>/recipe.toml`, owned by the harness under [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]]. The `direct-host` manifest points at the existing `infra/aws/agent-host-stack.yaml` and `operations/aws/agent-host/` rather than moving them, so the runbook, OPS-011 and CLI-004's script paths stay valid. Its shape:

- `schema = "techne/recipe/v1"`, `name`, `summary`, `runtime = "direct"` (agents run on the host itself) and `provider = "aws"`;
- `[paths]` for the stack template and the provision, setup, status, stop and destroy scripts;
- one `[parameters.<field>]` table per binding field: required or derived default, and the environment variable the scripts read;
- recipe-owned tags, and a `footprint` list (stack, parameters, operator role and profile, tailnet device and tag, SSH entry) that `teardown` reports as remaining.

The script contract: every binding value reaches the scripts only through those environment variables, each defaulting to today's value, so running a script with no binding behaves as it does now.

### Bindings

Recommendation: per-person configuration read by the `techne` CLI from `${XDG_CONFIG_HOME:-~/.config}/techne/`, one file per binding at `hosts/<binding>.toml`, with `default_host` in `config.toml`. One file per binding lets chezmoi own Kris's rendered bindings while `techne host add` writes new files and refuses to overwrite one, so no managed file is mutated by the application. Schema `techne/host-binding/v1`; Kris's first binding:

```toml
schema = "techne/host-binding/v1"
recipe = "direct-host"
id = "agent-host"
account = "655383751458"
region = "eu-west-1"
admin_profile = "knowledge-islands-techne"
operator_profile = "knowledge-islands-techne-agent-host"
# Derived from id unless set: stack_name, host_name, parameter_prefix,
# tailscale_tag, operator_role. Recipe defaults unless set: repositories,
# workspace, instance_type, volume_size.
```

The binding name defaults to its `id`. Precedence is flag, then environment, then binding, then recipe derivation; `--host-profile` and `TECHNE_HOST_PROFILE` remain overrides of `operator_profile`. Until a binding file exists the CLI synthesises the `agent-host` binding from today's defaults, so nothing breaks in transition; once Kris's binding is rendered, `tools-techne` removes its person-specific defaults (account, profile names). The CLI refuses two bindings that share an `id`, stack, host name or parameter prefix in one account and region.

### Commands

The decided grammar maps as follows. `techne recipe list|show` reads manifests from the configured harness checkout, with no remote call. `techne host list` lists bindings and marks the default; `techne host add <binding> --recipe <recipe>` writes a binding file and provisions nothing. `techne host <verb> [--host <binding>]` acts on the named or default binding; `teardown` requires `--host`; `status --all` iterates bindings. Provisioning a new binding's footprint stays with the harness `provision.sh` and runbook; a CLI verb for it is outside this record.

### Decision Record

Recommendation: a new ADR-TECHNE-004 "Agent hosts as recipes and bindings", depending on [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]], not an amendment of it. ADR-TECHNE-003 assigns repositories and already places stacks and provider operations in the harness and the grammar in `tools-techne`, and keeps persona identity and credentials outside both; nothing in it changes. The new record carries the vocabulary, the recipe and binding ownership, the binding location and the hold boundary below.

### Hold authority

The standing exemption ([[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]], [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one|GOV-023]]) covers exactly one host: `ki-techne-agent-host`, tagged `ki-agent-host-id=agent-host`, in `655383751458`, `eu-west-1`. A second live binding, or any binding of another recipe, needs Kris's separate authority under the [[Techne Programme Hold]], and would also need a changed operator policy, new parameters and tailnet entries. This plan needs none of that: the model is built and tested with the existing binding only. Each item's defaults reproduce today's values, so the one remote check - a CloudFormation change set for the parameterised stack with the first binding's values - must show no change, and Kris runs it under the existing exemption. A second binding exists only as an offline test fixture, never in AWS or Tailscale. [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|GOV-021]] on 2026-11-06 is the natural place to consider wider authority.

## Steps

Arcadia:

- [ ] Draft ADR-TECHNE-004 from the Design above and add it to the [[Admin/Governance/Decisions/Decisions|Decisions]] index.
- [ ] Add the recipe, binding and footprint vocabulary to `Pillars/Engineering Practice/MEMORY.md` beside the agent-host entry, pointing at the ADR.

Handoff items, each recording this record as origin and placed only under the cross-repository choreography in `AGENTS.md`; the receiver owns priority, plan and execution:

- [ ] **H1, `ki-techne-harness`: parameterise the `direct-host` recipe.** Add `recipes/direct-host/recipe.toml`; turn the literal host name into a stack parameter defaulting to `ki-techne-agent-host`; read id, host name, stack, parameter prefix, profiles, account and region from environment variables in `provision.sh`, `destroy.sh` and `stop.sh`, and host name, repositories and workspace in `setup.sh` and `status.sh`; make the personal instruction file list configurable; update the runbook. Acceptance: offline template and script checks, and Kris's no-change change set for the first binding. It can be placed now: OPS-011 is accepted.
- [ ] **H2, `tools-techne`: recipe and binding commands.** The binding loader and schema, `--host`, `techne recipe list|show`, `techne host list|add`, `status --all`, teardown's required `--host`, replacing `TAG_VALUE`, `AGENT_HOST_NAME`, `OPERATOR_ROLE` and the host defaults with the selected binding, and passing binding values to the harness scripts. Tests cover a second fixture binding without AWS, SSH or Tailscale. Place it only after `TECHNE-TOOL-CLI-004` is accepted: CLI-004 is in progress in the same files (`src/cli.ts`, `src/config.ts`, `src/agent-host.ts`, `src/harness.ts`) under another agent and explicitly excludes `--host`. It depends on H1 for the manifest and environment contract.
- [ ] **H3, chezmoi: render Kris's binding.** Render `~/.config/techne/config.toml` (`default_host = "agent-host"`) and `~/.config/techne/hosts/agent-host.toml` once a `tools-techne` release reads them, applied by Kris after reviewing `chezmoi diff`. Retiring the `techne-agent-host` helper stays with `DOTFILES-UE-068`. Chezmoi is not in the choreography list, so this item needs Kris's go-ahead (decision 4).
- [ ] Record each placed item's identifier here, with reciprocal `blocks` / `blocked by` wording only where the receiver marks a genuine prerequisite.

## Files touched

- `Admin/Governance/Decisions/ADR-TECHNE-004-agent-hosts-as-recipes-and-bindings.md` (new, if decision 1 stands)
- `Admin/Governance/Decisions/Decisions.md`
- `Pillars/Engineering Practice/MEMORY.md`
- This record

## Verify

- `ki repo audit --repo .` passes, including `ki-decision-records` and `ki-repo-kb-streams`.
- Every row of the hard-coding table is covered by a field or a named change in H1, H2 or H3.
- Each placed handoff item names this record as origin, states its relationship, and grants no remote authority beyond [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]].
- No en-dash or em-dash in any added line.

## Dependencies / blocks

No local `blocks` or `blocked_by`. Placement order: H1 now; H2 after CLI-004's acceptance in `tools-techne`; H3 after the H2 release. These are cross-repository sequencing conditions, not recorded dependencies.

## Delegation

Each handoff item is delivered by an agent in its receiving repository under that repository's process. Drafting the ADR stays here.

## Documentation impact

### Decision Records

ADR-TECHNE-004, if decision 1 stands.

### Specifications

None.

### Guides

None here. The harness runbook and the `tools-techne` user guide change under H1 and H2.

### Roadmap

This record; handoff items in `ki-techne-harness`, `tools-techne` and chezmoi.

## Decisions for Kris

Each needs an answer before this record can be marked Ready; the recommended default comes first.

1. **Decision Record.** A new ADR-TECHNE-004 extending ADR-TECHNE-003 (recommended); amend ADR-TECHNE-003 in place; or no ADR, keeping the model in this record and the receivers' records.
2. **Binding location.** One XDG file per binding at `~/.config/techne/hosts/<binding>.toml` plus `default_host` in `~/.config/techne/config.toml`, Kris's rendered by chezmoi (recommended); or one `config.toml` with `[hosts.<binding>]` tables, which `techne host add` would then edit inside a chezmoi-managed file.
3. **First binding's name.** `agent-host`, the same as its tag id, so every derived name matches today and nothing remote changes (recommended); or a friendlier name such as `main` with `id = "agent-host"` set explicitly.
4. **Chezmoi handoff.** Arcadia places H3 in the chezmoi repository's roadmap once H2 is released (recommended); or Kris raises it there directly.
5. **Second binding.** Seek no authority for a second live binding now and consider it at the GOV-021 review on 2026-11-06 (recommended); or open a separate hold amendment sooner.

## Discussion

### Capture

Captured as Triage on Kris's instruction, 2026-10-07. No plan yet.

### Adoption and planning

Kris Brown, 2026-10-07 11:20 CEST: "lets get some movement on it" - adopted into Now and planned the same day. The five open questions at capture are answered in Design with recommendations grounded in the code; the decisions above remain Kris's, so the record stays `draft` in Now until they are answered.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
