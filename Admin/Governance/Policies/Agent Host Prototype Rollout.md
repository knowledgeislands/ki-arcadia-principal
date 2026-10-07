---
note_type: admin/governance/policy
updated: 2026-10-07T07:15:00Z
author: AI-assisted
---

# Agent Host Prototype Rollout

## Overview

This diagram shows the order in which the limited remote agent prototype comes into use, and how it stops. It explains the gates of the exemption in the [[Techne Programme Hold]], which [[GDR-KI-ARCADIA-004-standing-agent-host-exemption-from-the-techne-programme-hold|GDR-KI-ARCADIA-004]] records and [[KI-ARCADIA-GOV-020-limited-remote-agent-prototype|KI-ARCADIA-GOV-020]] defined. It illustrates the policy; where they differ, the hold and the Decision Record govern.

![[Agent Host Prototype Rollout.svg]]

---

## Governance

Kris accepted the prototype's bounds on 7 October 2026, and the hold was then amended through GDR-KI-ARCADIA-004. That amendment is the gate for every remote step: no remote action, including creating the host or testing a connection, precedes it.

## Access and build

Every step in this lane is Kris's alone. The operator role, `ki-techne-agent-host-operator`, is an account-local IAM role in the Techne account. The tailnet policy and a single-use, tagged auth key follow; Kris stores the key in Parameter Store from the clipboard without echoing it, then builds the host with the `ki-techne-harness` provisioning script under the `knowledge-islands-techne` profile. On boot the host joins the tailnet. No agent creates access or uses AWS credentials of its own.

## First use, then work

Kris connects from Zed through the helper, approves the Claude Code login on the Mac and stores a fine-grained GitHub token that expires after 30 days. Only then does agent work begin: editing, committing and auditing in a session Kris opens, with no push unless Kris asks. The identity that holds the GitHub and model credentials is decided before any agent works on the host.

## Stop and review

The kill switch is available at any time: stop the host with the agent-host profile and remove its tailnet device. The exemption has no automatic lapse: it stands until Kris changes or withdraws it. On 6 November 2026 [[KI-ARCADIA-GOV-021-review-the-agent-host-prototype|KI-ARCADIA-GOV-021]] reviews it, weighing its scope, bounds and cost and whether to widen or withdraw it. Only if Kris withdraws it does teardown remove the stack under the admin profile, then the tailnet entries, the tokens and the operator role. Rotating the GitHub token before it expires is part of operating the host.

## Source

The SVG is exported from the Archify source [[Agent Host Prototype Rollout.archify.json|beside it]]. To change the diagram, edit the source, run Archify's `finalize` for a `workflow` diagram at `showcase` quality, then export the SVG from the rendered viewer. The rendered HTML is a working file and is not kept.

Return to [[Policies]].
