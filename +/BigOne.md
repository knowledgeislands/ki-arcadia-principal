# The Big One

There is a growing tension between Activities in terms of their definition and how these are done through Agents and Tools.

We have 3 conversations on this that we are aligning.

## Conversation 1

```markdown
Good framing — let me read the relevant materials first so the reasoning is grounded in what actually exists rather than abstractions.Let me read a couple more things to complete my picture before offering observations.Good. I've read the Activities index, the Health Check, Route Triage, Morning Briefing, and Scheduled Task Audit notes in full. Here's what I observe — the tensions I can see, precisely stated.

---

## What I'm Seeing

### 1. The dual-role problem in Activity notes

Every Activity note is simultaneously two things:

- **Documentation** — what the activity does, why it exists, when it runs, related topics
- **Executable implementation** — the `## Prompt` section, which is effectively a program

These have different lifecycles and different consumers. Documentation changes when you refactor the structure or clarify intent. Prompts change when you fix a bug, add a step, or adapt to a new tool. But they live in the same artefact, which is why the Scheduled Task Audit exists at all — it's a structural workaround for having the same executable content in two places (KB note and the scheduler).

The Scheduled Task Audit is a symptom, not a solution. The KB note is the canonical source, the scheduler holds a copy, and something has to reconcile them.

### 2. Scheduled vs. Conversational are different animals dressed identically

Both types use the same note format with a `## Prompt` section. But they have fundamentally different execution characteristics:

**Scheduled** — fully autonomous, no human in the loop, fires on cron, must handle all conditions internally, failure has no fallback. The prompt is more like a deployment artifact than a guide.

**Conversational** — human present, can course-correct, Claude can ask clarifying questions, abbreviated prompts are fine because the human fills the gaps.

The risk profiles differ enormously. A broken scheduled prompt runs silently and causes damage before anyone notices. A broken conversational prompt fails gracefully in front of a human. But the notes give no indication that one carries more operational weight than the other.

### 3. Tool dependencies are implicit

Looking at Route Triage and Morning Briefing in particular: they require M365 email tools, TickTick MCP, Calendar MCP, Linear MCP, bash access, file read/write. None of this is declared anywhere in the note. The prompt discovers tooling at runtime, reads an Integrations note, and branches accordingly.

This means you can't look at an Activity note and know whether it can run in the current session. The only way to know is to read the prompt text and mentally trace what it calls. As activities grow, that becomes untenable.

### 4. Prompts are agentic programs, not instructions

The Route Triage prompt builds and caches JSON5 data structures, evaluates predicate chains, handles cache hits and misses, applies inline aged-check bypass logic, updates multiple files. That's a program. The Health Check discovers files via bash, performs comparative analysis, proposes structured revisions. The Morning Briefing orchestrates five different integrations in sequence with conditional branches.

These aren't "tell Claude what to do" prompts. They're agent definitions embedded in prose. The gap between "this prompt tells Claude how to behave" and "this is an autonomous agent with tool access and decision logic" is closing — but the current model doesn't acknowledge that.

### 5. The definition hasn't kept pace with the execution model

When Activities were first defined, the mental model was presumably: "prompt goes in, Claude does a thing." The system has evolved well beyond that. Prompts now do path discovery, cache management, multi-tool orchestration, state file management. But the Activity definition — the concept — hasn't been updated to reflect that these are properly agents, with the implications that follow: declared dependencies, explicit failure modes, composability considerations.

---

## The Core Question

The tension is: **Activities are defined as documented automations with embedded prompts, but they've evolved into autonomous agents with implicit tool dependencies, and the structural model hasn't caught up.**

The question isn't really about the note format. It's about what an Activity actually _is_ — and whether the answer to that changes the structure:

- Is an Activity primarily **documentation** (what it does) with implementation as a subordinate concern?
- Or is an Activity primarily an **agent definition** (how it executes) with documentation as commentary?
- Or are these genuinely two distinct things that shouldn't live in the same note?

