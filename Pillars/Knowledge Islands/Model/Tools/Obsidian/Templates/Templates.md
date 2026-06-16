---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
author: Written with Claude
---

# Templates

## Overview

Obsidian templates used with the Templater plugin to scaffold new notes consistently. Each template implements the structures defined in
[[Format]] and [[Types]] - providing a starting point with the correct frontmatter, heading structure, and section layout pre-filled.
Templates are a superset across all islands; not every template will be relevant to every island. Invoke via the Templater plugin command
palette or a keyboard shortcut configured in Obsidian.

---

## Calendar

Six templates covering the time-based note types that live under `Calendar/`. Each maps to a specific note type defined in [[Library]].

- [[Calendar - Daily]] - daily note; the hub for the day with wikilinks to meetings, sessions, and notes filed that day
- [[Calendar - Meeting]] - meeting note; attendees, themed discussion sections, key decisions, and action items
- [[Calendar - Session]] - AI-assisted session digest; context, decisions, facts learned, related projects, and keywords
- [[Calendar - Weekly]] - weekly note; daily note links and a week-level summary
- [[Calendar - Monthly]] - monthly index; weekly note links and a month-level summary
- [[Calendar - Yearly]] - year index; monthly and weekly note links for the full year

---

## Notes

Two templates for general knowledge notes in `Pillars/` and `Resources/`. `Note - General` is the standard format for any substantive note.
`Note - Folder` scaffolds an index note for a new folder, with the correct structure: a prose Overview section followed by one named H2
section per direct child, each introduced in two to four sentences.

- [[Note - General]] - standard note; frontmatter, overview, body sections, further reading, related topics
- [[Note - Folder]] - folder index note; prose overview and one named H2 section per direct child

---

## Pillars Cards

Collection card templates for internal knowledge entries - people and organisations as they relate to this island specifically. These use
the `card/*` tag and a lighter structure than a full note. See [[Collection Card]] for the format specification.

- [[Pillars - Collections - Organisation]] - internal organisation card; overview, relationship to the island, key contacts, related topics
- [[Pillars - Collections - Person]] - internal person card; role, relationship to the island, key notes, related topics

---

## Resources Cards

Collection card templates for external reference entries - items that exist independently of the island but are worth capturing and
contextualising within it. Cover books, concepts, films, locations, organisations, people, poems, venues, and videos. Each template provides
a structure suited to the specific type of external reference, with sections for synopsis, key ideas, or takeaways as appropriate.

- [[Resources - Collections - Book]] - book reference card; synopsis, key ideas, takeaways
- [[Resources - Collections - Concept]] - concept reference card; definition, detail, applications
- [[Resources - Collections - Film]] - film reference card; synopsis, key cast, related topics
- [[Resources - Collections - Location]] - location reference card; overview, history, landmarks
- [[Resources - Collections - Organisation]] - organisation reference card; overview, related topics
- [[Resources - Collections - Person]] - person reference card; brief bio, further reading, related topics
- [[Resources - Collections - Poem]] - poem reference card; overview, full text
- [[Resources - Collections - Venue]] - venue reference card; name, overview, key details (restaurant, bar, or shop)
- [[Resources - Collections - Video]] - video reference card; summary, concepts covered, personal notes
