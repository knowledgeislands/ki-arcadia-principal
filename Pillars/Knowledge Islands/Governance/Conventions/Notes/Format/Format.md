---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: current - April 2026
author: Written with Claude
memory_file: project_{ki_prefix}_note_format.md
---

# Format

## Overview

Every note follows a consistent physical structure. The rules here govern what sections a note contains, how those sections are organised, how content within them is formatted, and how notes reference each other and embed external material. Type-specific extensions are in [[Types]]; the properties and tags that live in frontmatter are in [[Frontmatter]].

---

## Full Note Structure

1. **Frontmatter** - YAML block with `tags`, `status`, `author` (and optionally `creator`)
2. **Title** - H1 heading matching the filename (see H1 and Filenames below)
3. **Overview** - `## Overview` section; high-level introduction
4. **Body** - H2 sections on the topic; one topic per section
5. **Footer** - `## Further Reading` and/or `## Related Topics`

Each section is separated by a `---` horizontal rule. Omit footer sections if genuinely empty.

---

## H1 and Filenames

The H1 heading should use the canonical title of the note. Filenames must avoid characters that are invalid on most filesystems - use `-` as a substitute for `:` and `-` where needed. This means the H1 and filename may differ in punctuation; this is expected and not an error.

---

## Footer Sections

Both `## Contents` and `## Related Topics` entries should include a short label after the wikilink, separated by `-`. Labels orient the reader in two to four words — they describe the relationship, not the note. Keep them succinct: `parent index`, `related methodology`, `external reference` are the right register. When reviewing, check that entries are still relevant and remove any that are stale or tangential.

### Prefer body content over Contents section

Rich body content is always preferred to a bare `## Contents` list. Where a child note can be introduced, contextualised, or grouped meaningfully in the body, do that - and omit the corresponding entry from `## Contents`. A `## Contents` list that exists only because there is no body prose to put links in is a signal that the index note needs more work, not that the list is correct.

- `## Contents` - **direct children only** (depth 1), and only those **not already linked in the body**. If a sub-page is contextualised and linked in the body prose, omit it from `Contents` - the body link is better contextualised. Deeper descendants (grandchildren and below) must never appear here; they belong in the body prose of the relevant child note. If this leaves no items, omit the `## Contents` section entirely. When present, `## Contents` is always the **last section before `## Related Topics`** - never interspersed with body content.
- `## Related Topics` - contextually relevant notes lateral to this one; label describes the relationship in a word or two. Must not reference sub-pages of this note at any depth - those belong in the body or `## Contents`. No duplicate entries permitted - each linked note must appear at most once.

### Link format in footer sections

All wikilinks in `## Contents` and `## Related Topics` must use the full absolute path with an alias matching the note's base name:

```markdown
[[Full/Path/To/Note|Note Name]]
```

This keeps links unambiguous as the KI grows and makes path and display name independently legible. Bare links (`[[Note Name]]`) and path-only links (`[[Full/Path/To/Note]]`) are not permitted in footer sections.

Example:

```markdown
## Related Topics

- [[Pillars/Topic/Subject/Subject|Subject]] - parent index
- [[Pillars/Topic/Approach/Approach|Approach]] - related methodology
- [[Resources/Topic/Organisation/Organisation|Organisation]] - external reference
```

### Parent index rule

The `## Related Topics` section must always include a link to the note's parent index (the index note of its immediate containing folder), and that link must always be the **first item** in the list. Label it `- parent index`.

