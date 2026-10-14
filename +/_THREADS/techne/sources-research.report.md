# Sources research - reaching declared source stores from any host

Run under [Decision 51](</Users/krisbrown/.local/state/ki/agents/techne/decisions.md>) (read-only). Written 2026-10-14 07:38 BST on terra. Thread checkpoint: [techne.agent-host](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/+/_CHECKPOINTS/techne.agent-host.md>).

## In plain language

Each territory keeps its original files (PDFs, emails, photos, videos) in a "sources" folder in OneDrive, apart from its Git notes. Kris was right about Knowledge Islands. Its sources folder is **empty**, and vega only carries Knowledge Islands repositories. On vega the folder's absence changes nothing except one thing: a `ki` repair step stops early and skips setting up skills. That is a small fault in `ki`, not a missing-data problem.

The other territories do depend on their sources, Legal and TechMedix most of all. Legal holds about 23 GB across 10,000 files, changes every week and has a weekly audit. But none of those repositories is on vega, and the Techné hold allows no scheduled agents there. So today their sources matter only on the Macs, which already have OneDrive. "Accessible from anywhere" only becomes a real need if non-Knowledge-Islands work moves onto vega or another Linux host. If it does, the safest route is a read-only copy pushed from sol over Tailscale, with OneDrive kept as the master. Putting a OneDrive sign-in on vega would give it access to Kris's whole personal drive.

Recommendation: fix vega now with a no-code stopgap, fix the `ki` repair fault properly, and set up cross-host sync only when a named territory needs it on a named host.

## What has been done

### Impact by territory

All eight territory Capitals declare `store_roles = ["notes", "sources"]` (each `<repo>/.ki.toml`, `[skills.ki-repo]`). No other registered repository declares a store, and `ki repo store scan --estate` reports `UNDECLARED=0`. `ki repo store list --principals` on terra shows all 16 stores bound, with each `sources` role at `~/Library/CloudStorage/OneDrive-Personal/sources-<territory>`. Sizes and counts below are file metadata only (`find`, `du`), taken on terra on 2026-10-14. Mirror counts are notes with `mirrors:` or `source_path:` frontmatter, and alias references are `<alias>-sources/` path strings in Markdown.

| Territory (Capital) | Store size and files | Changed 7d / 30d | Notes relying on it | Writers and readers | On vega? | Impact without store |
| --- | --- | --- | --- | --- | --- | --- |
| Knowledge Islands (ki-principal) | 0 B, 0 files | 0 / 0 | 0 mirrors, 0 provenance | None found | Yes | Nil for content. Only `ki repo repair` fails, so skills are not projected |
| Legal (legal-principal) | 23 GB, 10,330 files, 46 over 100 MB | 77 / 485 | 1,653 mirrors, 2,013 provenance, 8,833 refs | Source Filing Policy (four ingestion routes), Gmail Import Activity (writes `.eml`), weekly scheduled `legal-audit-sources` (hash registry, duplicates, orphans) | No | High on any host that files, audits or analyses evidence. Reading mirror notes still works |
| TechMedix (tmx-principal) | 766 MB, 1,379 files (mostly `.eml`, `.pdf`) | 0 / 1 | 1,336 mirrors, 2,034 refs | Source Filing Policy | No | High for reading originals; low churn. 53 files are cloud-only placeholders on terra |
| Personal (personal-principal) | 429 MB, 280 files | 1 / 164 | 0 mirrors (Source Store Mirroring operating model declared) | `personal/acquire` reconciliation moves binaries into stores | No | Moderate; acquisition reconciliation needs write access |
| Valle Armonia (va-principal) | 2.8 GB, 25 files (7 `.mp4`, 3 over 100 MB) | 9 / 9 | 0 | Inbox `+/` only | No | Low reliance, but large media |
| Humans Not Robots (hnr-principal) | 69 MB, 76 files | 19 / 21 | 0 | Inbox `+/` only; email routing notes mention OneDrive | No | Low to moderate; active inbox |
| Sacred Inquiry (si-principal)† | 30 MB, 13 files | 0 / 0 | 14 mirrors | None found | No | Low |
| Equal Remedy (er-principal) | 1.5 MB, 6 files | 0 / 0 | 0 | None found | No | Negligible |

