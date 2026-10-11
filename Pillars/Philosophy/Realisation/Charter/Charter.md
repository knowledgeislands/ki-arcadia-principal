---
note_type: pillars/index
updated: 2026-10-11T01:47:00Z
tags:
  - card/note
  - topic/knowledge-islands
  - topic/governance
status: current - October 2026
author: Written with Claude
---

# Charter

## Overview

The Charter is the identity document at the heart of every Knowledge Island's `Admin/Governance/` zone and one of the two constitutionally required elements of realisation, alongside the [[Council]]. [[SDR-KI-ARCADIA-003-the-governance-of-an-island|SDR-KI-ARCADIA-003]] makes it mandatory: it records the island's identity and its declared adoption position on every activity group, and no unknowns are permitted. It is the authoritative cold-start document - the first note an agent or a person reads to learn what an island is and what it currently runs. This note defines what a Charter holds at model level; Arcadia's own Charter is [[Admin/Governance/Charter|Admin/Governance/Charter]].

---

## Two Rates of Change

A Charter has two parts that change at different rates. The **identity** part is static: its parameters define the island and change only by constitutional amendment through the [[Processes/Enactment Process/Enactment Process|Enactment Process]]. The **operational** part changes whenever an activity group is adopted or vetoed, an automation is enabled, or an integration is connected. Keeping both in one note means the island's fixed character and its current state are always read together.

---

## Identity

The identity section holds the fixed parameters that distinguish one island from another: its name, the territory it belongs to and that territory's Capital, its canonical repository and folder, and the prefixes used to name its scheduled tasks and other identifiers. Automations and prompts read these values from the Charter rather than hardcoding them, so the same activity definitions run unchanged on any island. In Arcadia's Charter, for example, the task ID prefix is `arcadia-principal-`.

A principal island's Charter also declares its territorial standing. Arcadia's Charter states that it is the sole Capital of the Knowledge Islands territory, names [[Known Lands]] as the authoritative inventory, and records which repositories hold separate ownership.

---

## Activity Groups

The adoption table records an explicit position - `adopted` or `vetoed` - for every non-constitutional activity group, each pointing to its Activity Definition note. A vetoed group still has a definition note that acknowledges the veto, so a missing entry is always a gap rather than a silent choice. Constitutional activities do not appear in the table: they precede adoption and cannot be vetoed.

---

## Scheduled Activities

A second table lists the automations within adopted groups that are actually running, with their day type, time or invocation phrase, and status. An activity defined on the island but absent from this table is not running. The day types themselves are defined by the island's Schedule, described in [[Realisation/Configuration/Configuration|Configuration]].

---

## Tools and Agents

The operational part closes with the active integrations and the agent configuration in force. These entries summarise; the detail lives in the island's integrations record, described in [[Realisation/Integrations/Integrations|Integrations]]. The Charter states that a tool is connected, and the integrations record states how activities reach it.

---

## How the Charter Is Verified

The [[Model/Activities/Constitutional/Conformance|Conformance Check]] uses the Charter as its source of truth. It confirms that the Charter exists, that every non-constitutional group carries a declared position, and that each adopted group has the configuration it needs. A Charter that leaves any group unresolved makes the island non-conformant.
