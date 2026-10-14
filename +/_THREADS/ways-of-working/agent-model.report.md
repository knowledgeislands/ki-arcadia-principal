# Agent model and effort — report

## Done

- `ki agent launch` and `ki agent queue` take `--model <model>` (passed through verbatim) and `--effort low|medium|high|xhigh|max`. Claude Code gets `--model`/`--effort`; Codex gets `-m`/`-c model_reasoning_effort=<level>`. Omitted, each runtime keeps its own default, exactly as before.
- Both carry through the queue (`queue.jsonl`), the dispatcher and the `--wait-for` hold process. The run packet gains `<name>.launch.json`, recording runtime, model and effort (a default is left out). `ki agent status` shows no per-agent launch details today, so it is unchanged.
- Help text, completion (effort values come from the option's choices), man page, command inventory, background-agents guide and CHANGELOG updated.
- Commit `4a4f970` `feat(agent): choose model and reasoning effort for launched agents`, pushed fast-forward to `origin/main` (`de4cec0..4a4f970`).
- Checks: `bun run test` 69 files / 1144 tests passed; `bunx tsc --noEmit` clean; `mandoc -T lint` clean; command inventory regenerated; pre-commit hooks (Biome, rumdl, commitlint) passed. New tests cover both adapters' argument forms, the queue → dispatch round-trip, the hold-process pass-through, the no-flag default, and rejection of an unknown effort or empty model.
- Dry check: `bun run build` then `dist/ki agent launch --help`, and `bin/ki agent launch --help`, both show `--model` and `--effort`. Nothing was launched.

## How a coordinating thread invokes it until the next release

The installed `ki` is 0.10.1 and lacks these options. Use the local checkout's entry script, which runs the source under Bun (re-launches for hold and dispatch go through the same script):

```sh
/Users/krisbrown/workspaces/knowledge-islands/tools-ki/bin/ki agent launch <run> <name> <workdir> <prompt-file> --runtime claude --model claude-fable-5-1 --effort high
/Users/krisbrown/workspaces/knowledge-islands/tools-ki/bin/ki agent queue <run> <name> <prompt-file> --workdir <dir> --runtime codex --model gpt-6-astra --effort xhigh
```

Use that same path for `dispatch`, `status`, `wait` and the rest in a run that uses the new options.

## Needs Kris

- Nothing.
