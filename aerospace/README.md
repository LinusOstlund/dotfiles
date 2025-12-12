# AeroSpace Configuration

Tiling window manager for macOS with Hyperkey + Swedish keyboard optimization.

## Installation

```bash
# Install AeroSpace
brew install --cask nikitabobko/tap/aerospace

# Symlink config (from dotfiles repo root)
stow aerospace

# Reload config
aerospace reload-config
```

## Keybindings

### Navigation & Window Management

| Action | Binding |
|--------|---------|
| **Navigate windows** | Hyperkey + ← ↓ ↑ → |
| **Move windows** | cmd+alt+ctrl + ← ↓ ↑ → |
| **Resize (smart)** | Hyperkey + h (shrink) / l (grow) |
| **Resize (vertical)** | Hyperkey + k (taller) / i (shorter) |
| **Move workspace to monitor** | Hyperkey + § |
| **Toggle layout** | cmd+alt+ctrl + § |

### Workspaces

**15 workspaces available:** 1-9, Q, W, E, R, T, Y

| Action | Binding |
|--------|---------|
| **Switch workspace** | Hyperkey + 1-9, q, w, e, r, t, y |
| **Move to workspace** | cmd+alt+ctrl + 1-9, q, w, e, r, t, y |
| **Workspace back/forth** | Hyperkey + Tab |

### Service Mode

Enter with: **Hyperkey + Escape**

| Key | Action |
|-----|--------|
| `Esc` | Reload config & exit |
| `r` | Reset layout & exit |
| `t` | Toggle floating/tiling & exit |
| `Backspace` | Close all windows except current & exit |
| `← ↓ ↑ →` | Join window in direction & exit |

## Design Rationale

### Why Hyperkey?
- **Ergonomic:** Caps lock remapped = easier than Alt gymnastics
- **No conflicts:** Avoids Homerow (f, s, j) and Swedish keyboard special chars
- **Two-tier system:**
  - Hyperkey (cmd+shift+ctrl+alt) = frequent actions
  - cmd+alt+ctrl = infrequent/destructive actions

### Swedish Keyboard Benefits
- **§ key** mapped to layout toggle (left of 1)
- **No Alt conflicts** with special chars (@, $, [], {}, |, \)
- **Clean arrow navigation** instead of hjkl (j taken by Homerow)

## Configuration

Config location: `~/.aerospace.toml` (symlinked via Stow)

- **Gaps:** 5px inner/outer
- **Layout:** Tiles (auto-orientation)
- **Auto-start:** Enabled
- **Mouse follows focus:** Enabled

## Reverting to Default

```bash
git revert 09aec6f  # Revert to Alt-based default config
```

Default config commit: `46916b9`
