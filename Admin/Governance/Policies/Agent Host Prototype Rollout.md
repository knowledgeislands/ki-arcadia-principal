---
note_type: admin/governance/policy
updated: 2026-10-11T02:19:55Z
author: AI-assisted
---

# Agent Host Prototype Rollout

## Overview

This diagram shows the order in which the limited remote agent prototype comes into use, and how it stops. It explains the gates of the exemption in the [[Techne Programme Hold]], which [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] records and [KI-ARCADIA-GOV-020](https://github.com/knowledgeislands/ki-arcadia-principal/blob/fddfca69b4642cb4db4113123aa7dc613c3e92f4/Streams/Roadmap/KI-ARCADIA-GOV-020-limited-remote-agent-prototype.md) defined. It illustrates the policy; where they differ, the hold and the Decision Record govern.

![[Agent Host Prototype Rollout.svg]]

---

## Governance

Kris accepted the prototype's bounds on 7 October 2026, and the hold was then amended through [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]]. That amendment is the gate for every remote step: no remote action, including creating the host or testing a connection, precedes it.

## Access and build

Every step in this lane is Kris's alone. The operator role, `ki-techne-agent-host-operator`, is an account-local IAM role in the Techne account. The tailnet policy and a single-use, tagged auth key follow; Kris stores the key in Parameter Store from the clipboard without echoing it, then builds the host with the `ki-techne-harness` provisioning script under the `knowledge-islands-techne` profile. On boot the host joins the tailnet. No agent creates access or uses AWS credentials of its own.

## First use, then work

Kris connects from Zed through the helper, approves the Claude Code login on the Mac and stores a fine-grained GitHub token that expires after 90 days. Only then does agent work begin: editing, committing and auditing in a session Kris opens, with no push unless Kris asks. The GitHub token and Claude login are the binding owner's own identities, because only the binding owner opens sessions there.

## Stop, change or withdraw

The kill switch is available at any time: stop the host with the agent-host profile and remove its tailnet device. The exemption has no automatic lapse and no fixed review date: it stands until the island owner changes or withdraws it through an Enactment record, and is revisited when the hold is reshaped. The prototype review, [KI-ARCADIA-GOV-021](https://github.com/knowledgeislands/ki-arcadia-principal/blob/fac82de591fa6b7fc9bdf711c50dde9d55399a69/Streams/Roadmap/KI-ARCADIA-GOV-021-review-the-agent-host-prototype.md), kept it as it stands. Only if the island owner withdraws it does teardown remove the stack under the admin profile, then the tailnet entries, the tokens and the operator role. Rotating the GitHub token before it expires is part of operating the host.

## Source

The SVG is exported from the Archify source [[Agent Host Prototype Rollout.archify.json|beside it]]. To change the diagram, edit the source, run Archify's `finalize` for a `workflow` diagram at `showcase` quality, then export the SVG from the rendered viewer. The rendered HTML is a working file and is not kept.

Return to [[Policies]].
