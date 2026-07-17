# rb — notes for agents and non-interactive shells

`rb` switches Ruby versions. For automated/non-interactive use, the key
fact is **shims**: `$HOME/.rb/shims` is on `PATH` (via `eval "$(rb
init)"`), and each shim resolves the nearest `.ruby-version` at run time.

- Bare `ruby`/`bundle`/`rspec`/`rails`/etc. resolve the project's Ruby
  with **no `rb @` prefix** — in scripts, cron, and agent shells.
- Resolution is per-directory and lazy, so `cd proj && ruby -v` is
  correct even within a single command.
- New gem binary not found? Run `rb reshim` (auto-runs after
  gem/bundle installs).
- `rb which ruby` → the real resolved path. `rb resolve` → the version +
  source for the current dir.
- `rb @<version> -- <cmd>` / `rb exec` run a one-off command under a
  specific version without changing the shell.
