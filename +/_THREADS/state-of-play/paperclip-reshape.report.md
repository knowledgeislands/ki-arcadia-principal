# Paperclip: shut-down, knowledge capture and rebuild proposal

Read-only proposal. Nothing was stopped, changed or committed. Kris's direction is the 2026-10-14 ~11:30 BST instruction to shut Paperclip down, capture what running it taught us and rebuild once the ways-of-working model settles. The brief cites it under the acquire-intake decision number; the decisions log records it in the following entry.

## Done

### What is running now

- **Host.** Paperclip runs on **terra** (this MacBook), not sol. It is a single instance, `default`, built from the Knowledge Islands fork at commit `2c4ac3a`. Its process was started 2026-10-13 02:08 UTC and reports healthy.
- **Service.** Rig runs it as the launchd service `uk.me.kris.rig.paperclip` (KeepAlive, RunAtLoad), bound to `127.0.0.1:3100` with embedded PostgreSQL on `127.0.0.1:54329`. It is loopback only, so stopping it touches no connection-critical path.
- **Declarations.** The chezmoi Rig configuration declares four Paperclip resources, all in the `laptop` profile:
  - `service.paperclip`, desired state `running`, in `conf.d/50-services.toml`;
  - `port.paperclip`, mode `required`, in `55-ports.toml`;
  - `tool.paperclip` and `tool.paperclip-agents` (desired-state reconcile), in `15-command-line.toml`.

  chezmoi also owns `~/bin/paperclip-setup`, `paperclip-reconcile` and `paperclip-check-repairs`, `~/.config/paperclip/{desired-state,repairs}.json`, the fork staging scripts and [the operations guide](/Users/krisbrown/.local/share/chezmoi/docs/guides/tools/paperclip.md).
- **The `paperclip-agents` drift.** Rig's apply of `tool:paperclip-agents` failed on 2026-10-12 at 01:44 UTC, and `paperclip-reconcile --check` still exits 3 with drift on all nine declared agents (KIS: 4, HNR: 5). The cause is the workspace re-layout: the live agents still point at the old folders (`~/workspaces/kit/knowledgeislands`, `~/workspaces/hnr/...`), while the desired state names the new ones. This is a stale-path problem, not the cask defect.
- **Data.** `~/.paperclip` holds 11.6 GB:
  - `instances/default` holds 7.4 GB:
    - the database is 379 MB;
    - hourly `.sql.gz` backups take 6.6 GB, kept for 30 days, the latest from 11:08 today;
    - run logs take 159 MB and company homes 302 MB.
  - `cli` holds 4.2 GB: the fork payload plus the retained npm rollback.
  - `repairs` holds 1 MB of irreplaceable evidence, including the 151 historical issue-key aliases.

  The instance runs in `local_trusted` mode with no login, has telemetry and update checks on, and `allowedHostnames` is empty.
- **State of work.** The instance is quiescent: no drain, no active runs and no pending wakes.

  | Code | Name | Agents | Issues: total, in review, blocked | Routines |
  | --- | --- | --- | --- | --- |
  | KIS | Knowledge Islands | 4, all paused | 104, 17, 18 | 2, paused |
  | VA | Valle Armonia | 3; Guru and Sakshi in error | 34, 8, 4 | 4, paused |
  | HNR | Humans Not Robots | 5; Wren in error with a timer heartbeat on | 51, 8, 0 | none |
  | TMX | Techmedix | 2 | 10 | none |
  | LGL | Legal (Kit) | 2 | 7 | none |
  | KIT | Kit (Personal) | 2 | 3 | none |
  | ER | Equal Remedy | 1; Dike in error | 7 | none |

  - **Sacred Inquiry** has no organisation.
  - **KIS projects** still exist for retired or renamed repositories: `ki-techne-principal`, `ki-arcadia-principal`, `ki-website`, `ki-plugins` and the Codex and ChatGPT housekeeping servers.
  - **Worktree folders** under the instance are all empty.
  - **Agent branches.** Ten local `paperclip/aligned-20260926/*` branches remain, in `hnr-principal` (6), `hnr-agentic-harness` (2), `hnr-shared` (1) and `tools-ki` (1). Each has a remote copy.
