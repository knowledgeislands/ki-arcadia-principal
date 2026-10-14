# Decision 26 run report

## Done

- **TECHNE-TOOLS-OPS-022** (`ki-techne-harness` 08db094): the six Decision 26(b) answers are recorded as resolved in the Discussion and the plan now matches them. Kris's binding does not attach Ubuntu Pro and he restarts by hand. The Current state records the 2026-10-09 restart and the accepted 2026-10-10 stop/start. One plan change follows from answer 6: the unattended-upgrades reboot time cannot name a weekday, so the AWS provider uses a `ki-agent-host-reboot` systemd timer at the window. It fires only when a reboot is required and no one is logged in, and `Automatic-Reboot` stays `"false"`. The stack check is updated to match. Status is still `draft`.
- **TECHNE-TOOL-CLI-008** (`tools-techne` 39a25b7 reserve, 8501683 capture, 2d7b151 title fix): paired triage record for the `reboot_window` and `livepatch` binding fields and the `updates` status member. It is non-blocking and linked both ways; the TECHNE-TOOLS-OPS-022 hand-off step is ticked with its identifier.
- **Walkthrough** (`ki-arcadia-principal` d6d0480): records that Kris accepted the recommendation on 2026-10-09.
- **DOTFILES-UE-073** (chezmoi 9685af8): replanned on the chezmoi-native per-host manifest. The pieces are `config-fragments/cheztoi/hosts/<host>.toml`, one `chezmoi archive` call with `--override-data` and `--exclude=scripts,encrypted`, `scripts/cheztoi-render` as a thin wrapper, host variants as templated sources keyed on a `cheztoi` data value that defaults to empty in `.chezmoidata/`, and the optional `target_host`. Status is still `draft`.
- **TECHNE-TOOLS-OPS-015** (`ki-techne-harness` c5ec234): the optional `target_host` payload field is added and checked by `converge.sh` against `host.id`, with a refusal on mismatch. The fixtures, Verify, the guide step and the decisions for approval are updated. Status is still `draft`.
- **Checkpoint** (`ki-arcadia-principal` bd9254c): `techne.agent-host` now shows current state only. The walkthrough is accepted, the TECHNE-TOOLS-OPS-022 decisions are answered and its plan awaits approval, the DOTFILES-UE-073 and TECHNE-TOOLS-OPS-015 plans await approval, and Kris accepts the stop/start after the 2026-10-10 kernel update.
- `ki repo audit` results:
  - ki-techne-harness: FAIL=0, WARN=2 (baseline).
  - tools-techne: FAIL=0, WARN=2, after fixing the over-long title on my record.
  - chezmoi: FAIL=0, WARN=2 (an unregistered territory handle and HOOK-1, both pre-existing).
- Nothing was pushed, and other sessions' uncommitted changes were left alone.

## Failed

- `ki repo audit` in `ki-arcadia-principal`: FAIL=1, WARN=3. The failure is STREAM-9 on `Streams/Projects/mac-studio-bootstrap.md`, another session's uncommitted change, which this run left alone. The warnings are pre-existing (STREAM-10 on `island-model-and-tending` among them).

## Needs the owner

1. Approve the TECHNE-TOOLS-OPS-022 plan (`draft` to `ready`), including the systemd reboot timer for the weekday window.
2. Approve the DOTFILES-UE-073 and TECHNE-TOOLS-OPS-015 plans (`draft` to `ready`).
3. Confirm what `target_host` is checked against. As decided it is `host.id`, but on AWS that is the instance ID, which changes at every rebuild, so a host manifest that sets it must be updated after each rebuild. The walkthrough's example uses the stable host name `ki-techne-agent-host`, which would match `host.hostname` rather than `host.id`. The plans follow the decision as written and flag this.
4. Stop and start the host after the 2026-10-10 kernel update (already accepted).
