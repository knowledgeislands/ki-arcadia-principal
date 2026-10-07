---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-025
area: GOV
title: Model agent hosts as recipes and bindings
kind: deliver
project: agent-host
component: techne
horizon: now
status: ready
blocks: []
blocked_by: []
baseline_ref: null
created_at: 2026-10-07T08:49:50Z
updated_at: 2026-10-07T14:08:03Z
---

# Model Agent Hosts as Recipes and Bindings

## Goal

Techné describes agent hosts as harness-defined **recipes** that a person **binds** through configuration into named, configured instances, so one person can hold more than one agent host and the `techne` command structure makes that model visible.

## Context

Kris Brown, 2026-10-07 (paraphrased from speech): the Techne harness should offer different recipes - harness-defined kinds of agent host. A person binds a recipe through configuration to get a named, configured instance, and nothing stops one person having two agent hosts. The current agent host is the first such footprint, built from a prototype recipe. What sets that recipe apart is that agents run directly on the host, not inside a runtime that can delegate agent work. The `techne` command structure should make the model visible, so it is clear how it works.

Decided by Kris, 2026-10-07:

- **Terms.** A **recipe** is a harness-defined kind of agent host. A **binding** is a person's named, configured instance of a recipe. **Footprint** remains the word for what a binding leaves in AWS and on the host, as in `TECHNE-TOOLS-OPS-011`.
- **Prototype recipe.** The prototype recipe is named `direct-host`. The existing host - tag `ki-agent-host-id=agent-host`, stack `ki-techne-agent-host` - is its first binding.
- **Binding selection grammar.** A `techne host` command picks its binding with a `--host <binding>` flag; a read-only or access command falls back to a default binding when it is omitted, and a command that changes a host requires it. Recipes have their own group, so the model is visible: `techne recipe list|show`, `techne host list|add`, `techne host status`, `techne host connect --host scratch [path]`, `techne host start --host agent-host`, `techne host status --all`. Chosen over a positional name, the name before the verb and the recipe in the command path, because it is never ambiguous with a path argument and completes cleanly.
- **Decision Record, bindings and first binding** (about 11:45 CEST). Amend [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]] rather than create a new record; one binding file per host at `~/.config/techne/hosts/<name>.toml` with `default_host` in `~/.config/techne/config.toml`; the first binding is named `agent-host`; no authority for a second live binding now, revisited at GOV-021 on 2026-11-06.
- **Host selection and providers** (about 11:45 CEST). Selection is `--host`, then `TECHNE_HOST`, then `default_host`, then the only binding when exactly one exists; otherwise refuse and list them. AWS is not the only provider: recipes declare supported providers, bindings name one by keeping its settings in a provider table, and the CLI dispatches provider-bound verbs through an adapter, with only the AWS adapter built now.
- **Explicit to change, chezmoi handoff and provider options** (about 12:30 CEST). Commands that change a host - `setup`, `start`, `stop`, `teardown` - require `--host <binding>`; read-only and access commands - `status`, `list`, `connect`, `recipe list|show` - use the selection order above. Arcadia places the chezmoi item directly in the chezmoi repository's roadmap when H2 is released, a timing the 14:50 CEST decision below brings forward to now. Provider-specific options carry the provider's prefix, such as `--aws-region`, act as overrides of the target's provider table, and are accepted only when the target uses that provider.
- **No backwards compatibility, controller table and provider environment** (about 14:30 CEST). Design only the desired CLI surface: old option names are simply gone, with no deprecation release or rejection pointer, and only the changelog names them. The controller's provider settings sit under `[controller.aws]` in `config.toml`, as a binding's sit under `[aws]`. There are no `TECHNE_AWS_*` variables: `--aws-profile` and `--aws-region` mean the same as `AWS_PROFILE` and `AWS_REGION`, which apply after the flag and the configuration, and the account and operator-role guards protect against an ambient profile in the wrong account. ADR-TECHNE-003 is amended in place, the archived `ki-techne-principal` copy being historical evidence.
- **Provider table and shipping the binding** (about 14:50 CEST). A binding names its provider by its one provider table, such as `[aws]`, with no separate `provider` key, as the controller does with `[controller.aws]`; a binding with no provider table or several is invalid. The binding ships with the CLI: `tools-techne` has no built-in defaults and host commands refuse without a binding, so the chezmoi item that renders Kris's `config.toml` and `hosts/agent-host.toml` is delivered and applied together with the `tools-techne` release, leaving no gap. `techne host add agent-host --recipe direct-host` remains the manual fallback.

Today the single host's identity is hard-coded across its tags, stack name, `/ki/techne/agent-host/` SSM parameters, Tailscale name and AWS profile. The standing exemption from the [[Techne Programme Hold]] ([[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]], via [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one|KI-ARCADIA-GOV-023]]) covers that one host only.

Related records:

