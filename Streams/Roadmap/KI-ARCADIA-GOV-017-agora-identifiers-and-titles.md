---
note_type: stream-roadmap
id: KI-ARCADIA-GOV-017
area: GOV
title: Agora identifiers and titles
theme: governance
horizon: now
status: done
blocks: []
blocked_by: []
baseline_ref: 58a05d325423cf33834ea53da7a7f05bfe9f3dfc
created_at: 2026-10-05T23:47:54Z
updated_at: 2026-10-06T13:05:00Z
---

# Agora Identifiers and Titles

## Goal

Separate an Agora's stable identifier from its readable title, so callers use one consistent identifier for context and acquisition folders while showing the owner-declared title to people.

## Context

The owner requested this work on 6 October 2026 while aligning the ChatGPT capture surface in Kit Principal. That surface serves conversations through one repository, with small local context summaries for several Agoras. Its context folder names were readable titles while some acquisition folders used repository names or different slugs.

The agreed local convention is to use the existing Agora identifier for both `-/_CONTEXT/chatgpt/<agora-id>/` and `+/_ACQUIRE/chatgpt/<agora-id>/`, retaining readable headings such as Personal and Legal. Agora identifiers remain unchanged. The owner also requested a declared Agora title matching the context heading; that shared-contract work is captured here rather than implemented during the local folder correction.

Kris Brown adopted this record into Now and approved its delivery on 2026-10-06: "Agora titles - KI-ARCADIA-GOV-017 - yes please … process as much as possible."

## Boundary

