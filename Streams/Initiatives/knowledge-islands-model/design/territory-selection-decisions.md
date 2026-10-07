# Territory selection and Agora retirement: decisions

**Owner:** Kris Brown - **Report:** [[territory-selection-report]] - **Date:** 2026-10-07

These are the owner's own words, numbered against the report's decisions. Where they differ from the report, they win. The owner approved the clarified choices below with "all agreed".

## Decisions

<!-- rumdl-disable MD064 -->

1. Use `territory-selection` but we should also consider if anything in `territories-and-trades` should move over and if it does, then it could even become `trades-revamp`
2. What is the capital registry key today? I think we should use the same as the harness prefix if it has one.

   ```toml
   [skills.ki-repo-harness]
   prefix = "ki"
   ```

   the repo-harness prefix can then align to this

   and we can keep this if it helps with paperclip for now

   ```toml
   [skills.ki-agent-coordination-paperclip]
   organisation_code = "KIS"
   ```

3. Not sure I understand this one
4. Fine I think, can you give some examples of what is allowed and what isn't
5. Ok
6. Yes, cut over, no legacy support.  But why can't we support `-f` for them all?
7. Yes
8. push: allowed, prune: allowed, release: allowed

## Authority

**Grant:**

> I don't want a load of new roadmap items, really I just want this doing.  You don't even need to create the project tbh.  Lets go at this hard and fast

<!-- rumdl-enable MD064 -->

**Completion target:** Implement and verify the named territory-selection rollout. No post-delivery acceptance has yet been expressed against its evidence.

**Push scope:** The verified commits for this rollout in its owning repositories; no unrelated changes are authorised by this grant.

**Prune scope:** Eligible terminal records belonging to this rollout, after their terminal state is committed. No existing unrelated record is selected for deletion.

**Release scope:** The verified CLI changes for this rollout, through each tool's existing release procedure. This grants no package-registry publication or unrelated deployment.

## Clarifications and delivery boundary

The current Capital registry key is `ki-arcadia-principal`. The harness's declared prefix is `ki`; the chosen short territory identity should align with it. Paperclip's organisation code remains `KIS`.

The shared `-f, --filter` spelling is supported in both tools. Under the requested cut-over it matches repository directory-name prefixes, case-sensitively and literally, before worktree expansion. There is no separate legacy glob option or Agora alias.

A filter alone narrows the existing default selection. An explicit territory or estate supplies the base set; those primary scopes cannot be combined. Empty prefixes, no matches and unavailable selected repositories fail before execution. Repetition means OR.

No Project note is required for delivery. Keep the delivery records proportionate, with no speculative consumer backlog. Territory identity, membership and selection belong to this rollout; trade routing and the existing trade hold remain separately owned. The remaining trade-only scope is [[trades-revamp]], with current references reconciled.

## Owner approval

> all agreed

This approves the clarification: use `-t ki` for the Knowledge Islands territory, preserve `KIS` for Paperclip, match directory-name prefixes in both tools, retain local defaults, perform the hard cut-over, and run the serial pilot before publishing the verified rollout.