- Arcadia: [[KI-ARCADIA-GOV-020-limited-remote-agent-prototype|KI-ARCADIA-GOV-020]], [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]] (scheduled review of the standing exemption), [[KI-ARCADIA-GOV-022-file-the-agent-host-prototype-diagrams|KI-ARCADIA-GOV-022]], [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one|KI-ARCADIA-GOV-023]], [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] and [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]].
- `ki-techne-harness`: `TECHNE-TOOLS-OPS-009` (prepare the agent-host build, done), `TECHNE-TOOLS-OPS-010` (diagram the agent-host runbook, done) and `TECHNE-TOOLS-OPS-011` (manage the agent-host footprint, awaiting review).
- `tools-techne`: `TECHNE-TOOL-CLI-004` (add the `techne host` command group, done).
- chezmoi: `DOTFILES-UE-068` (agent-host operator tooling, done), whose `techne-agent-host` helper is retired separately now that CLI-004 is accepted.

## Boundary

- In scope: the recipe and binding model and its vocabulary; the `direct-host` recipe and its first binding; how the `techne` command structure exposes recipes and bindings; where recipe and binding definitions live and who owns them; the provider dimension of recipes, bindings and commands; the authority a second binding, provider or recipe would need.
- Out of scope: editing `ki-techne-harness`, `tools-techne` or chezmoi from this record, whose own records own implementation; any AWS, Tailscale or other remote change; a second live binding, a binding on any other provider or of any other recipe; building any provider adapter other than AWS; delegation-capable recipes, which are a separate future question to capture when one is proposed.

Adopted into Now on 2026-10-07 on Kris Brown's instruction ("lets get some movement on it"), which also asks for it to be planned. This record delivers Arcadia's part - the decision, the vocabulary and the three handoff items below - and closes when those items are placed in their receiving repositories; the receivers own implementation and its acceptance.

## Current state

Read on 2026-10-07 at `ki-techne-harness` `de05a78` (OPS-011 accepted), `tools-techne` `2efd4d7` plus the uncommitted CLI-004 working tree, and chezmoi `69fea20`.

Every per-host name already follows from the host id `agent-host`: stack and host `ki-techne-<id>`, parameters `/ki/techne/<id>/`, tailnet tag `tag:ki-techne-<id>`, operator role `ki-techne-<id>-operator`. A binding whose id is `agent-host` therefore reproduces today's footprint exactly. These are the single-host hard-codings a binding must parameterise:

| Value today | Where it is fixed | Binding field |
| --- | --- | --- |
| Host id tag `ki-agent-host-id=agent-host` | stack `AgentHostId` (a parameter); `provision.sh` `--parameter-overrides AgentHostId=agent-host` and `--tags`; `stop.sh` filter; `destroy.sh` stack-tag check; `tools-techne` `src/agent-host.ts` `TAG_VALUE`; the operator role's inline policy conditions ([[KI-ARCADIA-GOV-020-limited-remote-agent-prototype\|GOV-020]]) | `aws.tag` |
| Host name `ki-techne-agent-host` | stack: literal `Name` tag on every resource, cloud-init `set-hostname` and `/etc/hosts`, `tailscale up --hostname`, the `TailscaleHostname` output - none is a parameter; `stop.sh` `Name` filter; `setup.sh` and `status.sh` `AGENT_HOST_SSH` default; `tools-techne` `AGENT_HOST_NAME`; chezmoi SSH `Host` entry and Zed settings | `host_name`, `tailscale_name` |
| Stack `ki-techne-agent-host` | `provision.sh` and `destroy.sh` `AGENT_HOST_STACK_NAME` default and the `CONFIRM_DESTROY_AGENT_HOST` guard | `aws.stack_name` |
| Parameters `/ki/techne/agent-host/` | stack `ParameterPrefix` (a parameter); literal `parameter_prefix` in `provision.sh` and `destroy.sh`; the operator policy's parameter ARNs; the `tools-techne` teardown message | `aws.parameter_prefix` |
| Tailnet tag `tag:ki-techne-agent-host` | stack `TailscaleTag` (a parameter); the tailnet policy, held only in the Tailscale console | `tailscale_tag` |
| Admin profile `knowledge-islands-techne` | `provision.sh` and `destroy.sh` `AWS_PROFILE` default; `tools-techne` `DEFAULTS.profile`, shared with the controller commands | `aws.admin_profile` |
| Operator profile `knowledge-islands-techne-agent-host`, role `ki-techne-agent-host-operator` | `stop.sh` profile default; `tools-techne` `DEFAULTS.hostProfile`, `--host-profile`, `TECHNE_HOST_PROFILE` and `OPERATOR_ROLE`; chezmoi `~/.aws/config`; the role and its inline policy, created by hand in the account | `aws.operator_profile`, `aws.operator_role` |
| Account `655383751458`, region `eu-west-1` | every script's `EXPECTED_AWS_ACCOUNT` and `AWS_REGION` default; `tools-techne` `DEFAULTS`; the operator policy ARNs | `aws.account`, `aws.region` |
| Repository set | `operations/aws/agent-host/host/repositories.txt`; `setup.sh` `AGENT_HOST_REPOSITORIES` | `repositories` |
| Workspace `~/workspaces/kit` | `host/converge.sh` and `host/status.sh` `KI_AGENT_HOST_WORKSPACE` | `workspace` |
| Instance size `t3.medium`, 40 GiB | `provision.sh` `AGENT_HOST_INSTANCE_TYPE` and `AGENT_HOST_VOLUME_SIZE` | `aws.instance_type`, `aws.volume_size` (optional) |
| Provider AWS itself | `tools-techne` `src/agent-host.ts` (direct `aws ec2` calls for find, status, start, stop and terminate) and `src/aws.ts`; the harness `operations/aws/agent-host/` path in `src/harness.ts` `AGENT_HOST_SCRIPTS`; `setup.sh` and `status.sh` live under that AWS path although their work is SSH-only | `provider`, dispatched through a provider adapter |
| Personal instructions and Git identity | `setup.sh` renders five named `~/.claude/*.md` files with `chezmoi cat` and copies the Mac's global Git identity | person-specific; parameterised in the harness item |