What's your read on which direction feels right? I'd rather reason from your intuition about that before suggesting any structural resolution.
```

## Conversation 2

So, here is the notes from the other threads:

```markdown
From the review of `Activities.md`, the outstanding observation was:

**Some activity groups (Email, Linear) are specific to a particular tool or integration, while others (Maintenance, Briefings) are generic island operations.** The question is whether tool-specific activities belong in the `Activities/` folder at all, or whether they should live closer to their integration — e.g. under `Integrations/` or `Knowledge Capital/` — with `Activities` simply referencing them.

You had thoughts on this that we hadn't got to yet. The specific things to resolve:

- Where is the right home for tool/integration-specific activity groups like Email and Linear?
- Does `Activities/` remain the single index for all activities regardless of where they live, or does it only cover generic island operations?
- Are there other tool-specific activity groups anticipated that would follow the same pattern?

That's the full scope of the open thread — nothing else outstanding in this area beyond that structural question and the two remaining `Activities.md` edits (Overview paragraph rewrite, and where "Scheduled Task Prompt Editing" moves to in Conventions), which can follow once the structure question is settled.
```

## Conversation 3

```markdown
## Open Question: Tools/Claude → Agentic AI split

The `Tools/Claude/` folder currently holds two distinct types of content:

### Tool-level

Genuinely about Claude as a configured piece of software:

- `Claude.md` — connection type, token economics, how it links to the island

### Operating-layer

About how the AI agent works — potentially applicable beyond Claude specifically:

- `Claude Behaviour.md` — behavioural constraints
- `Cowork Configuration Layers.md` — how the agent receives context and rules
- `Memory Architecture.md` — memory design across sessions
- `Island Skill.md` — the five operating modes (save, update, query, extract, digest)
- `AI Automation Patterns.md` — design patterns for scheduled automations
- `Live Artifacts/` — artifact recipes and design patterns
- `Mistakes and Lessons.md` — operational incident log

### The question

How much of the operating-layer group is genuinely _general_ AI operating pattern, and how much is deeply Claude/Cowork-specific in practice?

- `Memory Architecture` and `Cowork Configuration Layers` are likely inextricable from Cowork as a platform — they would need substantial rewriting to be truly tool-agnostic.
- `Island Skill` and `AI Automation Patterns` are closer to being general.