- **Techne.** There is no runtime dependency on Techne. There is a governance one: the [Techne Programme Hold](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Policies/Techne%20Programme%20Hold.md) holds "remote Paperclip in any form". Its standing exemption for `sol` allows agents only in sessions Kris opens, with no unattended or scheduled agents. The chezmoi guide also says Paperclip's eventual home is "the remote agent host, never the Mac Studio". Both now conflict with the Mac Studio plan; see HOLD.

### Units and hand-offs

These are the units for Kris to sanity-check.

| Unit | Boundary | Owner | Hands off |
| --- | --- | --- | --- |
| 1 Capture | Turns running knowledge into island knowledge. It does not change Paperclip. | Knowledge Islands Principal: the reshaped Project, plus a Pillars note under Enactment | The capture note and inventory go to units 2 and 4 |
| 2 Shut-down | Stops the service with all data kept and a rehearsed restore. It does not delete anything. | chezmoi, through its Rig declarations, and `rig apply` on terra | A stopped, restorable instance goes to unit 4 |
| 3 Ways-of-working model | Defines threads, masters, decisions and reports. Out of scope here. | The ways-of-working Project | The settled model goes to unit 4 |
| 4 Rebuild design | Maps the model onto eight organisations using Paperclip's building blocks. Design only. | The reshaped Project | A design and its hosting needs go to unit 5 |
| 5 Hosting and naming | Covers `sol`, the service names, TLS and the tailnet firewall. | Rig (resources, firewall), chezmoi (personal declarations), Kris (Tailscale admin console) | A name URL that reaches Paperclip on `sol` |

Techne owns none of these. `sol` is Kris's own hardware under the Rig Initiative, as the [mac-studio-bootstrap](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/mac-studio-bootstrap/mac-studio-bootstrap.md) Project already says. The Techne Programme Hold still governs whether Paperclip may run there at all.

### 1. Existing project: reshape, add nothing

[paperclip-bootstrap-and-recovery](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/paperclip-bootstrap-and-recovery.md) has no open records, and its VA-delivery outcome is now moot. The proposal:

- **Rename** it to `paperclip-capture-and-rebuild` ("Paperclip capture and rebuild") and update the two inbound links, in `Projects.md` and [agent-host](/Users/krisbrown/workspaces/knowledge-islands/ki-principal/Streams/Projects/agent-host/agent-host.md). Keep it under the Techne Initiative, and add a cross-link to mac-studio-bootstrap for hosting.
- **New outcome:** "Paperclip's operating knowledge is captured in the island; the terra service is stopped with every byte kept and a rehearsed restore; a rebuild design for eight organisations on `sol` is ready once the ways-of-working model settles."
- **Phases** as Project sections, not records: Capture, Shut down, Design (waits on ways-of-working), Rebuild (waits on HOLD).
- **Existing content.** The Constraints move into the capture note as "what we ran under". Naming themes and the open ideas become rebuild questions. The cancelled-record ideas already in Notes, run-MCP verification and citing the coordination rules, fold into the rebuild questions.
- **Records.** None to add. The shut-down is a bounded owner instruction to chezmoi. The Pillars capture rides the same owner instruction under Enactment.

### 2. Shut-down plan

The plan preserves all data and ends with a restore rehearsal. Nothing here is connection-critical: the service is loopback only.

1. **Export while running** (read-only API), into the capture folder (see CAPTURE-STORE):
   - companies, projects, agents with their instructions, adapter and runtime configuration, minus secrets;
   - routines;
   - every issue with its comments and status;
   - the live-runs and drain state;
   - the branch inventory.

   Record the counts in the table above as the restore fingerprint.
2. **Hot backup.** Run `paperclipai db:backup --json` into a dated folder outside the 30-day rotation.
3. **Make the stop survive `rig apply`** with one chezmoi change, reviewed through `chezmoi diff`:
   - set `service.paperclip` to `desired-state = "stopped"` and `start-policy = "manual"`;
   - set `port.paperclip` to `mode = "on-demand"`, so a closed port is not a failure;
   - set `tool.paperclip-agents` to `profiles = []`, so Rig stops reconciling agents against a stopped service. Their stale paths are recorded as a lesson, not fixed.
   - Keep `tool.paperclip` and the payload installed, so a restore is just a flip back.

   Then run `rig apply --target service:paperclip --scope resources --dry-run`, followed by the approved real run.
