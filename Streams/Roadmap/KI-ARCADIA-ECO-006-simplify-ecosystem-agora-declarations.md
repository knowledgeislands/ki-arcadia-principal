---
note_type: stream-roadmap
id: KI-ARCADIA-ECO-006
area: ECO
title: Simplify ecosystem Agora declarations
theme: ecosystem-coordination
horizon: now
status: done
blocks: []
blocked_by: []
baseline_ref: 3e573e01cdc6b80293f96fd30922025fadc9682f
created_at: 2026-09-27T17:43:10Z
updated_at: 2026-10-06T10:08:06Z
---

# Simplify Ecosystem Agora Declarations

## Goal

Confirm that the estate retains one owner-managed ecosystem Agora named `kis`, with `ki-all`, `ki-fnd`, `ki-mcps` and `ki-tools` retired everywhere live, and close this record against the canonical amendment that has already landed.

## Context

The record was captured on 2026-09-27 to replace the four-group arrangement in [[GDR-KI-FUNDAMENTALS-001-knowledge-islands-ecosystem-fundamentals|GDR-KI-FUNDAMENTALS-001]] with a single `kis` Agora. Live declarations moved first; the canonical shared Decision Record was held for Enactment approval.

The owner then landed the canonical amendment directly in Arcadia commit `345fcdd` (2026-09-30, "refactor(agora): declare owner-managed membership"). The amended Agora paragraph states that Arcadia owns `kis` for governed Knowledge Islands ecosystem repositories, that its owner declaration lists direct members who need no Agora declaration or role, that dotfiles belongs to the Personal Agora and is neither a member nor an inclusion of `kis`, that the `paperclip` Agora is retired, and that membership and inclusion grant no ownership or authority. This supersedes the record's proposed model of independent member consent, per-member roles and a dotfiles `environment` role. What remains is verification and closure.

## Boundary

- Verification only: no edit to `GDR-KI-FUNDAMENTALS-001`, `Decisions.md`, any shared copy, or any `.ki.toml`.
- Retained Paperclip worktrees and agent worktrees (`.git/paperclip-worktrees/`, `.paperclip-repositories/`, `.delta/worktrees/`) are candidate or scratch state, reported but never mutated.
- The archived `ki-techne-principal` copy is historical evidence and is not reconciled.
- No remote operation under the [[Techne Programme Hold]].

## Current state

Observed at planning:

- `ki agora audit kis` in Arcadia: one profile, healthy, 0 findings.
- `Admin/Governance/Decisions/GDR-KI-FUNDAMENTALS-001-knowledge-islands-ecosystem-fundamentals.md` line 37 carries the owner-managed `kis` paragraph from `345fcdd`.
- Shared copies in `ki-agentic-harness`, `tools-ki`, `ki-website` and `ki-specifications` (`docs/decisions/`, each last touched 2026-10-01) and the archived `ki-techne-principal` copy are body-identical to Arcadia's, differing only in frontmatter.
- `Admin/Governance/Decisions/Decisions.md` describes the record without naming any retired group.
- None of the 42 `ki` registry checkouts' `.ki.toml` names a retired group. One retained Paperclip worktree does: `ki-techne-harness/.git/paperclip-worktrees/KNO-19/.ki.toml` (branch `paperclip/KNO-19-declare-ki-agent-coordination-paperclip` at `4b45c11`) declares `ki-all`, `ki-fnd` and `ki-tools` memberships.
- No canonical zone, root guidance file or `.ki.toml` in Arcadia names a retired group. The only other tracked hits are historical factorisation working material in `+/` (four `knowledge-islands-factorisation-*` captures and `knowledge-islands-fundamentals-amendment-plan.md`) and the CI temporary directory name `ki-fnd-001` in `.github/workflows/ci.yml`; neither is a declaration or user guidance.

## Steps

- [x] Re-run `ki agora audit kis` and record the result.
- [x] Diff the body of each shared copy against Arcadia's canonical copy and record the result per path.
- [x] Grep every `ki` registry checkout's `.ki.toml` for the retired names and record the result; list any hit in retained worktrees as an observation without mutating it.
- [x] Grep Arcadia's canonical zones, root guidance and `.ki.toml` for the retired names, confirm `Decisions.md` names none, and list remaining `+/` and CI hits as historical or incidental.
- [x] Record the supersession of the proposed model by `345fcdd` in Discussion, prepare the review packet and set the record to `awaiting-review`.

## Files touched

- This record only. `GDR-KI-FUNDAMENTALS-001`, `Decisions.md` and all shared copies are read for verification only.

## Verify

- `ki agora audit kis` reports `HEALTHY=1 UNHEALTHY=0 FINDINGS=0`.
- For each shared copy, `diff` of the body after the closing frontmatter fence against Arcadia's copy is empty.
- `for d in $(ki registry list); do grep -lwE 'ki-all|ki-fnd|ki-mcps|ki-tools' "$d/.ki.toml" 2>/dev/null; done` prints nothing.
- `git grep -lwE 'ki-all|ki-fnd|ki-mcps|ki-tools' -- Admin Pillars Resources README.md AGENTS.md CLAUDE.md .ki.toml` prints nothing.
- `git diff --name-only <baseline_ref>..HEAD` lists only this record.
- `ki repo audit --progress never` PASS.

## Dependencies / blocks

No dependency. The canonical change this record was waiting to enact has already landed, so nothing remains to block on. Closure through `ki-accept` needs the owner's acceptance of the verification packet.

