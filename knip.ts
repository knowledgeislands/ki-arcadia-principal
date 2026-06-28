import type { KnipConfig } from 'knip'

// arcadia-principal is a Markdown knowledge base — no application source. This file is
// the repo's only TypeScript, which also gives `tsc --noEmit` (ki:lint:types) a real
// input to check. .obsidian/ is the Obsidian app's own data, not ours.
const config: KnipConfig = {
  ignore: ['.obsidian/**'],
  ignoreExportsUsedInFile: true
}

export default config
