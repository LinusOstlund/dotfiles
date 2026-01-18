# AeroSpace Configuration

Mode-based tiling window manager for macOS with Hyperkey + Swedish keyboard optimization.

## Installation

```bash
# Install AeroSpace
brew install --cask nikitabobko/tap/aerospace

# Install JankyBorders (window borders for visual feedback)
brew tap FelixKratz/formulae
brew install borders

# Symlink config (from dotfiles repo root)
stow aerospace

# Reload config
aerospace reload-config
```

## Mode-Based Workflow

This config uses **four binding modes** for organized window management:

1. **Monitor Mode** (Hyperkey + m) - Multi-monitor operations
2. **Window Mode** (Hyperkey + w) - Resize, join, float/tile
3. **Assign Mode** (Hyperkey + a) - Move window to workspace
4. **Service Mode** (Hyperkey + Esc) - Config, layout reset

All modes exit with `Esc`, `Enter`, or `Space`.

---

## Main Mode (Default)

### Navigation & Movement

| Action | Binding |
|--------|---------|
| **Navigate windows** | Hyperkey + ← ↓ ↑ → |
| **Move windows (directional)** | cmd+alt+ctrl + ← ↓ ↑ → |
| **Workspace back/forth** | Hyperkey + Tab |

### Workspaces

**Available:** 1-9, Q, E, R, T, Y, G, B, V, N, C

| Action | Binding |
|--------|---------|
| **Switch workspace** | Hyperkey + 1-9, q, e, r, t, y, g, b, v, n, c |
| **Move window to workspace** | Hyperkey + a (enter Assign Mode) |

### App Workspace Auto-Assignments

| Workspace | App | Binding |
|-----------|-----|---------|
| **2** | Spotify | Hyperkey + 2 |
| **G** | ChatGPT | Hyperkey + g |
| **B** | Chrome (Browser) | Hyperkey + b |
| **C** | Slack (Communication) | Hyperkey + c |
| **V** | VS Code | Hyperkey + v |
| **N** | Apple Notes | Hyperkey + n |
| **T** | Ghostty (Terminal) | Hyperkey + t |

Apps automatically open on their designated workspace (but can be moved manually).

---

## Monitor Mode (Hyperkey + m)

Multi-monitor workspace and window management.

| Key | Action |
|-----|--------|
| `←` / `→` | Focus left/right monitor |
| `Shift + ←` / `→` | Move workspace to prev/next monitor & exit |
| `m` | Move current window to next monitor & exit |
| `Esc` / `Enter` / `Space` | Exit to main mode |

---

## Assign Mode (Hyperkey + a)

Move current window to a workspace (replaces awkward cmd+alt+ctrl combo).

| Key | Action |
|-----|--------|
| `1-9` | Move window to workspace 1-9 & exit |
| `q` / `e` / `r` / `t` / `y` | Move window to workspace Q/E/R/T/Y & exit |
| `g` / `b` / `v` / `n` / `c` | Move window to workspace G/B/V/N/C & exit |
| `Esc` / `Enter` / `Space` | Exit to main mode |

---

## Window Mode (Hyperkey + w)

Window resizing, joining, and layout management.

| Key | Action |
|-----|--------|
| `h` / `l` | Resize smart -/+ 50px |
| `k` / `i` | Resize height +/- 50px |
| `← ↓ ↑ →` | Join with window in direction & exit |
| `f` | Toggle float/tile & exit |
| `a` | Switch to accordion layout & exit |
| `t` | Switch to tiles layout & exit |
| `-` | Switch to horizontal layout (side-by-side) & exit |
| `7` | Switch to vertical layout (stacked) & exit |
| `b` | Balance all window sizes & exit |
| `Esc` / `Enter` / `Space` | Exit to main mode |

---

## Service Mode (Hyperkey + Esc)

Config reload, layout reset, and emergency operations.

| Key | Action |
|-----|--------|
| `Esc` | Reload config & exit |
| `r` | Flatten workspace tree (reset layout) & exit |
| `t` | Toggle floating/tiling & exit |
| `Backspace` | Close all windows except current & exit |

---

## Design Rationale

### Why Mode-Based?
- **Ergonomic:** No awkward three-finger combos (cmd+alt+ctrl)
- **Organized:** Related operations grouped together (monitor ops, window ops, assignments)
- **Clean bindings:** Simple single-key commands inside modes
- **No conflicts:** Modes free up main mode for navigation/workspaces
- **Escape-friendly:** All modes exit the same way (Esc/Enter/Space)

### Why Hyperkey?
- **Ergonomic:** Caps lock remapped via BetterTouchTool/Karabiner
- **No conflicts:** Avoids Homerow (f, s, j) and Swedish keyboard special chars
- **Single modifier:** One modifier (Hyperkey) for all window management
- **Mode triggers:** Easy access to specialized modes (m, w, a, Esc)

### Swedish Keyboard Benefits
- **Arrow-based navigation** instead of hjkl (j taken by Homerow)
- **No Alt conflicts** with special chars (@, $, [], {}, |, \)
- **§ key available** for other tools/configs (not used by AeroSpace)

## Configuration

Config location: `~/.aerospace.toml` (symlinked via Stow)

- **Workspaces:** 1-9, Q, E, R, T, Y, G, B, V, N, C (19 total)
- **Gaps:** 5px inner/outer
- **Layout:** Tiles (auto-orientation)
- **Auto-start:** Enabled
- **Mouse follows focus:** Enabled (monitor changes only)
- **Window borders:** JankyBorders (lavender focus, dark gray inactive, 6px width)
- **Monitor assignments:** Manual (use Monitor Mode to arrange workspaces across monitors)