Index notes themselves link to their _own_ parent index first (the grandparent folder's index) - except top-level folder indexes (e.g. `Pillars/Pillars.md`), which have no parent within the KI and may omit this.

Two errors to avoid:

- **Self-reference** - a note must never link to itself as parent index. For an index note at `A/B/C/C.md`, the parent is `A/B/B.md`, not `A/B/C/C.md`.
- **Grandparent link** - only one level up. Do not also link to the grandparent's index; the chain upward is traversed by following parent index links, not by duplicating them in every note.

---

## Tables

Target a total table width of 200 characters. Pad columns with spaces so that column borders align vertically, making them readable in a plain text editor. The separator row should match the width of the widest cell in each column.

If the content is too wide to fit within 200 characters, collapse all padding so each cell contains only its value with single spaces either side of the `|` - no alignment padding.

### Fits within 200 characters - pad to align

```
| Field     | Format / Values                     |
| --------- | ----------------------------------- |
| `status`  | `draft - Month YYYY`                |
```

### Too wide - collapse whitespace

```
| Field | Format / Values |
| --- | --- |
| `status` | `draft - Month YYYY`, `current - Month YYYY`, `archive - Month YYYY`, `outdated - Month YYYY` |
```

---

## Markdown Conventions

Consistent formatting ensures notes render correctly and remain readable in plain text.

### Sub-section headings

Use H3 (`###`) for sub-section headings within a body section - not bold text. Bold is for inline emphasis only, not structural headings.

### Lists

Always include a blank line between a paragraph or heading and a following list (ordered or unordered). Without it, some renderers will not parse the list correctly:

```markdown
Some introductory sentence.

- First item
- Second item
```

This applies after `##` headings too - footer sections in particular (`## Related Topics`, `## Contents`, `## Further Reading`) must have a blank line between the heading and the first list item.

### Trailing newlines

Every file must end with a single trailing newline - the last content line is followed by exactly one `\n`, with no blank line after it. Do not end files mid-line or with multiple trailing newlines (`\n\n` or more).

---

## Wikilinks and Images

Wikilinks (`[[Note Name]]`) are preferred over repeating content - link rather than duplicate. When a concept, decision, or piece of reference material has its own note, link to it rather than restating it.

### Body link format — shortest unique path (Obsidian algorithm)

Body links use the shortest unique path that resolves unambiguously. The algorithm is the same one Obsidian uses:

1. Use the bare filename if it is unique across the vault — `[[Concept]]`
2. If another note shares the same filename, use the minimum path prefix needed to disambiguate — `[[Structure/Structure]]` rather than `[[Conventions/Structure/Structure]]` if that is sufficient

Agents writing a new body link must check for filename collisions first. If another note shares the filename, use the shortest disambiguating prefix rather than the bare name.

Path-form links (`[[Full/Path/To/Note]]`) are accepted where they already exist but should not be introduced in new writing. Footer sections are an explicit exception — they always use the full absolute path with an alias (see the footer link format rules above).

The pipe alias (`[[Note|Display Text]]`) should be omitted in body links unless the display text genuinely differs from the filename. Where the bare name reads clearly, `[[Concept]]` is preferred over `[[Concept|Concept]]`.

Images and diagrams used by a single note must be saved in the same folder as that note. Images shared across multiple notes may sit in a folder common to all the notes that use them. Do not place note-specific assets in `+` - that folder is the inbox for unsorted captures, not an asset store.

Always include a width constraint of `800` when embedding an image, using Obsidian's pipe syntax:

```markdown
![[diagram.png|800]]
```

This keeps diagrams readable without overflowing the note pane. Do not embed images without a size constraint.

Bare URLs must be wrapped in angle brackets so they render as clickable links in all contexts:

```
<https://example.com>
```

Where a note references several external sources, use Markdown reference-style links - define the URL at the foot of the file and use a short label inline. This keeps the body text readable and groups all external references in one place.

---

## Related Topics

- [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Notes|Notes]] - parent index
- [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Frontmatter/Frontmatter|Frontmatter]] - YAML properties and tag taxonomy
- [[Pillars/Knowledge Islands/Governance/Conventions/Notes/Types/Types|Types]] - note type extensions
- [[Pillars/Knowledge Islands/Governance/Tools/Obsidian/Obsidian|Obsidian]] - Templater templates that scaffold notes to this format
