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