- Define identifier and title as separate owner-declared meanings; keep purpose as the explanation of the group.
- Govern the portable Agora contract and the expectations for CLI validation, resolution and presentation.
- Hand the shared contract to its owners: the `ki-agora` standard, rubric and decision in the KI Agentic Harness ([KI-HARNESS-GOV-143](https://github.com/knowledgeislands/ki-agentic-harness/blob/main/docs/roadmap/KI-HARNESS-GOV-143-agora-titles.md)), and declaration parsing, resolution and presentation in tools-ki ([KI-TOOL-CLI-106](https://github.com/knowledgeislands/tools-ki/blob/main/docs/roadmap/KI-TOOL-CLI-106-agora-titles.md)). Each receiving repository owns its delivery and acceptance.
- Declare `title` on every existing Agora in the local registry, touching only each owner's `[skills.ki-agora.<id>]` table: `kis` (Arcadia), `personal` (Kit Principal), `legal` (Kit Legal), `hnr` (Kit HNR), `equalremedy` (Equal Remedy Research), `techmedix` (Kit TechMedix) and `vallearmonia` (Valle Armonia Principal).
- Preserve existing identifiers, memberships, inclusions, repository identities and authority boundaries. A title grants no access, exchange or capture permission.
- Do not rename Agoras, move captured material, activate cross-repository capture, cut a release or publish. No remote operation under the [[Techne Programme Hold]].

## Current state

Agora child-table names already provide stable, globally unique lower-case identifiers. The declaration currently accepts `purpose`, `members` and optional `includes`; a `title` key is rejected by both the harness `ki-agora` rubric (CONFIG-1) and the released `ki` v0.6.1 parser. CLI profiles expose an identifier and a `name` that merely repeats the identifier. Kit Principal's local context and capture folders have been aligned with existing Agora identifiers without changing this contract; its context headings are the titles the owner already uses.

Related work remains distinct: [[KI-ARCADIA-ECO-006-simplify-ecosystem-agora-declarations|ECO-006]] concerns the existing ecosystem membership declaration; [[KI-ARCADIA-GOV-016-territorial-classification-and-exchange|GOV-016]] owns territorial classification and exchange authority. This item adds readable Agora identity metadata and its consumer convention.

## Steps

- [x] Hand off the portable contract: KI-HARNESS-GOV-143 amends the `ki-agora` standard, structured rubric and GDR-KI-HARNESS-006 so `title` is a required, non-empty, single-line declaration key.
- [x] Hand off CLI support: KI-TOOL-CLI-106 parses the required `title`, exposes it as the profile title and presents it in `ki agora list` and `ki agora show`, leaving identifiers as every machine key.
- [x] Declare `title` in each owner's `.ki.toml`, using the Kit Principal ChatGPT context headings: `kis` Knowledge Islands, `personal` Personal, `legal` Legal, `hnr` Humans Not Robots, `equalremedy` Equal Remedy, `techmedix` TechMedix, `vallearmonia` Valle Armonia.
- [x] Note in the Kit Principal ChatGPT context README that its headings mirror the declared Agora title.
- [x] Record the review packet and set this record `awaiting-review`.

## Files touched

- This record.
- `.ki.toml` in this repository (`[skills.ki-agora.kis]` only).
- In other owners' primary checkouts, `[skills.ki-agora.<id>]` in `.ki.toml` only, plus `-/_CONTEXT/chatgpt/README.md` in Kit Principal.

## Verify

- Each owner repository: `ki repo audit --repo . --progress never --concise` reports FAIL=0 against a harness that includes KI-HARNESS-GOV-143.
- `ki agora list` and `ki agora audit` from a tools-ki build that includes KI-TOOL-CLI-106 report every declared Agora with its title and no broken declaration.
- `git diff` of each owner commit touches only the Agora table and, for Kit Principal, the context README.

## Dependencies / blocks

No local dependency. The two handoffs are non-blocking: this record is not blocked by either and neither lists it in `blocks` or `blocked_by`. Released `ki` v0.6.1 and the released harness reject `title`, so Arcadia's CI audit and local `ki agora` resolution with the released binary stay red until both receivers release.

## Documentation impact

### Decision Records

None in this repository. The portable contract decision is recorded by amending GDR-KI-HARNESS-006 in the harness, which owns `ki-agora`.

### Specifications

None here; tools-ki gains the AGORA specification clause through KI-TOOL-CLI-106.

### Guides

None here.

### Roadmap

This record and the two reciprocal receiver items.

## Review

### Delivered

The approved boundary: an Agora's identifier and readable title are separate owner-declared meanings, `title` is mandatory, and every Agora in the local registry declares one. Both handoffs were delivered and accepted by their receivers. Excluded: renaming Agoras, moving captured material, cross-repository capture, releases, publication and remote operations. Baseline `58a05d325423cf33834ea53da7a7f05bfe9f3dfc`.

### Change Summary

- KI Agentic Harness [KI-HARNESS-GOV-143](https://github.com/knowledgeislands/ki-agentic-harness/blob/main/docs/roadmap/KI-HARNESS-GOV-143-agora-titles.md), done at `580580ab`: the `ki-agora` standard, CONFIG-1 rubric and GDR-KI-HARNESS-006 require a non-empty single-line title and keep the identifier as the only machine key.
- tools-ki [KI-TOOL-CLI-106](https://github.com/knowledgeislands/tools-ki/blob/main/docs/roadmap/KI-TOOL-CLI-106-agora-titles.md), done at `6575e83`: `ki` parses the required title with the same rule, presents it in `ki agora list` and `ki agora show`, and documents it as AGORA-017.
- Owner declarations, each touching only its `[skills.ki-agora.<id>]` table: `kis` Knowledge Islands (Arcadia `247e0c3`), `personal` Personal (Kit Principal `45eafea`), `legal` Legal (Kit Legal `d4f0f2f6`), `hnr` Humans Not Robots (Kit HNR `dad8985`), `equalremedy` Equal Remedy (Equal Remedy Research `416eb6d`), `techmedix` TechMedix (Kit TechMedix `421594f`), `vallearmonia` Valle Armonia (Valle Armonia Principal `f8e7227`).
- Kit Principal's ChatGPT context README now says its headings mirror the declared title (`45eafea`, on top of the owner's earlier folder alignment `a34fec2`).
- Material decision: `title` is mandatory, as recorded under Discussion. No approved deviations.

### Verification

- With a tools-ki build including KI-TOOL-CLI-106 and a harness including KI-HARNESS-GOV-143: `ki agora list` shows all seven declared titles, `ki agora audit` reports HEALTHY=7 FINDINGS=0, and `ki repo audit --skill ki-agora` passes in each of the seven owner repositories.
- Each owner commit's diff is one added `title` line, plus the context README line in Kit Principal.
- With the released `ki` v0.6.1 and harness, Kit Principal's full audit reports only the expected CONFIG-1 `unrecognised key title` failure.
- Arcadia's full audit carries the pre-existing DEPS-1 Bun finding and, until release, the same expected CONFIG-1 failure.

### Outstanding concerns

None in this item. Until the owner releases tools-ki with a harness pin that includes KI-HARNESS-GOV-143, the installed `ki` rejects the titled declarations and CI audits that install the released harness fail CONFIG-1. The owner has accepted that window, and the coordinator holds one tools-ki release until this item, KI-TOOL-CLI-104 and KI-HARNESS-GOV-122 are all on `main`.

### Post-change review

Goal met: callers use the identifier for folders and selection and show the owner-declared title to people, with the rubric and parser enforcing one rule. Scope held to Agora tables and the context README. Regression risk is confined to the release window above. Fable reviewed both receiver deliveries; their findings were addressed, and one focused Fable re-review of both follow-up commits confirmed the fixes. Fable reviewed this record and found no blocking or should-fix issue; its wording nits are applied. Ready for acceptance.

### Mini recap

Agora titles are now a required, owner-declared part of the contract in the harness and CLI, and all seven Agoras declare the titles already used in Kit Principal's context headings. The open matter is the owner-held release. Learning route: none proposed.

## Done

Accepted 2026-10-06 by Kris Brown on review packet above.

## Discussion

### Identifier, title and purpose

The identifier is the stable machine key used in declarations, lookups, repository selection, roots and folder paths. The title is a non-empty readable label declared by the Agora owner and mirrored by context headings. A title change does not rename the identifier or move captured material. Purpose continues to describe why the working set exists. Repository identity and territorial authority remain separate from Agora identity.

### Decision: `title` is mandatory

Decided 2026-10-06 under the owner's delegated direction to process this record as far as possible, leaning on the owner's mandatory direction for the parallel `capital` key: `title` is required on every Agora declaration. The `ki-agora` audit fails when it is missing, blank or multi-line, and `ki` resolution fails closed in the same way, as it already does for `purpose`. There is no identifier fallback.

Rationale: every declaration is owned within this estate and migrates in the same change, so an optional phase would only defer the same work; a silent identifier fallback would hide drift between declarations and the headings that mirror them; and a single rule in both the rubric and the parser keeps them in agreement. Titles need not be unique, because the identifier remains the only key.

### Presentation and capture

`ki agora list` and `ki agora show` present the declared title beside the identifier; the reserved `estate` keeps its system title. Machine-readable outputs such as `ki agora roots` and `--agora` selection continue to use the identifier only. Derived context headings are refreshed by their owner when a title changes; capture preserves the identifier and the title observed at capture time.

### Release window

Because the released `ki` v0.6.1 rejects unknown Agora keys, declaring titles before the next `ki` release makes `ki agora` and `ki repo --agora` fail with the released binary, and the released harness rubric fails Arcadia's CI audit. Both clear when the owner releases tools-ki and the harness; no release is cut here.
