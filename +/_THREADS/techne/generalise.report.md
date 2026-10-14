# generalise - report

## Done

- **Arcadia.** [KI-ARCADIA-GOV-031](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-GOV-031-general-agent-host-decisions.md) created and taken to `awaiting-review`. It amends [ODR-KI-ARCADIA-001](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Governance/Decisions/ODR-KI-ARCADIA-001-keeping-work-safe-on-the-agent-host.md) (P4, P7) and [ADR-KI-ARCADIA-003](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Admin/Governance/Decisions/ADR-KI-ARCADIA-003-the-agent-host-workstation-model.md) (P5, P6, P7). Both records now cover any owner and any target (cloud or owned, Linux or macOS). "The operator's workstation" replaces "the Mac", AWS details sit under the AWS provider, and the shell is a per-binding `shell` field with zsh as the default. The recipe renders the safety rules for Claude and Codex. Kris's tools appear only as examples. ODR-KI-ARCADIA-001 was clean by the time of the edit, because the other session had committed its changes, so I applied the amendment directly. No titles changed, so the Decisions index is unchanged. Commits `ee0059f` (reserve identifier) and `62233c6` (amendments). Another session has already pushed both.
- **ki-techne-harness** (started after the TECHNE-TOOLS-OPS-013 tweaks run reported DONE). Reshaped [TECHNE-TOOLS-OPS-014](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-014-agent-host-pins-and-expiries.md) (triage; adds the recipe's own host instructions for both runtimes and a Rig variant per target OS), [TECHNE-TOOLS-OPS-015](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-015-agent-host-workstation-pilot.md) (draft; the payload hook is the only route, the `chezmoi cat` path is removed, paths are checked against the target OS, and the binding shell defaults to zsh) and [TECHNE-TOOLS-OPS-017](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-017-zsh-shell-at-rebuild.md) (triage; retitled "Binding shell at rebuild"; the filename is unchanged). Captured [TECHNE-TOOLS-OPS-019](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-techne-harness/docs/roadmap/TECHNE-TOOLS-OPS-019-person-neutral-recipe-defaults.md) "Person-neutral recipe defaults" (P8) in triage. Every record keeps its status, and no code changed. Commits `00a34d6` and `3f21247`, pushed.
- **chezmoi.** [DOTFILES-UE-072](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-072-machine-neutral-two-checkout-rule.md) is narrowed to Kris's personal wording and retitled "Personal two-checkout wording"; a discussion point now asks whether it should be cancelled once the recipe's text exists. [DOTFILES-UE-073](/Users/krisbrown/.local/share/chezmoi/docs/roadmap/DOTFILES-UE-073-cheztoi-host-profile.md) is now OS-aware. Commit `ea0f5f6`, pushed.
- **Project and checkpoint.** `Streams/Projects/agent-host/agent-host.md` gains a "General design" bullet and uses neutral wording in its existing bullets, with no work-record identifiers. `+/_CHECKPOINTS/techne.md` reflects the current state. Commit `3eb0dae`.
- **Checks.** `ki repo audit --repo .`:
  - Arcadia: 0 failures, 2 warnings that were already there (HOOK-1 and one other).
  - ki-techne-harness: 0 failures, 2 warnings that were already there (CI-1, HOOK-1).
  - chezmoi: the roadmap checks pass. 18 BODY-11 failures remain in Decision Records I did not touch, so the audit as a whole still fails (see Failed).

## Failed

- **chezmoi audit.** `ki repo audit` in chezmoi still reports 18 BODY-11 failures ("links only to sibling records") in existing `docs/decisions` records such as ADR-DOTFILES-005 and ADR-DOTFILES-006. Those records were outside this task and I did not change them. I pushed anyway, because my two roadmap records pass every check.
- **Arcadia push.** Not pushed. Another session's commit `2761a0f` (adopting KI-ARCADIA-OPS-004) is ahead of origin, so my commit `3eb0dae` is local only.

## Needs Kris

- Review [KI-ARCADIA-GOV-031](/Users/krisbrown/workspaces/kit/knowledgeislands/ki-arcadia-principal/Streams/Roadmap/KI-ARCADIA-GOV-031-general-agent-host-decisions.md) (awaiting review).
- Push Arcadia once `2761a0f` is settled, which also pushes `3eb0dae`.
- ODR-KI-ARCADIA-001's Expiries bullet still lists "the review date", which Decision 6 removed. It was outside P4 to P7 and is left as-is; decide whether to fold it into GOV-031.
- P10 to P12 are still undecided. P13 (governance for an owned host or another person's host) is noted.
- The chezmoi Decision Records' BODY-11 failures need a separate fix.