4. **Verify the stop:**
   - launchd shows no PID;
   - nothing listens on 3100 or 54329;
   - `rig status` and `rig doctor` show no Paperclip failure.
5. **Cold copy.** With the service stopped, archive `~/.paperclip/instances/default` and `~/.paperclip/repairs` without the rotating backups, plus the latest backup file, to the capture store. Also copy the plist, `desired-state.json` and `repairs.json`.
6. **Restore rehearsal.** Flip `desired-state` back to `running` and apply the same target, then check:
   - `paperclipai health --json` reports the same commit;
   - `paperclip-check-repairs --live` passes, including the 151 aliases;
   - companies, agents and issue counts match the fingerprint.

   Then stop it again through step 3. Rehearsing on the real instance is cheaper and truer than restoring into a scratch instance. It confirms both the declaration path and the data.
7. **Keep, don't delete.** Keep the instance, `cli`, the backups and the agent branches until the rebuild is accepted.

A deferred clean-up, after the rebuild is accepted: archive the instance, retire the npm rollback payload (4.2 GB) and decide each `paperclip/aligned-*` branch.

### 3. Knowledge capture

- **Where it goes:**
  - **Pillars:** one durable note, `Pillars/Engineering Practice/Operating Model/Paperclip Operating Lessons.md`, covering what worked, what failed and the rules we would keep.
  - **The Project's `design/` folder:** the dated inventory (`paperclip-estate-snapshot-2026-10.md`).
  - **Raw exports and the cold copy:** these stay out of Git, in the capture store.
  - **Generic coordination rules** that should change: a handoff later to the harness skill `ki-agent-coordination-paperclip`, which owns them.
  - **Organisation-specific results,** for example VA's naming theme: recorded as handoffs to each territory's Capital. Nothing is written into their repositories now.
- **Outline of the Pillars note:**
  1. Purpose and timeline: onboarded 2026-09-25, fork from 2026-10-01, VA pilot, shut down 2026-10.
  2. Organisation layout: seven companies and their codes, one project per repository, the workspace-free Coordination project, naming themes.
  3. Agent pattern: `claude_local` with `opus[1m]`, concurrency one, no timer heartbeat, post-hire brief, least grants, isolated VA and TMX logins.
  4. Routines and their Activity pairing (all paused).
  5. Operations: drain and restart, the repair gates, the fork build. A pointer to the chezmoi guide, not a copy.
  6. **Failures and lessons:**
     - the company-code rename (HUM to HNR, KNO to KIS) broke 151 issue keys;
     - the OpenAI project-auth guard;
     - the embedded PostgreSQL library aliases;
     - the grant-update defect;
     - "a 200 is not proof a config write applied";
     - restarts interrupted runs;
     - agents stuck in error;
     - 33 issues in review never landed in local main;
     - agent paths silently went stale after the workspace re-layout;
     - projects pointing at retired repositories;
     - `local_trusted` has no login;
     - the CEO-self-review and Coordination rules.
  7. What worked.
  8. Questions carried into the rebuild.
  9. Evidence locations.

### 4. Rebuild direction

- **Eight organisations, one per territory:** KI, HNR, ER, TMX, VA, LGL, Personal and SI. Sacred Inquiry is new. "Legal (Kit)" and "Kit (Personal)" lose their legacy names.
- **Build fresh, not migrate.** A new instance on `sol`, with codes chosen once (see CODES), avoids the issue-key rename defect. The terra instance stays as a read-only archive.
- **Per-organisation paradigms.** These are open questions until ways-of-working settles; each maps a thread-model concept onto a Paperclip building block:
  - Territory master thread to the company CEO agent, or to the board (Kris)?
  - Thread to issue, or to project? Decisions log to approvals? Owner report to an issue comment or a document?
  - Checkpoint to company memory or a skill?
  - Projects: one per repository again, or one per Capital plus Coordination?
  - Routines: which repository Activities run as routines, and with what active-run guard?
  - Heartbeats: whether any timer heartbeats at all, given the `sol` exemption's "no unattended agents".
  - Execution workspaces: worktree policy and how candidates reach local main.
  - Budgets, skills (KI skills through mise) and login isolation per organisation.
  - Which organisations run continuously and which only on demand.
- **Hosting on `sol`.** Paperclip stays loopback-bound, reached through a name over the tailnet; see section 5. Rig declares it in the `studio` profile, with the `laptop` declarations removed afterwards. All of this waits on HOLD.

