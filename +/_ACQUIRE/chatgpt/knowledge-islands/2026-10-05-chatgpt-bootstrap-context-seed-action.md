# ChatGPT bootstrap context seed — setup action

## Decision / action

Create and maintain the repository's outbound ChatGPT context seed at:

`-/_context/ChatGPT/`

This is a concrete setup action, not a statement that the seed already exists or is complete.

## Purpose

The seed should become the preferred lightweight bootstrap surface for new ChatGPT sessions working with `krisb/kit-principal`. It should allow a session to regain useful continuity without preloading the principal repository.

## Intended behaviour

1. Identify or confirm the likely territory/topic from the current request.
2. Consult `-/_context/ChatGPT/` first for the smallest useful orientation.
3. Prefer current-state summaries, recent decisions/themes, open actions, and pointers to deeper durable knowledge.
4. Retrieve deeper repository material only when the task requires it.
5. Do not load unrelated territories or history speculatively.
6. Keep repository context subordinate to the user's current request.

## Follow-up implementation work

- Establish the initial structure beneath `-/_context/ChatGPT/`.
- Decide what minimal territory/topic indexes or summaries belong there.
- Define how the surface is refreshed as durable knowledge is reconciled into the principal.
- Keep it intentionally small and suitable for progressive disclosure.
- Ensure the canonical `ChatGPT Custom Instructions.md` and the live ChatGPT instructions remain aligned with the bootstrap protocol.

## Lifecycle

`bootstrap → selectively retrieve → work → acquire durable output`

## Status

Open action: the outbound context seed still needs to be created/implemented and then maintained as part of the Knowledge Islands workflow.
