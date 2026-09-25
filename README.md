# coreykarnei/homebrew-tap

Homebrew tap for [Atelier](https://github.com/coreykarnei/atelier) — a native
macOS workspace for agent-assisted coding: editor, shell, and Claude Code side
by side.

## Install

```sh
brew install --cask coreykarnei/tap/atelier
```

Releases are signed with a Developer ID and notarized by Apple, so the app
opens on first launch without a Gatekeeper prompt.

The cask installs `Atelier.app` into `/Applications` and links the bundled
workspace CLI onto your `PATH` as `atelier`.

## Requirements

- Apple Silicon, macOS 14 (Sonoma) or later
- [Claude Code](https://claude.com/claude-code), installed and authenticated —
  Atelier hosts it rather than replacing it

## Uninstall

```sh
brew uninstall --cask atelier          # remove the app
brew uninstall --zap --cask atelier    # also remove sessions and preferences
```