### 5. Naming and access over Tailscale

The current state:

- MagicDNS is already on, with the tailnet suffix `tail30fd93.ts.net`.
- `sol`, `terra`, `vega` and `phone` already resolve by name.
- Tailscale HTTPS certificates are not enabled, and nothing is configured in Tailscale Serve.
- The macOS application firewall is off on both Macs.
- Rig already has a `[firewall.ID]` declaration that limits a port to the tailnet with `pf`. It comes from Rig's tailnet-only listener firewall work, [KI-TOOL-RIG-CORE-047](/Users/krisbrown/workspaces/knowledge-islands/tools-rig/docs/roadmap/KI-TOOL-RIG-CORE-047-tailnet-only-listener-firewall.md), which is awaiting review.
- "`ssh sol` fails" only because chezmoi's `known_hosts` keys `sol` by address. That gap is already captured in chezmoi as [KB-DOTFILES-UE-088](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/KB-DOTFILES-UE-088-ssh-alias-for-sol.md).

The options compared:

| Option | URL shape | Per-service names | TLS | Firewall changes | Moving parts | Fit |
| --- | --- | --- | --- | --- | --- | --- |
| MagicDNS host names | `http://sol:3100` | No, ports stay | No | Paperclip must bind beyond loopback, plus a Rig `pf` tailnet-only rule for 3100 | Fewest | Fails "no ports" |
| Tailscale Serve, HTTPS `*.ts.net` | `https://sol.tail30fd93.ts.net` (one service at root, others on paths or ports) | Only with Tailscale Services (`https://paperclip.tail30fd93.ts.net`); confirm current availability first | Automatic certificate | **None:** tailscaled proxies to loopback and no listener opens | Low: tailnet HTTPS turned on once, a serve config per service | Best near-term |
| Private domain with split DNS | `https://paperclip.sol.<domain>` | Yes | Let's Encrypt DNS-01 through a Cloudflare token | Proxy on 443, plus a Rig `pf` tailnet-only rule for tcp:443 | DNS server or records, proxy, certificate renewal, a token in the secret store | Exact shape Kris described |
| Reverse proxy, subdomain per service | As above | Yes | As above | As above | Caddy on each host | Pairs with the private domain; not on its own |
| mDNS `.local` | `sol.local` | No | No | None | None | Fails: mDNS does not cross Tailscale |

- **Naming convention.**
  - **Machines** keep celestial names: `terra`, `sol`, `vega`. A new machine gets the next name, and that name is its tailnet name.
  - **Services** are named by function, not by host or territory: `paperclip`, `observatory`, and so on. One Paperclip serves all eight organisations, so territory does not appear in the name; organisations are paths inside the application.
  - **The long-term shape** is `<service>.<zone>`, with `<service>.<host>.<zone>` only where two hosts run the same service. That lets a service move host without changing its URL.
  - **Local-only sites** keep their loopback names, for example `observatory.local`.
- **Recommendation:**
  - **Phase 1:** Tailscale Serve with ts.net HTTPS, using a Tailscale Service name `paperclip.tail30fd93.ts.net` if the feature is available, otherwise `sol.tail30fd93.ts.net` at root. No firewall change.
  - **Phase 2,** only when a second web service needs its own name: a private zone such as `ts.midnight.ninja` with split DNS and Caddy.
- **Security catch.** Exposing a `local_trusted` instance gives every tailnet device full board access without a login, and that includes the tagged `vega`. The tailnet access policy must therefore allow only Kris's own devices to reach `sol` on port 443. Alternatively, the rebuild switches Paperclip to its authenticated mode.
- **Privacy note.** ts.net certificates publish the machine name in public Certificate Transparency logs.
- **Ownership.**
  - Kris owns the Tailscale admin console: turning on HTTPS, the access policy, and Services approval.
  - Rig owns the service and firewall declarations on `sol`. A serve-config resource would be new Rig capability, so a chezmoi-owned script is the stopgap.
  - chezmoi owns the personal declarations and the `ssh sol` alias.
  - Techne owns nothing here. The Hold governs only whether Paperclip may run on `sol`.
