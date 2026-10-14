---
note_type: admin/governance/convention
tags:
  - topic/governance
status: current
author: Knowledge Islands
---

# Conformance

## Adopted standards

Knowledge Islands Principal follows the Knowledge Islands repository, authoring, engineering, Knowledge Base, Streams, activity, live-artifact, principal, decision-record, tokenomics, and Git standards declared in `.ki.toml`.

## Current review

The active declarations and their mechanical conformance are checked through `ki repo audit --repo .`, which CI runs over the whole tree on every push to `main` and every pull request. The pre-commit hook runs the Knowledge Base audit with `--staged`: it still evaluates the whole tree, but only a failure on a staged path, or on a directory containing one, refuses the commit, so a committer is not blocked by another thread's non-conforming note. Judgmental changes to canonical knowledge continue to require the Enactment Process.