Recipe-owned, not binding fields: the `ki-lifecycle=prototype` and `ki-work-item=KI-ARCADIA-GOV-020` tags (literal in the stack, `provision.sh --tags` and the `stop.sh` filter), the operator user `techne`, and the host-side paths `/var/lib/ki-agent-host` and `~/.config/ki-agent-host`, which are per instance. The VPC CIDR may repeat because each stack has its own VPC. The harness checkout path stays a CLI setting (`--harness-dir`, `TECHNE_HARNESS_DIR`). `tools-techne` reads no configuration file today: only flags, environment variables and built-in defaults (`src/config.ts`).

Re-read on 2026-10-07 at `tools-techne` `6f415f1`, where `TECHNE-TOOL-CLI-004` is accepted and `610aa21` made help consistent with the other KI CLIs (`--help` and `help <command>` agree at every level; a bare group or unknown command exits 2 with its usage). Every value option is global, listed once under `Global options` in `src/cli.ts`, and four of the six are AWS-specific without saying so: `--profile` (`AWS_PROFILE`), `--region` (`AWS_REGION`), `--account` (`EXPECTED_AWS_ACCOUNT`), `--controller-stack` (`CONTROLLER_STACK_NAME`), `--host-profile` (`TECHNE_HOST_PROFILE`) and `--harness-dir` (`TECHNE_HARNESS_DIR`). The controller commands, `auth login`, `doctor` and `diag` use the admin profile, region, account and controller stack; the `host` commands use the operator profile, region and account. Because `techne` reads the ambient `AWS_PROFILE` and `AWS_REGION` as its own settings, a value exported for another AWS tool silently retargets it.

## Design

### Providers

AWS is the first provider, not the only one. A **provider** is the infrastructure a binding's footprint lives on; [[ADR-TECHNE-001-provider-neutral-isolated-agent-execution|ADR-TECHNE-001]] already keeps provider APIs as adapter concerns. The model therefore has three dimensions: a recipe declares which providers it supports, a binding names one provider by carrying exactly one provider table, and every provider-specific value sits in that table. Only the AWS adapter is built now and no second provider is in scope, but no schema field, derivation rule or command may assume AWS: a provider-neutral field never names an AWS concept, and the CLI never reaches AWS except through the adapter the binding's provider table selects.

Verbs split by where they act:

| Verb | Acts on | Path |
| --- | --- | --- |
| `start`, `stop` | the provider's compute | provider adapter |
| `status` | both | provider adapter for instance state, then provider-neutral host checks over Tailscale and SSH when it is running |
| `teardown` | the provider's footprint | provider adapter, then the recipe's footprint list for what remains |
| `connect`, `setup` | the host | provider-neutral, by Tailscale name and SSH; no provider call |
| `recipe list\|show`, `host list\|add` | local files | no remote call |

How the [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]] split holds. `ki-techne-harness` owns each provider's infrastructure and its operations: the stack template, the provision and destroy scripts, and the provider section of each recipe manifest, which declares the resource selectors (tag key, derived names, operator role) an adapter needs. `tools-techne` owns the grammar, the binding loader, the adapter interface and the dispatch, plus the thin operator-scoped calls each adapter makes for `start`, `stop`, `status` and `teardown` - today's `aws ec2` calls - driven only by the manifest and the binding, with no provider name hard-coded. Provisioning and destruction of a footprint stay harness scripts. A new provider therefore lands as a harness provider section and stack plus a `tools-techne` adapter, each in its own repository and release, joined only by the manifest and environment-variable contract.

### Recipes

Recommendation: each recipe is a manifest at `ki-techne-harness` `recipes/<recipe>/recipe.toml`, owned by the harness under [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]]. The `direct-host` manifest points at the existing `infra/aws/agent-host-stack.yaml` and `operations/aws/agent-host/` rather than moving them, so the runbook, OPS-011 and CLI-004's script paths stay valid. Its shape:

- `schema = "techne/recipe/v1"`, `name`, `summary`, `runtime = "direct"` (agents run on the host itself) and `providers = ["aws"]`, the providers the recipe supports;
- provider-neutral `[paths]` for the setup and host-status scripts, and `[parameters.<field>]` for the provider-neutral binding fields;
- one `[providers.<provider>]` table per supported provider, holding its `[providers.<provider>.paths]` (for `aws`: stack template, provision, stop and destroy scripts), its `[providers.<provider>.parameters.<field>]` (required or derived default, and the environment variable the scripts read) and its resource selectors;
- recipe-owned tags, and a `footprint` list (for `aws`: stack, parameters, operator role and profile; provider-neutral: tailnet device and tag, SSH entry) that `teardown` reports as remaining.

