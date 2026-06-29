---
tags:
  - card/note
  - topic/knowledge-islands
  - topic/ai
  - topic/architecture
source: claude
status: current - June 2026
---

# Tool Ecosystem Map

How the Knowledge Islands tooling layer fits together: what each component is, what role it plays, and how they interrelate.

## Components

| Component               | Role                                                                                              | Repo                      |
| ----------------------- | ------------------------------------------------------------------------------------------------- | ------------------------- |
| arcadia-principal       | Knowledge base — the source of truth; all tooling serves or publishes from it                     | `arcadia-principal`       |
| arcadia-agentic-harness | Agentic harness — governance skills, agents, and MCP configuration for working on and with the KB | `arcadia-agentic-harness` |
| arcadia-website         | Publication layer — the public realisation of arcadia-principal (see [[Arcadia]])                 | `arcadia-website`         |
| mcp-git-audit           | Git fleet auditor — surfaces repo state across all workspace repositories                         | `mcp-git-audit`           |
| mcp-ki-kb-fs            | KB filesystem — read/write access to KB notes via MCP                                             | `mcp-ki-kb-fs`            |
| mcp-kb-notion-mirror    | Notion mirror — publishes KB notes into Notion with URL back-writes                               | `mcp-kb-notion-mirror`    |
| mcp-gmail               | Gmail — email read, triage, and draft creation via Google API                                     | `mcp-gmail`               |
| mcp-m365                | Microsoft 365 — Outlook, OneDrive, and Power Automate via Microsoft Graph                         | `mcp-m365`                |
| mcp-claude-housekeeping | Claude housekeeping — audits Claude app state accumulation on macOS                               | `mcp-claude-housekeeping` |

## Relationships

```text
arcadia-principal (KB — source of truth)
├── ← mcp-ki-kb-fs reads/writes notes
├── ← mcp-kb-notion-mirror publishes notes to Notion
└── → arcadia-website publishes KB outward (pipeline not yet automated — see [[Arcadia]])

arcadia-agentic-harness (governance tooling)
├── ships skills that govern how work is done on the KB
├── ships agents that orchestrate governance tasks
└── configures which MCPs are connected to the Claude workspace

MCPs (capability surface — external services)
├── mcp-git-audit     → inspects all repos in the workspace
├── mcp-gmail         → reads and drafts email via Google API
├── mcp-m365          → reads Outlook, calendar, OneDrive via Microsoft Graph
└── mcp-claude-housekeeping → audits Claude app state on macOS
```

## Layer model

The ecosystem has four layers, each with a distinct responsibility:

1. **Knowledge** (`arcadia-principal`) — what is known; the authoritative record
2. **Governance** (`arcadia-agentic-harness`) — how work is done; skills and conventions
3. **Capability** (MCP servers) — what can be acted on; external services and tools
4. **Publication** (`arcadia-website`) — what is made visible; the public realisation

The user works at the intersection of all four, via Claude Code, with the harness skills shaping how each layer is accessed.

## Per-tool notes

Each MCP has a tool note in [[How Tools Connect]]:

- [[Tools/Git Audit/Git Audit|Git Audit]]
- [[Tools/KB Filesystem/KB Filesystem|KB Filesystem]]
- [[Tools/Notion Mirror/Notion Mirror|Notion Mirror]]
- [[Tools/Gmail/Gmail|Gmail]]
- [[Tools/Microsoft 365/Microsoft 365|Microsoft 365]]
- [[Tools/Claude Housekeeping/Claude Housekeeping|Claude Housekeeping]]