**Decision needed:** Is the goal to make `Agents/Agentic AI/` a genuinely tool-agnostic layer, or a conceptual grouping that happens to be Claude-implemented for now? The answer determines how much content moves wholesale vs. needs rewriting before it moves.
```

## Claude's Thoughts

````markdown
Now I can see how all three threads connect. Let me try to draw the synthesis, because I think they're all pointing at the same structural gap.

---

## The connecting insight

The three threads are actually one question in disguise:

> **The island has Activities, it has Tools, and it has integration configuration — but it has no clean home for "the agentic operating model" as a concept.**

That missing layer is what's creating the friction everywhere:

- Activities/ is overloaded because it's simultaneously the orchestration index _and_ the implicit home for "how agents work" (the prompts contain all the agent logic)
- Tools/Claude/ is confused because it mixes "Claude as a configured tool" with "how AI agency works in this island" — two very different concerns
- Email/Linear activities feel out of place in Activities/ because they're really integration workflows, but there's nowhere better for them to go that still keeps them reachable

The current structure has three layers: Activities, Tools, and Knowledge Capital. What's missing is an explicit **Agents layer** that sits between Activities (what happens) and Tools/Claude (how Claude is configured) and captures _how autonomous AI operation works_.

---

## How the three threads resolve once that's named

**Thread 2 first, because it unblocks the others:**

The `Tools/Claude/` split isn't really a question of "how general is this content." It's a question of which things are about _Claude as a configured tool_ versus _the AI operating model for this island_. Once you name Agents/ as the home for the latter, the split becomes obvious:

`Tools/Claude/` keeps the tool-level content:

- `Claude.md` — connection type, token economics, island linkage

`Agents/` gets the operating-layer content that describes _how_ the agent works:

- `AI Automation Patterns.md` — design patterns for scheduled automations
- `Island Skill.md` — the five operating modes
- `Claude Behaviour.md` — behavioural constraints (arguably)

The genuinely Cowork-specific content (`Memory Architecture`, `Cowork Configuration Layers`) either stays in Tools/Claude/ or gets an honest note in Agents/ saying "as currently implemented via Cowork, this works as follows" — preserving the distinction between the general model and the current implementation.

`Mistakes and Lessons.md` is operational incident log — stays in Tools/Claude/ because it's a record of Claude-specific failures, not general agent design.

**Thread 1 resolves from here:**

Once Agents/ is the home for _how_ activities are designed, Activities/ can return to being purely _what_ is scheduled and _when_. That immediately clarifies where Email and Linear belong:

Email and Linear activities are **integration workflows**, not island operations. Their workflow logic should live adjacent to their integration configuration — inside Knowledge Capital alongside their config notes — and Activities/ simply references them as entries in the table. Activities/ remains the complete schedule index (nothing disappears from the overview), but it no longer _owns_ the tool-specific notes.

This gives you:

- `Activities/` — complete index and schedule; owns generic island operations (Maintenance, Briefings)
- `Knowledge Capital/Email/` — owns email routing logic and Email-specific activity notes
- `Knowledge Capital/Linear/` — owns Linear sync logic and Linear-specific activity notes

Any future integration-specific workflow (Slack digest, calendar housekeeping, etc.) would follow the same pattern: workflow notes live near their integration, indexed from Activities/.

**Thread 3 (this conversation) resolves last:**

The "Activities are prompt blobs that have become agent programs" tension is actually a design documentation gap, not a structural problem. Once Agents/ exists with `AI Automation Patterns.md` as the canonical reference, Activity notes can be _much_ leaner — they document intent, trigger, schedule, and tool requirements, and reference the patterns note for the "how to build a good agent" question. The prompt section remains, but it's explicitly framed as the agent's implementation, not its definition.

---

## What this implies structurally

```
Governance/
  Activities/         — what happens and when (index + generic island ops)
  Agents/             — how AI agents work in this island (patterns, modes, model)
  Tools/
    Claude/           — Claude as a configured tool (connection, token economics)
    ...
```

Knowledge Capital stays where it is, but Email/ and Linear/ expand to own their workflows.

---

## The remaining open question

The one thing still to resolve before anything is acted on: **does `Agents/` already exist and have content, or is it being created?** The CLAUDE.md meta table references `[[Agents]]` at `Pillars/Knowledge Islands/Governance/Agents/Agents.md` — so the folder exists. What's in it right now will determine how much of this is reorganisation versus fresh writing.

Should I read that note before we go further?
````

## Kit's Thoughts

I feel that this is about how we split up the activity definition, how agents operate and then how these are realised though tools.

```
Governance/
  Activities/         — what happens and when (index + generic island ops), no
  Agents/             — how gents work in this island (patterns, modes, model)
    Human             - humans is understood but here for completeness
    Agentic AI/       — general agentic ai design patterns, principles, and general operating model
    Claude/           — Claude as an agent (†)
  Tools/
    Claude Cowork/    — how Cowork configures and manages Claude as an agent
    ...