The script contract: every binding value reaches the scripts only through those environment variables, each defaulting to today's value, so running a script with no binding behaves as it does now.

### Bindings

Decided: per-person configuration read by the `techne` CLI from `${XDG_CONFIG_HOME:-~/.config}/techne/`, one file per binding at `hosts/<name>.toml`, with `default_host` in `config.toml`. One file per binding lets chezmoi own Kris's rendered bindings while `techne host add` writes new files and refuses to overwrite one, so no managed file is mutated by the application. Schema `techne/host-binding/v1`; Kris's first binding, `hosts/agent-host.toml`:

```toml
schema = "techne/host-binding/v1"
name = "agent-host"
recipe = "direct-host"
# Provider-neutral, derived from name unless set: host_name,
# tailscale_name, tailscale_tag. Recipe defaults unless set:
# repositories, workspace.

[aws]
account = "655383751458"
region = "eu-west-1"
admin_profile = "knowledge-islands-techne"
operator_profile = "knowledge-islands-techne-agent-host"
# Derived from name unless set: tag, stack_name, parameter_prefix,
# operator_role. Recipe defaults unless set: instance_type, volume_size.
```

Schema rules: `name` must equal the file name; `recipe` must name a manifest; the binding carries exactly one provider table, whose name is the binding's provider and must be one of that recipe's `providers`, as `[controller.aws]` names the controller's. There is no `provider` key: the CLI refuses a binding with no provider table or several, a provider table the recipe does not support, and any unknown field, including `provider`. Provider-neutral fields are `name`, `recipe`, `host_name`, `tailscale_name`, `tailscale_tag`, `repositories` and `workspace`; everything else belongs to the provider table. With `name = "agent-host"` every derived value reproduces today's footprint: `host_name` and `tailscale_name` `ki-techne-agent-host`, `tailscale_tag` `tag:ki-techne-agent-host`, and for `aws` the tag value `agent-host`, stack `ki-techne-agent-host`, parameters `/ki/techne/agent-host/` and role `ki-techne-agent-host-operator`.

Precedence for a binding value is its provider option where one exists, then the binding, then the recipe derivation; profile and region then fall back to the provider's own environment variables, as set out under Provider options. There is no synthesised binding: with no binding file, a host command refuses as in step 5 of selection below and names `techne host add`, and `tools-techne` carries no built-in default, person-specific or otherwise (account, profile names). Decided: the binding ships with the CLI. Kris's `config.toml` and `hosts/agent-host.toml` are rendered by chezmoi (H3) and applied together with the `tools-techne` release (H2) that first reads them, so no released `techne` meets Kris's machine without a binding; `techne host add agent-host --recipe direct-host` is the manual fallback. The CLI refuses two bindings that share a host name or Tailscale name, and the provider adapter refuses two that share a provider identity (for `aws`: tag value, stack or parameter prefix in one account and region).

### Commands

The decided grammar maps as follows. `techne recipe list|show` reads manifests from the configured harness checkout, with no remote call; `show` lists each recipe's providers. `techne host list` lists bindings with their recipe and provider and marks the one selection would pick; `techne host add <name> --recipe <recipe> --provider <provider>` writes a binding file with that one provider table and provisions nothing, and `--provider` may be omitted only when the recipe supports exactly one. `status --all` iterates bindings, dispatching each through its own provider's adapter. Provisioning a new binding's footprint stays with the harness provision script and runbook; a CLI verb for it is outside this record.

Decided: explicit to change. A command that changes a host - `host setup`, `start`, `stop` and `teardown` - requires `--host <binding>`, even when only one binding exists and even with `--dry-run`, so dropping `--dry-run` never changes which host is acted on; `TECHNE_HOST`, `default_host` and a sole binding never satisfy it. Without the flag it exits 2, naming the available bindings and the flag. `teardown` keeps its typed instance-ID confirmation as well.

Read-only and access commands - `host status`, `host list`, `host connect` and `recipe list|show` - select by:

1. `--host <name>`;
2. otherwise `TECHNE_HOST`;
3. otherwise `default_host` in `config.toml`;
4. otherwise, when exactly one binding exists, that binding;
5. otherwise refuse with a non-zero exit, listing the available bindings and how to choose one.

A name from steps 1 to 3 that matches no binding is an error, never a fall-through to the next step. `host list` and `recipe list|show` act on no single binding, so for them selection only marks the binding the order picks. `host add <name>` names the binding it writes and uses no selection.

### Provider options

Decided: a provider-specific option is named `--<provider>-<option>` and overrides one field of the target's provider table. It is accepted only when the target uses that provider: with a binding on another provider it exits 2, naming the binding's provider; with `host status --all` it exits 2, because it would apply to several bindings. Truly global options stay unprefixed.