- **Rollout.** It must reconnect first, with a tested restore, and Kris is never handed a raw command:
  - **Before the change:** confirm an independent path to `sol`, either Tailscale SSH by address or Screen Sharing.
  - **The change:** add the serve config.
  - **Checks:** test the URL from `terra` and `phone`, and confirm that SSH and Screen Sharing still work.
  - **Restore:** remove the serve config with `tailscale serve reset`, run by Rig or the script, and recheck SSH.
  - **Phase 2's `pf` rule** also needs CORE-047's rehearsed restore, in which SSH (tcp/22) is never filtered.

## In progress

Nothing. This run is complete; nothing waits on it.

## Needs the owner

### PAPERCLIP-PROJECT - Reshape the existing Project

- **Summary:** Rename paperclip-bootstrap-and-recovery to paperclip-capture-and-rebuild, with the new outcome and four phases. Add no records.
- **Need from you:** Approve the reshape and the rename.
- **Recommendation:** Approve. It touches three files in Knowledge Islands Principal, under your instruction in place of a record.

### PAPERCLIP-SHUTDOWN - Stop Paperclip on terra

- **Summary:** Export, then back up, then the chezmoi declaration change (stopped, on-demand port, agents out of the profile), then a targeted `rig apply`, a cold copy and a restore rehearsal. Nothing is deleted.
- **Need from you:** Approve the plan and the chezmoi change, and say whether the restore rehearsal should run.
- **Recommendation:** Approve with the rehearsal. The service is quiescent now, so no drain is needed.

### CAPTURE-STORE - Where the raw exports and cold copy live

- **Summary:** About 1 GB without the rotating backups. It must stay out of Git and may contain private company content.
- **Need from you:** Choose the store.
- **Recommendation:** `sources-knowledge-islands/paperclip/2026-10-capture/` on OneDrive, if Knowledge Islands Principal declares that source store. Otherwise a local archive under `~/.paperclip/archive/` until a store is declared.

### HOLD - Paperclip on sol conflicts with the Techne Programme Hold

- **Summary:** The Hold keeps "remote Paperclip in any form" held. The `sol` exemption bars unattended and scheduled agents, and the chezmoi guide says "never the Mac Studio".
- **Need from you:** Decide whether to amend the Hold or the `sol` exemption through Enactment when the rebuild is ready.
- **Recommendation:** Defer until the design is ready. The shut-down and capture need no Hold change.

### CODES - Organisation codes for the rebuild

- **Summary:** The current codes (KIS, KIT) differ from the territory aliases (`ki`, `kb`), and renaming codes in place broke 151 issue keys once.
- **Need from you:** Choose the codes.
- **Recommendation:** A fresh instance with codes taken from the territory aliases in capitals: KI, HNR, ER, TMX, VA, LGL, KB, SI.

### NAMING - How to reach services by name over Tailscale

- **Summary:** Five options compared above. MagicDNS is already on, and HTTPS and Serve are not configured.
- **Need from you:** Choose the approach and the convention.
- **Recommendation:** Tailscale Serve with ts.net HTTPS, with a `paperclip` Service name if available, and no firewall change. Restrict `sol:443` in the access policy to your own devices. Function-named services. A private zone with Caddy only when a second web service needs it.

### PAPERCLIP-AGENTS-DRIFT - The failed apply on 2026-10-12

- **Summary:** Stale agent workspace paths after the re-layout, not a Rig defect.
- **Need from you:** Confirm the treatment.
- **Recommendation:** Don't fix it. Take `tool.paperclip-agents` out of the profile in the shut-down and record the stale paths as a lesson.

```text
PAPERCLIP-PROJECT: approve reshape and rename | reshape, keep slug | hold
PAPERCLIP-SHUTDOWN: approve with rehearsal | approve without rehearsal | hold
CAPTURE-STORE: OneDrive sources-knowledge-islands | local ~/.paperclip/archive | other:
HOLD: defer to design | amend now | keep Paperclip off sol
CODES: territory aliases (KI HNR ER TMX VA LGL KB SI) | keep current codes | other:
NAMING: Tailscale Serve ts.net + Service name | private domain + Caddy | MagicDNS + ports | other:
PAPERCLIP-AGENTS-DRIFT: drop from profile, record lesson | fix paths first
```

---

```text
STATUS: REST - proposal delivered; nothing stopped, changed or committed
WAITING ON: Kris - seven replies above
RESUME: read paperclip-reshape.report.md, then act on the replies
```