```

(†) this could be under agents or tools, but I think it makes more sense under agents because it's about how Claude operates as an agent, not how to configure it as a tool. this then allows for it to be considered as a specific implementation of the general agentic AI patterns and principles, which is how it functions in practice.

We should definitely consider building the mental map of the knowledge for this area and then delineating it and then deciding where content should go based on that map. I think this is the most important area to get right in terms of structure and clarity, because it underpins how we design and document all of our automations and agentic operations. The existing notes DO NOT have to map 1:1 to the structure, but the structure should be designed to accommodate the content we have and the content we anticipate creating in this area.

## Next Steps

Step 0: read `+/BigOne.md` Step 1. read all of Governance and these conversations and thoughts above Step 2. discuss the open questions in each thread and decide on the structural changes to make and where content should go.

## Claude Response

````markdown
Good. Now let me read all of Governance before we discuss anything.Good — the Agents structure already exists. Let me read the key Governance notes in parallel.Now I have everything. Let me work through the open questions in each thread, give a clear position on each, and propose the combined picture.

---

## Thread 3 first: the Tools/Claude split

This is the foundation the others rest on.

**What I found:** `Agents/Agentic AI/` already exists but is explicitly a placeholder, waiting for this decision. `Agents/Human/` is fully written. The Agents/ layer is structurally ready — it just needs content.

**The test for splitting `Tools/Claude/` content:** does it describe _how Claude operates as an agent_, or _how Cowork configures Claude as a tool_? With that test applied:

**Moves to `Agents/Claude/` (new subfolder):**

- `Island Skill.md` — the five operating modes are the agent's behavioural repertoire, not tool configuration
- `Claude Behaviour.md` — behavioural rules define how the agent conducts itself; these are agent constraints, not setup instructions

**Moves to `Agents/Agentic AI/`:**

- `AI Automation Patterns.md` — already described as "generalisations derived from specific activities." This is the most general content in the entire Governance tree; it belongs in the general AI patterns layer. The JSON5 cache pattern, parallel fetch, live artifact baseline — none of these are Claude-specific.

**Stays in `Tools/Claude/`:**

- `Claude.md` — connection type, token economics, Cowork integration. Tool configuration.
- `Cowork Configuration Layers.md` — this is explicitly about how the Cowork platform delivers rules to Claude. Platform-specific.
- `Memory Architecture.md` — the concept is agent-level (how the agent persists state), but the content is entirely Cowork/KB-specific (file naming conventions, the KB↔memory mapping table). It references Knowledge Rebuild, KB Identity, the `.auto-memory/` directory structure. I'd keep it in Tools/Claude/ as the implementation note, with a brief conceptual pointer from `Agents/Claude/`.
- `Live Artifacts/` — Cowork-specific output mechanism. Tool layer.
- `Mistakes and Lessons.md` — operational incident log for this specific tool integration. Stays with the tool.

**On the `Claude Cowork` rename question:** I'd keep the folder name as `Tools/Claude/`. The distinction between agent layer and tool layer is already carried by the position under `Agents/` vs `Tools/`. Renaming adds a platform-specific qualifier that could date poorly if Cowork evolves. The new `Agents/Claude/` folder makes the split self-evident without any rename.

**New content required:**

- `Agents/Claude/Claude.md` — index for the Claude agent layer, describing how Claude operates as an agent in this island and pointing to Island Skill and Claude Behaviour
- `Agents/Agentic AI/Agentic AI.md` — needs to be fleshed out as actual content, not just a placeholder. Can happen concurrently with `AI Automation Patterns.md` arriving there.
- `Tools/Claude/Claude.md` — refocus as the tool integration note; remove the five-modes content (which moves to Agents/Claude/)

---

## Thread 2: Email/Linear activity placement

**What I found:** The Email folder in Activities/ contains two distinct types of content — `Approach.md` (which is the email _system design document_, not an activity definition) and the individual activity notes (Route Triage, Route Drift, etc.). Linear has just an index and one activity note.

**Position on the system design question:**

`Activities/Email/Approach.md` is misrouted. It's 220 lines documenting the architecture, predicate taxonomy, route structure, data file mapping — it's the email automation system design doc. The routing configuration it documents (`Email Routing Config.md`, `Route - *.md`, `Email Routing Queue.md`) already lives in `Knowledge Capital/Email/`. The Approach note belongs there too.

**Move:** `Activities/Email/Approach.md` → `Knowledge Capital/Email/Approach.md`

Everything else in `Activities/Email/` stays. Route Triage, Route Drift, etc. are genuine activity definitions — prompts, schedules, triggers. They're integration-specific but they're activities, and Activities/ is the right home.

`Activities/Linear/` stays entirely. It's thin and the asymmetry with Email only exists because Email grew a substantial system design doc that happens to live in the wrong folder.

**On the index question:** `Activities/` remains the master index for all activities including integration-specific groups. It already does this correctly. The only change is that the overview paragraph should make the distinction explicit: some activity groups are generic island operations; some are integration workflows. This isn't a structural change — it's a framing update to the Activities.md Overview section.

---

## Thread 1/2 combined: the two pending Activities.md edits

**Scheduled Task Prompt Editing section:** This is a working convention about how to iterate on activity prompts (edit the KB note first, don't push on every change, only push when ready). It's not an activity definition. It belongs in a new note: `Activities/Authoring Activities.md`. This note would cover:

- How to write an activity note (format expectations for scheduled vs conversational)
- The prompt editing discipline (current "Scheduled Task Prompt Editing" section, verbatim)
- Tool dependency declarations — which brings us to the activity format question from Thread 1

**Overview paragraph rewrite:** Straightforward once the structural position is settled — acknowledge island operations and integration workflows as distinct categories, both indexed here.

---

## Thread 1: the Activity definition tension

This doesn't require structural reorganisation — it requires a format update. My proposal:

Activity notes for **scheduled activities** should add a `## Dependencies` section after the Schedule section, listing required MCP connections and file-system access. This makes the implicit explicit: you can look at any scheduled activity note and know immediately whether it can run in the current session. Conversational activities don't need this because the human is present to handle missing tools.