`techne` defines no environment variable for a provider option. Where the provider has its own variable, the option means the same as it: `--aws-profile` corresponds to `AWS_PROFILE` and `--aws-region` to `AWS_REGION`. Each resolves as the flag, then the target's provider table (a binding's `[aws]` or the controller's `[controller.aws]`), then the ambient variable, and otherwise refuses, naming all three. `techne` passes the resolved profile and region to every AWS call and harness script through those same variables, so they see exactly the values `techne` checked. An option with no provider variable - `--aws-account`, `--aws-controller-stack` and `--aws-operator-profile` - comes only from the flag or the provider table. The existing guards remain the protection against an ambient profile that points at the wrong account: the account check refuses credentials whose caller account differs from the target's `account`, and the operator-role check refuses a host command whose caller is not the binding's operator role.

The **target** is the selected binding for `techne host` commands. For the commands that act on the Techne controller rather than a host - `controller status|bootstrap`, `auth login`, and the AWS identity checks and facts in `doctor` and `diag` - it is the **controller target**, whose provider settings sit in `config.toml` under a provider-named table, `[controller.aws]`, as a binding's sit under `[aws]`. The table's name is the controller's provider, as a binding's provider table is named by its provider: `config.toml` holds at most one `[controller.<provider>]` table, and the CLI refuses a second one, any other key under `controller` or an unknown field, so the controller is configured like a binding without being one:

```toml
default_host = "agent-host"

[controller.aws]
account = "655383751458"
region = "eu-west-1"
profile = "knowledge-islands-techne"
stack = "ki-techne-ops-007-controller"
```

A controller command with no `[controller.<provider>]` table refuses, naming `config.toml`; `tools-techne` has no built-in controller default. `recipe list|show`, `help`, `completion` and the `version` and installation facts in `diag` have no target and accept no provider option.

Every current option and environment variable:

| Today | Environment today | New option | Environment | Overrides | Targets |
| --- | --- | --- | --- | --- | --- |
| `--profile` | `AWS_PROFILE` | `--aws-profile` | `AWS_PROFILE`, after the provider table | binding `aws.admin_profile`; controller `aws.profile` | host, controller |
| `--region` | `AWS_REGION` | `--aws-region` | `AWS_REGION`, after the provider table | `aws.region` | host, controller |
| `--account` | `EXPECTED_AWS_ACCOUNT` | `--aws-account` | none | `aws.account` | host, controller |
| `--controller-stack` | `CONTROLLER_STACK_NAME` | `--aws-controller-stack` | none | controller `aws.stack` | controller |
| `--host-profile` | `TECHNE_HOST_PROFILE` | `--aws-operator-profile` | none | binding `aws.operator_profile` | host |
| `--harness-dir` | `TECHNE_HARNESS_DIR` | stays global | `TECHNE_HARNESS_DIR` | - | - |
| - | - | `--host` (new) | `TECHNE_HOST` (new) | host selection | host |
| `--json`, `-h`/`--help`, `-V`/`--version` | - | stay global | - | - | - |
| `--full`, `--dry-run`, `--pull` | - | stay unprefixed command options | - | - | - |

No backwards compatibility: this table is the whole option surface. The old option names and `TECHNE_HOST_PROFILE` are simply gone - an old name meets `techne`'s ordinary unknown-option error, exit 2 - with no deprecation release, no rejection pointer and no alias, and no user-facing document names them except the changelog. `techne` no longer reads `EXPECTED_AWS_ACCOUNT` or `CONTROLLER_STACK_NAME`; the harness scripts' own variables are the H1 contract, which `techne` sets when it runs them. Help keeps the `610aa21` shape: the global options list keeps only the unprefixed options, a separate `AWS provider options` list follows it, and each command's help names the provider options its target accepts; completion, the manual, the user guide and the changelog change with it.

### Decision Record

Decided: amend [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]] in place rather than create a new record. Under `ki-decision-records` a refinement of an existing decision edits that living record so it reads as if written today, with no changelog, history or supersession wording, and its `date` advances to the as-of date of the edit. The amendment, made through this record when it is delivered, adds to the Decision:

- the vocabulary: recipe, binding, provider and footprint;
- ownership: recipes, provider sections, stacks and provider operations in `ki-techne-harness`; the grammar, binding loader, adapter interface and dispatch, and each adapter's operator-scoped lifecycle calls in `tools-techne`, joined only by the manifest and environment-variable contract;
- bindings and the controller target as per-person configuration outside both repositories, located as above, consistent with the existing consequence that persona identity and credentials stay outside both;
- provider neutrality of the recipe and binding schemas and of the CLI, citing [[ADR-TECHNE-001-provider-neutral-isolated-agent-execution|ADR-TECHNE-001]], which it already depends on.

