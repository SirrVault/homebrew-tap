# sirrlock/homebrew-tap — Claude Development Guide

## Purpose

Homebrew tap for Sirr. Provides two formulas: `sirrd` (server daemon) and `sirr` (CLI client).

```bash
brew tap sirrlock/tap
brew install sirrlock/tap/sirrd
brew install sirrlock/tap/sirr
```

## Structure

```
Formula/
├── sirrd.rb    # sirrd server daemon formula
└── sirr.rb     # sirr CLI client formula
```

## Updating on Release

When a new version of `sirr` / `sirrd` is released:

1. Update `url` to the new release tarball URL
2. Update `sha256` — run `sha256sum <tarball>` or `curl -sL <url> | shasum -a 256`
3. Update `version` string
4. Commit and push — Homebrew auto-picks up changes

## Key Rules

- `sirrd.rb` and `sirr.rb` are updated independently (different binaries, different hashes)
- Use the GitHub release tarball URL (`github.com/sirrlock/sirr/releases/download/...`)
- Always verify sha256 before committing — a wrong hash breaks installs for all users
- The release CI in `sirrlock/sirr` updates these formulas automatically via `SIRR_PACKAGE_MANAGERS_KEY`

## Pre-Commit Checklist

1. Are both sha256 hashes correct for the new version?
2. Do both formulas reference the same version number?

## Commit Attribution

**Never attribute commits to Claude, Anthropic, or any AI assistant.** This applies to every
commit in this repo, with no exceptions:

- Do **not** add `Co-Authored-By: Claude` (or any AI/assistant) trailers.
- Do **not** add "Generated with Claude Code", robot badges, or `claude.ai/code` session links.
- Do **not** set the commit author or committer to Claude/Anthropic — commits are authored by
  the human maintainer only.

Commit messages describe the change, nothing else. No AI attribution in any form.