## Documentation impact

### Decision Records

None further. `GDR-KI-FUNDAMENTALS-001` was amended in place by `345fcdd` and its shared copies already agree.

### Specifications

None. Agora behaviour is specified by the `ki agora` tooling and the `ki-agora` skill, which already reflect `kis`.

### Guides

None. Live README and `mgit` examples were updated before the amendment.

### Roadmap

Closes this record on acceptance. The stale `KNO-19` Paperclip candidate is reported for whoever disposes of that candidate; it creates no Arcadia item.

## Review

### Delivered

Verification and closure only, within the approved boundary: no edit to `GDR-KI-FUNDAMENTALS-001`, `Decisions.md`, any shared copy or any `.ki.toml`; retained Paperclip worktrees and the archived `ki-techne-principal` copy were observed, not mutated. Immutable baseline `3e573e01cdc6b80293f96fd30922025fadc9682f`. The evidence below confirms that `kis` is the only live ecosystem Agora and that the canonical amendment from `345fcdd` is consistent across every shared copy.

### Change Summary

- `Streams/Roadmap/KI-ARCADIA-ECO-006-simplify-ecosystem-agora-declarations.md` only: Steps ticked, this Review packet, and the supersession recorded in Discussion.
- Deviation: the `+/` historical hits have shrunk since planning to one capture, `+/knowledge-islands-factorisation-roadmap.md`.

### Verification

- `ki agora audit kis` (2026-10-06): `PROFILES=1 HEALTHY=1 UNHEALTHY=0 FINDINGS=0`.
- Body diff after the closing frontmatter fence against Arcadia's copy is empty for `ki-agentic-harness` (`e30948ad`), `tools-ki` (`d275a58`), `ki-website` (`5320886`) and `ki-specifications` (`02ddfca`), each at `docs/decisions/GDR-KI-FUNDAMENTALS-001-knowledge-islands-ecosystem-fundamentals.md`.
- `.ki.toml` grep across all 41 `ki registry list` checkouts: no hit. The retained Paperclip worktree `ki-techne-harness/.git/paperclip-worktrees/KNO-19/.ki.toml` still declares retired groups; observed only, not mutated.
- Canonical grep (`Admin Pillars Resources README.md AGENTS.md CLAUDE.md .ki.toml`): no Agora declaration. The only matches are the GitHub App name `ki-tools-release-bot` in `Admin/Governance/Conventions/Admin Conventions/GitHub Apps.md` and `Integrations.md`, which `grep -w` matches because hyphens are word boundaries; they are not Agora names. `Decisions.md` names no retired group.
- Remaining tracked hits are historical or incidental: `+/knowledge-islands-factorisation-roadmap.md` and the CI temporary directory `ki-fnd-001` in `.github/workflows/ci.yml`.
- `git diff --name-only 3e573e01cdc6b80293f96fd30922025fadc9682f..HEAD` lists only this record once committed.
- `ki repo audit --repo .` (ki 0.6.1): PASS.

### Outstanding concerns

- The planned canonical-grep Verify command is not literally empty because of the `ki-tools-release-bot` false positive described above; the substantive condition holds.
- The stale `KNO-19` Paperclip candidate is for whoever disposes of that candidate; it creates no Arcadia item.

### Post-change review

The Goal holds: one owner-managed `kis` Agora, the four retired groups absent from every live declaration, and the canonical amendment consistent everywhere it is copied. Scope stayed within this record and nothing was mutated outside it, so regression risk is nil. Ready for owner acceptance through `ki-accept`.

### Mini recap

Verified the landed `kis` amendment against the Agora audit, four shared copies, 41 registry declarations and Arcadia's canonical zones; all clean apart from a known retained Paperclip worktree and a GitHub App name false positive. Learning route proposed, not promoted: future retired-name checks should match whole Agora identifiers in declaration context rather than hyphen-delimited words.

## Done

Accepted 2026-10-06 by Kris Brown on the review packet above.

## Discussion

### Decisions under delegated autonomy

Decided by the Fable reviewer under delegated autonomy (2026-10-05), reversible: treat the owner's commit `345fcdd` as the delivered canonical amendment, superseding the record's proposed consent-and-roles paragraph and the dotfiles `environment` role, and reduce the remaining scope to verification and closure.

### Superseded proposal

The record proposed amending the shared Decision Record so that each non-owner member independently consents, product repositories keep role `product`, the Agentic Harness `governance-harness`, the Techne Harness `execution-harness`, `homebrew-tap` `distribution` and dotfiles `environment`, with membership in another Agora permitted. The landed amendment instead makes membership owner-managed with no member declaration or role, and places dotfiles outside `kis` in the Personal Agora.

### Earlier progress

Before the amendment, the home and member declarations were moved to `kis`, the three other homes and their consents were removed, live README and `mgit` examples were updated, and `ki agora audit personal` and `ki agora audit equalremedy` passed for the overlapping memberships then in place.

### Supersession recorded at delivery

At delivery on 2026-10-06 the supersession was confirmed: `345fcdd` is the canonical amendment, the proposed per-member consent and role model is not pursued, and dotfiles sits in the Personal Agora outside `kis`.

---

## Governance

This roadmap record adheres to the [[Admin/Operations/Processes/Enactment Process|Enactment Process]]. Move content to `Admin/`, `Pillars/`, or `Resources/` only on user approval of a `ready` record.