It states no host selection order or schema fields, which belong to the receivers' specifications and guides, and no hold authority, which [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] owns. ADR-TECHNE-003 is a `shared_record` whose closing paragraph calls the `ki-techne-principal` copy a semantically identical retained projection. That repository is retired and archived read-only, so its copy cannot follow the amendment; the amendment therefore rewrites that paragraph to say Arcadia holds the only live copy and the archived copy is historical evidence at its last revision, and removes `shared_record: true` from ADR-TECHNE-003, which the standard reserves for copies kept byte-identical across approved repositories. The ADR series stays contiguous because ADR-TECHNE-001 and -002 remain in it. The four other Techne shared records carry the same paragraph and are left unchanged by this record.

### Hold authority

The standing exemption ([[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]], [[KI-ARCADIA-GOV-023-widen-the-agent-host-exemption-to-a-standing-one|GOV-023]]) covers exactly one host: `ki-techne-agent-host`, tagged `ki-agent-host-id=agent-host`, in `655383751458`, `eu-west-1`. A second live binding, a binding on another provider, or any binding of another recipe needs Kris's separate authority under the [[Techne Programme Hold]], and would also need a changed operator policy, new parameters and tailnet entries. Kris has deferred that: no authority is sought now, and [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|GOV-021]] on 2026-11-06 revisits it. This plan needs none of it: the model is built and tested with the existing binding only. The first binding's values reproduce today's footprint, so the one remote check - a CloudFormation change set for the parameterised stack with the first binding's values - must show no change, and Kris runs it under the existing exemption. Further bindings and any second provider exist only as offline test fixtures, never in AWS, another provider or Tailscale.

## Steps

Arcadia, at delivery:

- [ ] Amend [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]] in place as set out in Design, advance its `date`, and update its gloss in the [[Admin/Governance/Decisions/Decisions|Decisions]] index if the decision it names has widened.
- [ ] Add the recipe, binding, provider and footprint vocabulary to `Pillars/Engineering Practice/MEMORY.md` beside the agent-host entry, pointing at ADR-TECHNE-003.

Handoff items, each recording this record as origin and placed only under the cross-repository choreography in `AGENTS.md`; the receiver owns priority, plan and execution:

- [ ] **H1, `ki-techne-harness`: parameterise the `direct-host` recipe.** Add `recipes/direct-host/recipe.toml` with `providers = ["aws"]`, provider-neutral `[paths]` and `[parameters]` for setup and host status, and a `[providers.aws]` section for the stack, provision, stop and destroy scripts, their parameters and resource selectors; turn the literal host name into a stack parameter defaulting to `ki-techne-agent-host`; read the AWS values (tag, stack, parameter prefix, profiles, account, region) from environment variables in `provision.sh`, `destroy.sh` and `stop.sh`, and the provider-neutral values (host name, repositories, workspace) in `setup.sh` and `status.sh`, so those two need nothing AWS-specific; make the personal instruction file list configurable; update the runbook. Acceptance: offline template and script checks; a manifest check that every binding field in the hard-coding table is declared once, as provider-neutral or under `[providers.aws]`; `setup.sh` and `status.sh` run with no AWS variable set; and Kris's no-change change set for the first binding. Placed as `TECHNE-TOOLS-OPS-012` in `ki-techne-harness`, Now and Ready; it neither blocks nor is blocked by this record or H2.
- [ ] **H2, `tools-techne`: recipe, binding and provider commands.** The binding loader and `techne/host-binding/v1` schema, with exactly one provider table naming the provider and no `provider` key; a provider-adapter interface for `start`, `stop`, `status` and `teardown`, with the AWS adapter as its only implementation and today's `aws ec2` calls moved behind it; `connect` and `setup` provider-neutral; explicit to change, with `--host` required by `setup`, `start`, `stop` and `teardown` and the selection order for `status`, `list`, `connect` and `recipe list|show`; `techne recipe list|show`, `techne host list|add`, `status --all`; the controller target in `config.toml`'s `[controller.aws]` table; the provider options as in the table above, with no compatibility path for the old names, and with help, completion, manual, guide and changelog; replacing `TAG_VALUE`, `AGENT_HOST_NAME`, `OPERATOR_ROLE` and the host defaults with the selected binding, and passing binding values to the harness scripts, with the resolved profile and region in `AWS_PROFILE` and `AWS_REGION`. Acceptance: tests without AWS, SSH or Tailscale cover each selection step, including one binding and no default (selected), several and no default (refused with the list), an unknown name (refused), and each of `setup`, `start`, `stop` and `teardown` without `--host` - with and without `--dry-run`, with `TECHNE_HOST` and `default_host` set and with one binding - refused with exit 2; each provider option overrides its field for a host and for the controller target, and is refused for a stub-provider binding, for `status --all` and, for `--aws-operator-profile`, for the controller target; each old option name meets the ordinary unknown-option error with exit 2 and no pointer, and `TECHNE_HOST_PROFILE`, `EXPECTED_AWS_ACCOUNT` and `CONTROLLER_STACK_NAME` have no effect; `--aws-profile` and `--aws-region` resolve flag, then provider table, then ambient `AWS_PROFILE` or `AWS_REGION`, and refuse when all three are absent, and the resolved values reach every AWS call and harness script as `AWS_PROFILE` and `AWS_REGION`; an ambient profile in another account is refused by the account guard and, for host commands, by the operator-role guard; with no binding file a host command refuses and names `techne host add`, and with no `[controller.aws]` table a controller command refuses and names `config.toml`; a second fixture binding on a stub provider proves dispatch, so nothing outside the AWS adapter imports AWS code; a binding with no provider table, two provider tables, a provider table the recipe does not support or a `provider` key is refused; no built-in host or controller default remains. Placed as `TECHNE-TOOL-CLI-005` in `tools-techne`, Now and Ready; it neither blocks nor is blocked by this record or H1. It is built in parallel with H1 against this record's schema, using manifest fixtures, and integrated against H1's delivered manifest before release; its release and H3's apply happen together.
- [ ] **H3, chezmoi: render Kris's binding.** Render `~/.config/techne/config.toml` (`default_host = "agent-host"` and the `[controller.aws]` table) and `~/.config/techne/hosts/agent-host.toml` as above, with a test pinning their values against the AWS profiles and SSH entry chezmoi already manages. Because the binding ships with the CLI, H3 is delivered and applied together with the H2 release, Kris applying it after reviewing `chezmoi diff`; `techne host add agent-host --recipe direct-host` remains the manual fallback. Placed directly in the chezmoi repository's roadmap on Kris's instruction, since chezmoi is not in the choreography list, as `DOTFILES-UE-070`, Now and Ready; it neither blocks nor is blocked by this record. Retiring the `techne-agent-host` helper is not part of H3: `DOTFILES-UE-069`, awaiting review, already does it.
- [ ] Record each placed item's identifier here, with reciprocal `blocks` / `blocked by` wording only where the receiver marks a genuine prerequisite: `TECHNE-TOOLS-OPS-012` (H1), `TECHNE-TOOL-CLI-005` (H2) and `DOTFILES-UE-070` (H3), none blocking or blocked.