The dual-role problem (documentation + executable) is real but not solvable by structure alone. The right response is to be explicit about it: the `## Prompt` section _is_ the executable definition. The note format should name this, not obscure it. `Authoring Activities.md` is the right place to document this honestly — the prompt is the agent's implementation, and it's the canonical version.

---

## Combined picture

```
Governance/
  Activities/
    Activities.md               ← overview rewrite; remove Scheduled Task Prompt Editing
    Authoring Activities.md     ← NEW: activity format, prompt editing discipline, dependency declarations
    Maintenance/                ← unchanged
    Briefings/                  ← unchanged
    Email/
      Email.md                  ← unchanged
      Approach.md               ← MOVES to Knowledge Capital/Email/
      Route Triage.md           ← unchanged
      Route Drift.md            ← unchanged
      Route Review.md           ← unchanged
      Re-route Triaged.md       ← unchanged
      Recap.md                  ← unchanged
      Email Test.md             ← unchanged
    Linear/                     ← unchanged

  Agents/
    Agents.md                   ← add Claude entry
    Human/                      ← unchanged
    Agentic AI/
      Agentic AI.md             ← flesh out (currently placeholder)
      AI Automation Patterns.md ← MOVES from Tools/Claude/
    Claude/                     ← NEW folder
      Claude.md                 ← NEW index
      Island Skill.md           ← MOVES from Tools/Claude/
      Claude Behaviour.md       ← MOVES from Tools/Claude/

  Tools/
    Tools.md                    ← update Claude entry to reflect split
    Claude/
      Claude.md                 ← refocused: tool integration, connection, token economics
      Memory Architecture.md    ← unchanged
      Cowork Configuration Layers.md ← unchanged
      Live Artifacts/           ← unchanged
      Mistakes and Lessons.md   ← unchanged
    Obsidian/                   ← unchanged
    Linear/                     ← unchanged
    Microsoft 365/              ← unchanged
    ChatGPT/                    ← unchanged
```

Knowledge Capital gains: `Email/Approach.md`

---

## Open questions requiring your input before I proceed

**1. `Memory Architecture.md`** — I've left it in Tools/Claude/ because it's Cowork-specific implementation. But the case for Agents/Claude/ isn't weak (it's about how the agent remembers). Which way do you want it?

**2. `Cowork Configuration Layers.md`** — Same question. It documents how the agent receives rules, which is an agent concern, but via a Cowork-specific mechanism. I've kept it in Tools/Claude/. Your instinct?

