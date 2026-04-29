---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/knowledge-management
status: draft - April 2026
author: Written with Claude
---

# Format

## Overview

Every note follows a consistent physical structure. The rules here govern what sections a note contains, how those sections are organised, how content within them is formatted, and how notes reference each other and embed external material. Type-specific extensions are in [[Notes]] (Types section); the properties and tags that live in frontmatter are in [[Notes]] (Frontmatter section).

---

## Full Note Structure

1. **Frontmatter** — YAML block with `tags`, `status`, `author` (and optionally `creator`)
2. **Title** — H1 heading matching the filename (see H1 and Filenames below)
3. **Overview** — `## Overview` section; high-level introduction
4. **Body** — H2 sections on the topic; one topic per section

Each section is separated by a `---` horizontal rule. Type-specific notes may extend this structure with additional footer sections.

**Single-section exception:** If a note has only one H2 section (its Overview), omit the `## Overview` heading — the content follows the H1 title directly. A heading that labels the only section adds no structure and no navigation value.

---

## H1 and Filenames

The H1 heading should use the canonical title of the note. Filenames must avoid characters that are invalid on most filesystems — use `-` as a substitute for `:` and `-` where needed. This means the H1 and filename may differ in punctuation; this is expected and not an error.

---

## Tables

Target a total table width of 200 characters. Pad columns with spaces so that column borders align vertically, making them readable in a plain text editor. The separator row should match the width of the widest cell in each column.

If the content is too wide to fit within 200 characters, collapse all padding so each cell contains only its value with single spaces either side of the `|` — no alignment padding.

### Fits within 200 characters — pad to align

```
| Field     | Format / Values                     |
| --------- | ----------------------------------- |
| `status`  | `draft - Month YYYY`                |
```

### Too wide — collapse whitespace

```
| Field | Format / Values |
| --- | --- |
| `status` | `draft - Month YYYY`, `current - Month YYYY`, `archive - Month YYYY`, `outdated - Month YYYY` |
```

---

## Markdown Conventions

Consistent formatting ensures notes render correctly and remain readable in plain text.

### Sub-section headings

Use H3 (`###`) for sub-section headings within a body section — not bold text. Bold is for inline emphasis only, not structural headings.

### Lists

Always include a blank line between a paragraph or heading and a following list (ordered or unordered). Without it, some renderers will not parse the list correctly:

```markdown
Some introductory sentence.

- First item
- Second item
```

This applies after `##` headings too — footer sections in particular (`## Related Topics`, `## Contents`, `## Further Reading`) must have a blank line between the heading and the first list item.

### Trailing newlines

Every file must end with a single trailing newline — the last content line is followed by exactly one `\n`, with no blank line after it. Do not end files mid-line or with multiple trailing newlines (`\n\n` or more).

---

## Wikilinks and Images

Wikilinks (`[[Note Name]]`) are preferred over repeating content — link rather than duplicate. When a concept, decision, or piece of reference material has its own note, link to it rather than restating it.

### Body link format — shortest unique path

Body links use the shortest unique path that resolves unambiguously. The algorithm:

1. Use the bare filename if it is unique across the island — `[[Concept]]`
2. If another note shares the same filename, use the minimum path prefix needed to disambiguate, and add a pipe alias showing just the leaf name — `[[Knowledge Islands/Processes/Processes|Processes]]`

Agents writing a new body link must check for filename collisions first. If another note shares the filename, use the shortest disambiguating prefix and alias to the leaf name.

The pipe alias should be omitted for unique bare-name links — `[[Concept]]` is preferred over `[[Concept|Concept]]`. It is required whenever a path prefix is needed, so that the rendered link shows only the leaf name.

Images and diagrams used by a single note must be saved in the same folder as that note. Images shared across multiple notes may sit in a folder common to all the notes that use them.

Always include a width constraint of `800` when embedding an image, using the pipe syntax:

```markdown
![[diagram.png|800]]
```

This keeps diagrams readable without overflowing the note pane. Do not embed images without a size constraint.

Bare URLs must be wrapped in angle brackets so they render as clickable links in all contexts:

```
<https://example.com>
```

Where a note references several external sources, use Markdown reference-style links — define the URL at the foot of the file and use a short label inline. This keeps the body text readable and groups all external references in one place.
