# Claude Code Configuration

Configuration files for [Claude Code](https://claude.ai/code), managed via GNU Stow.

## Installation

```bash
cd ~/dotfiles
stow claude
```

This symlinks `.claude/` into `$HOME`.

## Features

### Status Line

Custom status line using [ccstatusline](https://github.com/sirmalloc/ccstatusline):

```json
"statusLine": {
  "type": "command",
  "command": "npx -y ccstatusline@latest",
  "padding": 0
}
```

The package is fetched on-demand via `npx` - no manual installation required.

### Plugins

- `ralph-wiggum@claude-code-plugins` - enabled by default

## Prerequisites

| Dependency | Required For | Install |
|------------|--------------|---------|
| Node.js | ccstatusline (via npx) | `brew install node` |

## File Structure

```text
claude/
└── .claude/
    ├── commands/       # Custom slash commands
    └── settings.json   # Main configuration
```
