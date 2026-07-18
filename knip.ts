import type { KnipConfig } from 'knip'

// arcadia-principal is a Markdown knowledge base — no application source of its own.
// Its only hand-written TypeScript is this file, which also gives `tsc --noEmit`
// (ki:lint:types) a real input to check. scripts/ki/ holds vendored governance checkers
// (copied verbatim from the harness) — ignored here as generated code, never conformed.
// .obsidian/ is the Obsidian app's own data, not ours.
const config: KnipConfig = {
  ignore: ['.obsidian/**', 'scripts/ki/**', '.ki-meta/**', '.claude/skills/**'],
  ignoreExportsUsedInFile: true
}

export default config