## Files touched

- `Admin/Governance/Decisions/ADR-TECHNE-003-techne-implementation-ownership.md`
- `Admin/Governance/Decisions/Decisions.md` (only if the gloss changes)
- `Pillars/Engineering Practice/MEMORY.md`
- This record

## Verify

- `ki repo audit --repo .` passes, including `ki-decision-records` and `ki-repo-kb-streams`.
- ADR-TECHNE-003 reads as a present-state record: no amendment history, changelog or "previously" wording; its `date` is the delivery date; no `shared_record` marker or claim of an identical retained copy remains.
- Every row of the hard-coding table is covered by a field or a named change in H1, H2 or H3, and every binding field is either provider-neutral or in the `aws` table, never both.
- No provider-neutral field, command or derivation in this record or the handoff items names AWS.
- The Design tables give every current `tools-techne` option and environment variable exactly one new name or "stays global", and no unprefixed option names a provider concept.
- Outside the dated Discussion entries, nothing in Design or the handoff items provides a `TECHNE_AWS_*` variable, deprecation release, rejection pointer, synthesised binding or controller default, or other transition path; old option names appear only where the record describes today's CLI.
- No binding schema, example or handoff item carries a `provider` key; each binding has exactly one provider table, and a binding with none or several is invalid.
- No Design text or handoff item gives `tools-techne` a built-in host or controller default; H3 is delivered and applied with the H2 release, and `techne host add agent-host --recipe direct-host` is named as the fallback.
- Controller provider settings appear only under `[controller.aws]`; no bare `[controller]` table or controller `provider` key remains in Design or the handoff items.
- Every provider option with a provider environment variable states the order flag, provider table, ambient variable, then refusal, and every option without one comes only from the flag or the provider table.
- Outside the dated Discussion entries, no wording remains under which only `teardown` requires `--host`.
- Each placed handoff item names this record as origin, states its relationship, and grants no remote authority beyond [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]].
- No en-dash or em-dash in any added line.

## Dependencies / blocks

No local `blocks` or `blocked_by`. All three handoff items are placed, each Now and Ready, none blocking or blocked by this record or one another:

- H1: `TECHNE-TOOLS-OPS-012` in `ki-techne-harness`.
- H2: `TECHNE-TOOL-CLI-005` in `tools-techne`.
- H3: `DOTFILES-UE-070` in chezmoi.

Order: H1 and H2 are built in parallel against this record's schema; H2 is integrated against H1's delivered manifest before release; H2's release and H3's apply happen together. These are cross-repository sequencing conditions, not recorded dependencies. No decision remains open.

## Delegation

Each handoff item is delivered by an agent in its receiving repository under that repository's process. Amending the ADR stays here.

## Documentation impact

### Decision Records

ADR-TECHNE-003 is amended in place through this record when it is delivered, following `ki-decision-records`: the living record is edited to read as if written today, its `date` advances, and no new Decision Record is created.

### Specifications

None here. The binding schema, controller target, host selection rules and provider options are specified in `tools-techne` under H2, and the recipe manifest schema in `ki-techne-harness` under H1.

### Guides

None here. The harness runbook and the `tools-techne` user guide change under H1 and H2.

### Roadmap

This record; handoff items `TECHNE-TOOLS-OPS-012` in `ki-techne-harness`, `TECHNE-TOOL-CLI-005` in `tools-techne` and `DOTFILES-UE-070` in chezmoi.