**3. The `Dependencies` section on Activity notes** — I'd like to add this to scheduled activities only. Worth doing as part of this work, or a separate pass?

**4. `Authoring Activities.md`** — Is this the right home for the prompt editing convention, or would you rather it live in Conventions/ proper?
````

## Final Thoughts?

agreed that its `Tools/Claude` not `Tools/Claude Cowork`

lets ensure a placeholder for `Agents/ChatGPT` as well, even if it's just a note saying "we only use ChatGPT as a tool, not an agent, so no agentic patterns here yet" — this makes the structure more consistent and future-proofs for any agentic use of ChatGPT, but it also signals the distinction between the generic agent layer and the specific agent implementations clearly.

Bringing `Knowledge Capital` into the debate is valueable as I can add some clarity here. The intetion for `Knowledge Capital` is for the island/territory specifics, so it is not an overlap, or if it is thats not by design.

Notes sit at the most generic level of the structure they can. So looking at the email example:

Activity specific, Agent and Island agnostic:

- `Knowledge Islands/Governance/Activities/Email`
- contains the activity description in agentic agnositic terms for email triage and how several activities form a system, but without the specific details of how it's implemented, agents or configuration. At this point, with the Knowledge Islands and Knowledge Capital split, there should be enough information that a human could do this themselves with the right tools and access, but it would be a manual process.
- This is the "what" and "why" of the activity, but not the "how" in terms of exact prompt structure, file names, etc.

Activity and Island specific, Agent agnostic:

- `Knowledge Capital/Governance/Activities/Email`
- contains specifics for this Island / Territory, such as routes and configuration.

Agentic AI Agent specific, Activity, Island and Claude agnostic:

- `Knowledge Islands/Governance/Agents/Agentic AI`
- contains the general patterns and principles for how to design and implement agentic activities on this island, but without specifics for email triage. This is the "how" in general terms, but not specific to any tool or integration.

Claude specific, Activity, Island agnostic:

- `Knowledge Islands/Governance/Agents/Claude`
- contains the claude specifics for the general patterns and principles outlined in `Agentic AI`, such as how to structure prompts for agentic activities, how to manage state, etc., but without specifics for email triage.

Claude, Activity specific, Island agnostic:

- `Knowledge Islands/Governance/Tools/Claude/Activities/Email`
- contains the specific implementation details for how to implement email triage activities using Claude, such as example prompts, file structures, etc., but without specifics for this island's configuration or routes.

Therefore to get the full view of an activity like email triage:

- as a human you would need to look at 2 notes:
  - `Knowledge Islands/Governance/Activities/Email`
  - `Knowledge Capital/Governance/Activities/Email`
- as claude you would need to look at 4 notes to determine the prompt and an additional note when the prompt runs to determine the configuration:
  - Prompt construction:
    - `Knowledge Islands/Governance/Activities/Email`
    - `Knowledge Islands/Governance/Agents/Agentic AI`
    - `Knowledge Islands/Governance/Agents/Claude`
    - `Knowledge Islands/Governance/Tools/Claude/Activities/Email`
  - Runtime:
    - `Knowledge Capital/Governance/Activities/Email`

On the other topics:

Re: 'Scheduled Task Prompt Editing section' - I agree that this is straightforward after the structural position is confirmed.

We can repose the question then in line with the structural position above:

```
Open questions requiring your input before I proceed
1. Memory Architecture.md — I've left it in Tools/Claude/ because it's Cowork-specific implementation. But the case for Agents/Claude/ isn't weak (it's about how the agent remembers). Which way do you want it?
2. Cowork Configuration Layers.md — Same question. It documents how the agent receives rules, which is an agent concern, but via a Cowork-specific mechanism. I've kept it in Tools/Claude/. Your instinct?
3. The Dependencies section on Activity notes — I'd like to add this to scheduled activities only. Worth doing as part of this work, or a separate pass?
4. Authoring Activities.md — Is this the right home for the prompt editing convention, or would you rather it live in Conventions/ proper?
```
