# claude-swap account rotation: research report

Read-only research. I changed no configuration, accounts, credentials or repositories, made no commits and printed no secrets. I made no network calls either. The run rules forbid them, so I did not open the upstream repository or Anthropic's live docs (see **Failed**).

## Done

- **What is installed:** claude-swap v0.26.0 by Onur Cetinkol, MIT licence. It was installed as a `uv tool` from PyPI, not through Homebrew or npm. The commands `claude-swap` and `cswap` live in `~/.local/bin`. The upstream repository is public at <https://github.com/realiti4/claude-swap>. I read the bundled README and the source code instead of the repository.
- **Your current setup:** every setting is at its default: switch at 90%, check every 60 seconds, wait at least 5 minutes between switches, `best` strategy. The auto-switcher is not running at the moment, either as a process or as a launchd service.
- **What rotation it already supports:**
  - `cswap auto` watches each account's 5-hour and 7-day usage. When the active account reaches the threshold, it switches to the account with the most quota left. Because it switches early, the old login is still valid while Claude Code picks up the new one.
  - You can switch earlier with `--threshold 80`, down to a minimum of 50.
  - `--strategy consume-first` moves you before you reach the threshold. It keeps you on the account whose weekly window resets soonest, so weekly allowance that would expire unused gets spent first.
  - `cswap auto --once` runs a single check and is designed to be called from cron. `cswap menubar --install-service` keeps the menu-bar app and its auto-switch option running through launchd.
  - `cswap run` and `cswap map` let you run different accounts in different terminals or directories at the same time. This is the only built-in way to use several accounts at once.
- **What it does not support:** it has no feature that starts a usage window on every account in advance, and nothing that sends messages just to start a timer. Its only network traffic is reading usage from Anthropic's usage endpoint and refreshing login tokens.
- **Checking the premise:** this is from my knowledge, not checked live.
  - **Partly right:** the 5-hour session window starts with an account's first message and resets 5 hours later. An unused account's 5-hour clock is not running.
  - **The bigger limit works differently:** paid plans also have weekly (7-day) limits, and claude-swap shows a fixed weekly reset time for each account. Starting a 5-hour window early gives no extra weekly allowance; the weekly limit is usually what really caps heavy use.
  - **Where the time is actually lost:** idle 5-hour time on a waiting account is usually not wasted, because its allowance is still there when you start using it. You only lose something by leaving weekly allowance unused when the week resets, and `consume-first` already targets exactly that.
- **Terms concern:** this is from my knowledge of Anthropic's Consumer Terms and Usage Policy, not checked live. Please read it as a plain warning.
  - Holding several paid accounts of your own and switching between them by hand is, as far as I know, not explicitly prohibited.
  - **"Warming up" every account with scripted messages is the riskiest option.** The Consumer Terms forbid accessing the service through automated means such as bots or scripts, except where Anthropic allows it. Doing this mainly to multiply or get around usage limits is the kind of behaviour Anthropic named when it introduced weekly limits, alongside account sharing and reselling. It could put the accounts at risk of suspension.
  - `cswap auto` rotating near a limit is a grey area. It only reads usage and switches logins, but its whole purpose is still to stretch limits across several accounts.

## Options

1. **Keep things as they are and switch by hand when an account runs out.**
   - Pro: lowest risk and no setup.
   - Con: you lose time at each switch, and weekly allowance can expire unused.
2. **Run `cswap auto` at the default 90%, or lower it to 80%.**
   - Pro: switches happen smoothly and on time, with no new kind of traffic to Anthropic.
   - Con: it still uses one account at a time and is a grey area under the terms.
3. **Run `cswap auto --strategy consume-first`.** This is my recommendation if you rotate at all.
   - Pro: it spends weekly allowance before it expires, which is where the real loss happens.
   - Con: it switches more often, and it is the same terms grey area as option 2.
4. **Run different accounts in parallel sessions with `cswap run` or `cswap map`**, for example one account for each repository.
   - Pro: several accounts do real work at the same time without timer tricks.
   - Con: you have to manage it by hand. In terms of the rules it amounts to concurrent use across accounts.
5. **Script "warm-up" messages to start every account's window at once.** I advise against this.
   - Pro: in theory the 5-hour windows line up.
   - Con: it gains little because the weekly limit still binds. It also needs custom scripting and carries the clearest terms risk.
6. **Move to one higher plan, such as Max 20x, or add API-billed usage for overflow.**
   - Pro: fully within the terms, with no rotation needed.
   - Con: it costs money, and API usage is billed per token.

## Failed

- **Live checks not done:** I did not read the upstream repository, Anthropic's live help-centre articles on usage limits, or the current Consumer Terms, because the run rules allow no network access. The sections on the premise and the terms come from my knowledge as of mid-2026. Verify them before relying on them.

## Needs the owner

- **Choose an option.** If you want option 2 or 3, saying so authorises the setting change, for example `cswap config set autoswitch.strategy consume-first`, plus starting `cswap auto` or the menu-bar service. Both are configuration changes this run was not allowed to make.
- **Approve a web check if you want one:** a follow-up run with network access could verify the current Anthropic usage-limit docs and Consumer Terms. This matters most before trying anything close to option 5.