† Sacred Inquiry was not in the brief's list but declares and binds a store (`ki repo store list --principals`).

Total across stores: about 27 GB. vega's disk is 40 GB in total (`ki-techne-harness/docs/guides/operator/agent-host.md:24`), so a full mirror would not fit, and Legal alone would take most of it.

### What breaks on a host without a store

- **`ki repo repair`** throws `declared sources store is not bound` (`tools-ki/src/core/storage/local-stores.ts:24`). It then `continue`s before projecting skills (`tools-ki/src/commands/repo/repair.ts:69-90`). The repair stops because of the store, though skill projection does not need it. This is the vega fault.
- **`ki repo open`** hard-fails the same way (`tools-ki/src/commands/repo/open.ts:70-77`), and so does the VS Code workspace builder (`tools-ki/src/core/manage/vscode.ts:86`).
- **`ki repo store create`** assumes a macOS OneDrive root (`tools-ki/src/core/storage/repository-stores.ts:80-81`). `ki repo store bind` accepts any existing absolute directory (`repository-stores.ts:185`, `local-stores.ts:9-15`).
- **Unaffected:** mirror notes, KB search and `mcp-ki-kb-fs`. The mirror contract says no label reader opens, hashes or resolves a source store (`ki-agentic-harness/skills/repo-structure/ki-repo-kb/references/standards-source-mirrors.md:47`), and Git notes stand in for each file (`standards-source-mirrors.md:7-14`).
- **Degraded:** filing, acquisition reconciliation, checksum audits and anything that reads an original.

### Where Kris's suspicion holds

- **Holds:** for Knowledge Islands the impact is close to nil, because the store is empty and nothing reads or writes it. The only cost is the repair fault.
- **Holds:** Legal and TechMedix depend heavily on their stores, Personal moderately.
- **Does not hold for vega today:** vega carries only the 20 Knowledge Islands repositories (`ki-techne-harness/operations/aws/agent-host/host/repositories.txt`). The [Techne Programme Hold](</Users/krisbrown/workspaces/knowledge-islands/ki-principal/Admin/Governance/Policies/Techne Programme Hold.md>) agent-host exemption allows no unattended or scheduled agents there, so Legal's weekly audit could not move to vega anyway.
- **The bigger maintenance issue is on the Macs.** Only Legal has a hash registry and an audit, while TechMedix has 1,336 mirrors and no equivalent audit. terra has cloud-only placeholders in TechMedix and HNR, and terra's disk is 93% full (65 GB free, `df -h`).

### Options compared

External claims come from vendor documentation at the URLs given. This run was forbidden network calls, so they were **not re-fetched today**; check them before any design is accepted.

