# Scratch Pad

## Wikilink Review - Ambiguous Bare Links Skipped (2026-04-30)

The bulk fix pass disambiguated 42 of 49 ambiguous bare links. The 7 below need a human eyeball - context does not clearly resolve which target was intended. Each entry: file, line, the link, and the surrounding sentence.

### Linear (2 occurrences in Page Registry)

`Streams/Background/Page Registry/Page Registry.md:95`
```
└── Linear.md ←────────────── [[Linear]]  (unique)
```
`Streams/Background/Page Registry/Page Registry.md:110`
```
- `Linear` → array entry → `[[Linear]]`.
```

There are four `Linear.md` files (KC instance, Layer 5 Claude prompt, KI generic Tool, KI Model Activity). Page Registry is a worked example - the right target depends on which Linear note the example was meant to demonstrate.

### Activities - Human and Claude tool notes

`Pillars/Knowledge Islands/Model/Agents/Human/Human.md:28`
```
**Periodic maintenance** - Running the scheduled activities documented in [[Activities]]
```

`Pillars/Knowledge Islands/Model/Tools/Claude/Claude.md:116` (two on same line)
```
[[Activities]] is the Layer 5 prompt library ... What each activity does and why is documented at Layer 1 under [[Activities]].
```

There is no Layer 1 `Activities.md` index note - the Layer 1 entry point is `What Keeps an Island Alive`. So "Activities" here is ambiguous and may need rephrasing rather than relinking.

### Agents and Claude - in ChatGPT notes

`Pillars/Knowledge Islands/Model/Agents/ChatGPT/ChatGPT.md:15`
```
every AI system the island uses has a presence under [[Agents]]
```
`Pillars/Knowledge Islands/Model/Agents/ChatGPT/ChatGPT.md:17`
```
this note will expand into a full agent layer alongside [[Claude]]
```
`Pillars/Knowledge Islands/Model/Tools/ChatGPT/ChatGPT.md:31`
```
Unlike the [[Claude]] integration, ChatGPT does not have direct file access to the island.
```

Both `Claude` and `Agents` collide between Tools and Agents folders. Likely targets: Agents context → `Model/Agents/...`; Tools context → `Model/Tools/...`. But the structure intent (which "Agents" parent) needs confirmation.