## Decisions for Kris

Answered by Kris, 2026-10-07 about 11:45 CEST:

1. **Decision Record.** Amend ADR-TECHNE-003; no ADR-TECHNE-004.
2. **Binding location.** One file per binding at `~/.config/techne/hosts/<name>.toml`, with `default_host` in `~/.config/techne/config.toml`.
3. **First binding's name.** `agent-host`.
4. **Who files the chezmoi task** (about 12:30 CEST). Arcadia places it directly in the chezmoi repository's roadmap ("you do it directly"), when H2 is released; decision 8 brings this forward to now.
5. **Second live binding.** Deferred: no authority now; revisit at [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|GOV-021]] on 2026-11-06.
6. **Decision Record confirmed** (about 14:30 CEST). Amend [[ADR-TECHNE-003-techne-implementation-ownership|ADR-TECHNE-003]] in place, as Design sets out; the archived `ki-techne-principal` copy is historical evidence of its last revision there.
7. **Provider named by its table** (about 14:50 CEST). A binding has exactly one provider table, which names the provider; there is no `provider` key, matching `[controller.aws]`, and a binding with no provider table or several is invalid.
8. **Ship the binding with the CLI** (about 14:50 CEST). No built-in defaults: host commands refuse without a binding. H3 is delivered and applied together with the H2 release, so there is no gap, and `techne host add agent-host --recipe direct-host` remains the manual fallback. This brings H3's placement forward from after the H2 release to now.

No question remains open.

## Discussion

### Capture

Captured as Triage on Kris's instruction, 2026-10-07. No plan yet.

### Adoption and planning

Kris Brown, 2026-10-07 11:20 CEST: "lets get some movement on it" - adopted into Now and planned the same day, with five open questions answered in Design as recommendations grounded in the code.

### Decisions and providers

Kris Brown, 2026-10-07 about 11:45 CEST, answered decisions 1, 2, 3 and 5 as recorded above and left 4 open. Kris added two requirements, folded into Design, Steps and Verify: an explicit host selection rule with a single-binding default and a teardown that always needs `--host`; and a provider dimension, since AWS is not the only possible provider, with only the AWS adapter built now. Planning also found that amending ADR-TECHNE-003 breaks its shared-record claim, because its mirror sits in the archived `ki-techne-principal`; Design resolves this within the amendment. With decision 4 the only open question, and it gating only H3 after the H2 release, the record is Ready on Kris's instruction.

### Explicit to change and provider options

Kris Brown, 2026-10-07 about 12:30 CEST, decided three more points, folded into Context, Design, Steps and Verify. Host selection is "explicit to change": `setup`, `start`, `stop` and `teardown` require `--host`, replacing the earlier rule under which only `teardown` did. Decision 4 is answered: Arcadia places the chezmoi item directly, when H2 is released. Provider-specific global options take the provider's prefix and override the target's provider table; planning read `tools-techne` `6f415f1` to map every option and environment variable, chose the `config.toml` controller target for the controller commands, and recommends rejection with a pointer over a deprecation release. CLI-004 is now accepted, so H2 can be placed with H1. No question remains, and Kris's answers are the approval: the record stays Ready.

### No backwards compatibility and provider environment

Kris Brown, 2026-10-07 about 14:30 CEST, refined the option design, folded into Context, Design, Steps and Verify. No backwards compatibility: the record designs only the desired CLI surface, the transition plan is removed, and old option names are simply gone, with no deprecation release, no rejection pointer and no mention beyond the changelog. Controller provider settings move from a bare `[controller]` table to `[controller.aws]`, so provider settings sit under a provider-named table for both a binding and the controller. The `TECHNE_AWS_*` variables are dropped: `--aws-profile` and `--aws-region` mean the same as `AWS_PROFILE` and `AWS_REGION`, resolved flag, then configuration, then the ambient variable, with the account and operator-role guards as protection against an ambient profile in the wrong account; account, controller stack and operator profile come only from the flag or configuration. Kris confirmed amending ADR-TECHNE-003 in place, the archived `ki-techne-principal` copy being historical evidence. Planning also removed the synthesised first binding and controller target, which existed only for transition. No question remains, and the record stays Ready.

### Provider table and shipping the binding

Kris Brown, 2026-10-07 about 14:50 CEST, answered "both" to two points, folded into Context, Design, Steps and Verify. The binding's `provider` key is dropped: its one provider table names the provider, as `[controller.aws]` does for the controller, and a binding with no provider table or several is invalid. The binding ships with the CLI: with no built-in defaults, H3 is delivered and applied with the H2 release rather than placed after it, and `techne host add` is the manual fallback. Kris's earlier instruction to hand the work to the owning repositories once settled was applied the same afternoon: H1, H2 and H3 are placed as `TECHNE-TOOLS-OPS-012`, `TECHNE-TOOL-CLI-005` and `DOTFILES-UE-070`, each adopted into Now and planned Ready from the steps above, none yet implemented. H1 and H2 are now built in parallel against this schema, replacing the earlier wording under which H2 depended on H1. The record stays Ready.

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