| Option | What it gives | Credential and security boundary | Consistency | Cost | Owner | Effort |
| --- | --- | --- | --- | --- | --- | --- |
| A. `ki` treats an unavailable store as degraded, not fatal; the machine-local registry can mark a store "not on this host" | Repair projects skills; `open` skips the store with a warning; honest per-host state | None; local code only | N/A | None | tools-ki | Small: repair, open and vscode call sites plus registry schema |
| A0. Stopgap: on vega, bind `sources` to an empty read-only local directory, then repair | Unblocks vega today with no code | None | Fine while the Knowledge Islands store is empty. Misleading once it has files, so make the directory read-only | None | techne.agent-host thread; optionally `host/converge.sh` | Minutes, in session with Kris |
| B1. Syncthing sol to vega, send-only on sol, receive-only on vega ([folder types](https://docs.syncthing.net/users/foldertypes.html)) | Full local read-only copy of chosen stores on vega | Device keys only, no personal account; traffic stays in the tailnet if relays and global discovery are off ([config](https://docs.syncthing.net/users/config.html)) | Local changes on vega are flagged and can be reverted. sol must keep its stores fully downloaded, because placeholders cannot be shared ([Files On-Demand](https://support.microsoft.com/en-us/office/save-disk-space-with-onedrive-files-on-demand-for-mac-529f6d53-e148-4ec3-a2de-1ab73a1c0d92)) | Free; vega disk is the limit (Legal will not fit) | Rig (install, user service), agent-host recipe (folder set), sol enrolment | Medium |
| B2. Syncthing two-way | Agents could file on vega | Same as B1 | Conflicts become `.sync-conflict-*` files ([conflicts](https://docs.syncthing.net/users/syncing.html#conflicting-changes)). Two writers to a OneDrive-backed folder means two sync engines on one tree | Free | As B1 | Medium; ongoing conflict clean-up. Not recommended |
| C. Linux OneDrive client: abraunegg `onedrive` ([repo](https://github.com/abraunegg/onedrive)) or rclone ([OneDrive backend](https://rclone.org/onedrive/), [bisync](https://rclone.org/bisync/)) | Direct cloud access from any host | OAuth refresh token for Kris's personal Microsoft account. Personal-account Graph scopes are whole-drive (`Files.Read`/`Files.ReadWrite`); only the App Folder scope narrows it, and the stores are not in an app folder ([App Folder](https://learn.microsoft.com/en-us/onedrive/developer/rest-api/concepts/special-folders-appfolder)). Breaks the "no personal credentials on the host" rule | `sync_list` or download-only can limit what syncs; two-way inherits OneDrive conflict rules | Free | Rig plus the secret store | Low to install, high to justify. Not recommended |
| D. Object storage: S3 bucket readable by vega's instance role, or R2 | Host-independent store, fine-grained IAM ([bucket policies](https://docs.aws.amazon.com/AmazonS3/latest/userguide/example-bucket-policies.html)) | Role-based with no personal credential, but it is a new remote service, which the Techné hold keeps held. Legal and personal evidence would sit in a second cloud | Object store becomes a second authority unless OneDrive is retired | About 27 GB: under 1 USD a month on S3 ([pricing](https://aws.amazon.com/s3/pricing/)) or R2 ([pricing](https://developers.cloudflare.com/r2/pricing/)) | Techne account (held); tools-ki for sync tooling | High: policy change plus a migration |
| E1. Git LFS on GitHub | Binaries versioned beside notes | The vega token is scoped to the `knowledgeislands` org only (`agent-host.md:211-213`); evidence would sit on GitHub | Strong (Git) | Over the free quota at Legal's size ([LFS billing](https://docs.github.com/en/billing/managing-billing-for-git-large-file-storage/about-billing-for-git-large-file-storage)) | Each Capital | High. Not recommended |
| E2. git-annex ([site](https://git-annex.branchable.com/)) | Location tracking (`whereis`), minimum copy counts, `fsck` integrity checks and content-hash deduplication; content can live on OneDrive through an rclone special remote or on sol | Per-remote; vega could get content from sol over the tailnet with no cloud credential | Strong: content-addressed, explicit copies | Free | tools-ki and each Capital | High: changes the store model and mirror paths. A long-term candidate only |
| F. Network mount from sol: SMB/NFS, sshfs ([sshfs](https://github.com/libfuse/sshfs)), Tailscale Taildrive ([Taildrive](https://tailscale.com/kb/1369/taildrive)) | Live view of sol's stores with no copy | SMB/NFS kernel mounts need root, which `techne` lacks. sshfs needs vega to have SSH access to sol, a credential into Kris's machine (Tailscale SSH ACLs could bound it, [Tailscale SSH](https://tailscale.com/kb/1193/tailscale-ssh)). Taildrive shares by tailnet ACL with no key, but is alpha | Single authority (sol); fails whenever sol or the link is down; slow for large files | Free | Rig and the tailnet policy owner | Medium; fragile. Taildrive is worth watching |

### Maintenance across machines

Today the only store maintenance found is Legal's: four ingestion routes into `+/`, a weekly hash and orphan audit, and SHA-256 duplicate detection (`legal-principal/Admin/Governance/Policies/Source Filing Policy.md`, `legal-principal/Admin/Operations/Activities/File System Sources Audit Activity.md`). The mirror contract already records `mirror_sha256` for each file in Git (`standards-source-mirrors.md:22`). Any host that has the store can therefore check freshness, find orphans and find duplicates by comparing hashes, with no sync needed for the check itself. If Kris wants maintenance to be more effective, the cheapest step is to generalise Legal's audit into a shared store audit on the Macs, before any cross-host sync. git-annex is the option that builds this in. That is new feature work, so it waits under the burn-down rule in [Decision 46](</Users/krisbrown/.local/state/ki/agents/techne/decisions.md>) unless Kris asks for it.

### Recommendation

1. **Now, to unblock vega:** apply A0 in session with Kris. Create an empty directory on vega, make it read-only, `ki repo --repo ~/workspaces/knowledge-islands/ki-principal store bind sources <dir> --write`, then `ki repo repair`. Owner: the techne.agent-host thread. Record the step in the [operator runbook](</Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/guides/operator/agent-host.md>), or in `host/converge.sh`, in ki-techne-harness.
2. **Next, the real fix:** option A in tools-ki, captured as a **defect**: repair must not skip skill projection because a store is unavailable, and a host must be able to say "this store is not here". This is not a feature, so it fits the burn-down rule. After it lands, drop A0.
3. **Only when a named territory needs its sources on a named Linux host:** B1, with Syncthing send-only on sol and receive-only on that host. Use per-store folders and the smallest set that is needed; Legal is excluded at vega's disk size. sol must keep those stores fully downloaded. Rig owns install and service; the recipe owns which folders. OneDrive stays the master, and filing stays on the Macs.
4. **Longer term, if store upkeep becomes the pain:** evaluate a shared store audit, or git-annex, against Legal's existing practice. Reject C (whole-drive personal token), B2 (two writers), E1 (cost and placement) and D while the hold stands.

## What is in progress

Nothing is running.

Outstanding - no action requested now:

- **Verification limitations:** sol and vega were not inspected, because no network calls were allowed. sol's OneDrive state and whether it keeps stores downloaded are unverified. External tool claims were not re-fetched this run.
- **Retained material:** nothing was changed in any repository, host, OneDrive or chezmoi; this report is the only file written, apart from the status file.
- **Observed on terra:** disk 93% full; 53 TechMedix and 4 HNR source files are cloud-only placeholders.

## Outstanding queries

### SRC-STOPGAP - Unblock vega with an empty read-only sources binding

- **Summary:** vega's `ki repo repair` fails for ki-principal because its sources store is unbound, so skills are not projected there. The Knowledge Islands store is empty on terra, so binding vega to an empty, read-only local directory loses nothing. It is a vega environment change, made in session under the agent-host exemption.
- **Need from you:** approval to apply it on vega in the next session with you, and to note it in the agent-host runbook.
- **Recommendation:** approve. It unblocks vega in minutes, needs no credentials and is removed once SRC-REPAIR lands.

### SRC-REPAIR - Capture the tools-ki defect for unavailable stores

- **Summary:** `ki repo repair` stops before projecting skills when any declared store is unbound (`tools-ki/src/commands/repo/repair.ts:69-90`); `ki repo open` and the VS Code workspace hard-fail the same way. The registry cannot record "this store is not on this host".
- **Need from you:** approval to capture one unadopted defect record in tools-ki (capture only).
- **Recommendation:** capture it as a defect, which is compatible with the burn-down rule in Decision 46. It is the durable fix, and every future Linux host needs it.

### SRC-SCOPE - Which territories, if any, need sources off the Macs

- **Summary:** vega carries only Knowledge Islands repositories, and the Techné hold forbids scheduled agents there. No other territory's sources are needed on vega today. Legal (23 GB) would not fit on vega's 40 GB disk.
- **Need from you:** confirm that vega stays Knowledge Islands-only for now, or name the territories and host that need sources.
- **Recommendation:** keep vega Knowledge Islands-only and defer cross-host sync. When a territory is named, design B1 (Syncthing receive-only from sol) for that store alone.

```text
SRC-STOPGAP - Approved: in our next vega session, bind ki-principal's sources role on vega to an empty read-only local directory, rerun ki repo repair, and note the step in the agent-host runbook (ki-techne-harness docs/guides/operator/agent-host.md).
SRC-REPAIR - Approved: capture one unadopted defect record in tools-ki: repair must still project skills when a declared store is unavailable, open/vscode degrade with a warning, and the machine-local registry can mark a store absent on a host. Capture only, no implementation, no push.
SRC-SCOPE - Keep vega Knowledge Islands-only; defer cross-host source sync until I name <territory / none> and <host>.
```
