# TS-OAUTH owner report — capture agent-host Tailscale key minting

## Done

- Captured [KI-TECHNE-OPS-027 — Agent-host Tailscale key minting](/Users/krisbrown/workspaces/knowledge-islands/ki-techne-harness/docs/roadmap/KI-TECHNE-OPS-027-agent-host-tailscale-key-minting.md) as an unadopted triage record with no horizon (Decision 50). It states the need, the proposal (a one-time, tag-scoped OAuth client whose secret stays in 1Password; `provision.sh` mints the single-use key straight into Parameter Store; the hand route stays as fallback), the security boundary, the open questions (where the secret is read from, how `destroy.sh rebuild` prints the sequence, whether `tools-techne` needs a `[status]` or binding field, expiry), and that it blocks nothing. Capture only: nothing was implemented.
- No duplicate record found. The audit allows titles of at most four words, so the title is "Agent-host Tailscale key minting".
- Two local commits on `main`: `1c3a437` reserves the identifier (ledger only), and `f9ae0b9` adds the record. Each commit staged only its own explicit path.
- Checks: `ki repo audit` passes for `ki-work`, `ki-work-roadmap` and `ki-authoring`; rumdl is clean; the pre-commit hooks passed on both commits; `git status` is clean.

## In progress

Nothing.

## Changed assumption

The brief said another session had an uncommitted roadmap file and a reserved KI-TECHNE-OPS-025 in this checkout. When this run started, the checkout was already clean: KI-TECHNE-OPS-025's record was committed in `e8f5894`, and the ledger already stood at OPS 026. So no other session's files were left uncommitted, and I touched none of them.

## Pending handoff

- `ki-techne-harness` on this Mac (mac-studio), branch `main`: 2 commits not pushed (`1c3a437`, `f9ae0b9`).

## Outstanding queries

- **Needs: TS-OAUTH-ADOPT** — Adopt KI-TECHNE-OPS-027? If yes, say the horizon (recommended: Later, because using it waits for the Programme Hold, although the local implementation could go ahead now) and the `kind`.
- **Needs: TS-OAUTH-PUSH** — Push the two commits on `ki-techne-harness` `main`?

```text
TS-OAUTH-ADOPT: <yes, horizon now|next|soon|later, kind …> | <leave as triage>
TS-OAUTH-PUSH: <push> | <hold>
```
