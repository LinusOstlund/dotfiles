# Tmux Configuration

## Prefix Key
Changed from `Ctrl+b` to `Ctrl+Space`

## Plugins

### tmux-resurrect
Saves and restores tmux sessions (survives reboots).

**Keybindings:**
- **Save session:** `Ctrl+Space` + `Ctrl+s`
- **Restore session:** `Ctrl+Space` + `Ctrl+r`

### Installing Plugins
After modifying `.tmux.conf`:
1. Reload config: `Ctrl+Space` + `r` (or run `tr` alias)
2. Install plugins: `Ctrl+Space` + `I` (capital I)

## Custom Keybindings

### Pane Management
- Split horizontal: `Ctrl+Space` + `|`
- Split vertical: `Ctrl+Space` + `-`

### Pane Resizing
- Resize left: `Ctrl+Space` + `h`
- Resize right: `Ctrl+Space` + `l`
- Resize down: `Ctrl+Space` + `j`
- Resize up: `Ctrl+Space` + `k`

### Config
- Reload config: `Ctrl+Space` + `r`

## FZF Popup Pickers

These popups work everywhere, including inside editors (nano, vim, micro).

### Tmux Navigation (`Ctrl+Space` → `t` → ...)
| Key | Action |
|-----|--------|
| `s` | Switch sessions |
| `w` | Switch windows (all sessions) |
| `p` | Switch panes (current session) |

### File Picker (`Ctrl+Space` → `f` → ...)
| Key | Action |
|-----|--------|
| `f` | Pick files → outputs `@filepath` at cursor |

### Git Objects (`Ctrl+Space` → `g` → ...)
| Key | Action |
|-----|--------|
| `f` | Pick changed files |
| `b` | Pick branches |
| `h` | Pick commit hashes |
| `s` | Pick stashes |

All pickers support multi-select with `Tab`. Results are pasted at cursor position.
