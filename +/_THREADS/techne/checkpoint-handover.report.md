# Checkpoint handover - report

Authority: Decision 21.

## Done

- Rewrote `+/_CHECKPOINTS/agent-host.md` as a cold-start snapshot dated 2026-10-09, keeping the frontmatter and the six closed headings and bumping `updated_at`. It records:
  - the live TECHNE-TOOLS-OPS-014 result;
  - the `--pull` fix;
  - the ki 0.10.0 pin not yet taken up on the host;
  - the draft pilot pair and the triage queue behind it;
  - four open questions for Kris, and the next steps.
- Updated the status prose in `Streams/Projects/agent-host/agent-host.md`, with no record identifiers: durability is now live, the host is still on the previous ki, and the pilot pair is planned and awaiting approval.
- Commit `78e195a` in ki-arcadia-principal (`docs(checkpoint): hand over the agent-host thread's outstanding state`). It is local only, with explicit paths, and the pre-commit rumdl check passed. No other changes were in the working tree.
- Audit: `ki repo audit --skill ki-checkpoint` PASS. `ki-repo-kb` and `ki-repo-kb-streams` gave FAIL=0 WARN=1, and that warning (STREAM-10) is on the untouched `island-model-and-tending` note.

## Failed

- None.

## Needs the owner

- **The brief's pending pushes are already done.** The local tracking refs show `ki-techne-harness` pushed to 70c3389 at 06:37 BST and the chezmoi source pushed to 423fae7 at 06:41 BST on 2026-10-09. `origin/main..main` is empty in both repositories, so 423fae7 was the only unpushed chezmoi commit. I made no fetch, so this reflects the last push from this Mac. The checkpoint therefore records the pushes as done, not pending.
- **The setup rerun for ki 0.10.0 is unblocked but has not run.** Decision 20 already authorises it, and the checkpoint lists it as the first next step.
- **Open questions in the checkpoint:**
  1. Approve the TECHNE-TOOLS-OPS-015 and DOTFILES-UE-073 plans.
  2. Confirm the pilot's record-level choices.
  3. Take the `chezmoi cat` removal out of TECHNE-TOOLS-OPS-019.
  4. Grant SSH for the pilot's live run.
