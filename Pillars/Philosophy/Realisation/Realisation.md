---
note_type: pillars/index
tags:
  - card/note
  - topic/knowledge-islands
status: current - October 2026
author: Written with Claude
---

# Realisation

## Overview

Realisation is the third act of [[Knowledge Islands]], following [[Introduction/Introduction|Introduction]] and [[Model/Model|Model]]. Introduction establishes why the model exists and Model sets out the portable definition any island can adopt; Realisation shows that model made concrete in a specific island, Arcadia, the canonical living instance from which every other island derives its baseline. It answers the question the first two acts leave open: what does an island that has actually adopted the model contain?

Realisation explains the model-level elements every island must realise - its Charter and Council, which are constitutionally required, and the Integrations and Configuration that connect its adopted activities to real services and schedules. It does not hold Arcadia's live governance records themselves. Those belong to the island-specific [[Admin]] zone, chiefly `Admin/Governance/`, where the actual Charter, Council membership, integration identifiers and configuration values are kept and read by automations at runtime. Realisation describes what each of those records is and how it fits the model; Admin is where this island's instances live and change through the Enactment Process.

Several notes here are still placeholders awaiting a concrete walkthrough, so a reader wanting Arcadia's current values should follow each section's pointer into Admin.

---

## Arcadia

[[Arcadia]] introduces Arcadia as a living island and its relationship to the public Knowledge Islands website. It sets out the publication principle: the website is an independently deployable publication that vendors selected material, never a third source of truth, and it records the publication flows between this knowledge base, the agentic harness, KI Specifications and the website. Its subfolder holds the Great Library of Arcadia, intended as the closing illustration of how the model's conventions play out in Arcadia's own Library.

---

## Charter

[[Realisation/Charter/Charter|Charter]] defines what a Charter is at model level: the identity document holding an island's fixed parameters, its activity adoption table, and the configuration entries linking adopted groups to their scheduled tasks and integrations. It is one of the two constitutionally required elements of realisation, alongside the Council. Arcadia's own Charter is a separate record in `Admin/Governance/`.

---

## Council

[[Council]] describes the governing body of an island, whose membership and terms the Charter declares and which decides who may propose and ratify change. It is the second constitutionally required element of realisation. The note is a placeholder that will show citizen and visitor standing, council eligibility, and what council formality means for a small or solo island.

---

## Integrations

[[Realisation/Integrations/Integrations|Integrations]] explains the role of an island's integrations record: the single declaration of connected services - MCP tools, calendar sources, task managers and inbox paths - that activities read at runtime instead of hardcoding identifiers. It is the bridge between the portable tool documentation in the Model and the specific services an island has connected. Arcadia's live integration values are held in `Admin/Governance/Conventions/`.

---

## Configuration

[[Configuration]] covers the island-specific values that vary between deployments: the task prefix used to name scheduled tasks, the Schedule note that defines working days and timings, and the configuration notes each adopted activity group requires. It exists so that the same activity definitions can run unchanged on different islands. The note is a placeholder that will show a complete configuration and how each piece connects to the activities that consume it.
