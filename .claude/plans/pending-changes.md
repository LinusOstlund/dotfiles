# Pending Changes Review

Modified files since last commit. Comment with ✅ to commit, ❌ to discard, or notes.

---

## CLAUDE.md
**Changes:** Added Swedish keyboard note, Hyperkey mention, minor formatting
```
- Added: "I have a Swedish keyboard layout (ÅÄÖ, etc)"
- Added: "I use Hyperkey (caps lock -> cmd + shft + ctrl + alt)"
- Fixed: trailing newline
```
**Status:**
> **Feedback from reviewer:** Commit this, it's alrighty.

---

## README.md
**Changes:** Rewrote intro in Swedish, added feature list
```
- Expanded description of what's in the dotfiles
- Lists: Ghostty, tmux, starship, zsh aliases, git stuff
```
**Status:**
> **Feedback from reviewer:** Commit this, it's alrighty.
---

## aerospace/.aerospace.toml
**Changes:** Ghostty floating layout, layout mode tweaks
```
- Ghostty now opens floating (not just moved to workspace T)
- Window mode: 'f' now only floats (was toggle)
- Service mode: split 't' (tiles) and 'f' (float) into separate bindings
```
**Status:**
> **Feedback from reviewer:** Commit this, it's alrighty.
---

## aerospace/README.md
**Changes:** Major rewrite - mode-based documentation
```
- Documented all 4 modes (Monitor, Window, Assign, Service)
- Added JankyBorders install instructions
- New keybinding tables for each mode
- Removed old "reverting to default" section
```
**Status:**
> **Feedback from reviewer:** Hmmm, we might how to debloat the brewfile and update with dependencies. Is the jankyborders config here somewhere?

> **Claude:** No JankyBorders config file exists in dotfiles yet. It's not in your Brewfile either. The README mentions it as a dependency but you'd need to:
> 1. Add `brew "borders"` to `brew/Brewfile` (tap: FelixKratz/formulae)
> 2. Create config if needed (or it uses aerospace's built-in border settings)
> **Action:** Commit README now, add borders to Brewfile as separate task?

✅ Commit (README is accurate, Brewfile update is separate concern)

---

## claude/.claude/.gitignore
**Changes:** Track settings.json, ignore settings.local.json instead
```
- Was ignoring settings.json (hooks config)
- Now tracks settings.json, ignores settings.local.json
```
**Status:** I don't want to commit this yet, it's WIP.
---

## zsh/.config/zsh/aliases.zsh
**Changes:** Added dotfiles convenience aliases
```
+ alias dotfiles="code ~/dotfiles"
+ alias cdot="cd ~/dotfiles && claude"
```
**Status:**
Okay to commit
---

## zsh/.config/zsh/completion.zsh
**Changes:** Added custom completions path
```
+ fpath=(~/.config/zsh/completions $fpath)
```
**Status:**
Why did I do this? does it work?

> **Claude:** Yes, it works. You have `~/.config/zsh/completions/_databricks` (7.9k file). The fpath addition lets zsh find custom completion scripts. Without it, `_databricks` completions wouldn't load.

✅ Commit (enables your databricks completions)

---

## zsh/.config/zsh/fzf.zsh
**Changes:** Added fzf-git.sh sourcing, cf/cg functions
```
+ Source fzf-git.sh for Ctrl-G keybindings
+ cf() - Claude file selector (@filepath output)
+ cg() - Claude git selector (commit files as @filepath)
```
**Status:**
Yes I think this is legit
---

## zsh/.config/zsh/paths.zsh
**Changes:** Added VS Code path
```
+ export PATH="$HOME/Downloads/Visual Studio Code.app/..."
```
**Status:**
Not sure if useful

> **Claude:** This adds VS Code's `code` command to PATH. But it's pointing to Downloads folder which is unusual (normally VS Code lives in /Applications). If `code` command works without this, you can skip it.

❌ Skip (probably redundant, weird path location)

---

## zsh/.zshrc
**Changes:** Rust path fix, SDKMAN moved here with error suppression
```
+ Rust toolchain path (quick fix)
+ SDKMAN init moved here with no_nomatch option to suppress errors
```
**Status:**
Not really necessary

> **Claude:** The Rust path is a quick fix (should use rustup's env instead). SDKMAN move + error suppression is useful if you use Java/Kotlin. But if SDKMAN isn't critical to you, skip both.

❌ Skip (keep these as local workarounds, not in dotfiles)

---

## Untracked Files (not yet in git)
- `.claude/` - Claude Code local state # can be ignored
- `.devcontainer/` - Dev container config # can be ignored
- `claude/.claude/hooks/` - Claude hooks # dont add
- `claude/.claude/settings.json` - Claude settings with hooks # dont add
- `ghostty/` - Ghostty terminal config # want to add
- `zsh/.config/zsh/completions/` - Custom completions # add
- `zsh/.config/zsh/fzf-git.sh` - fzf-git integration script # add

**Status:**
> **Feedback from reviewer:** See comments

---

## Summary

### To Commit (modified files)
- [x] CLAUDE.md
- [x] README.md
- [x] aerospace/.aerospace.toml
- [x] aerospace/README.md
- [x] zsh/.config/zsh/aliases.zsh
- [x] zsh/.config/zsh/completion.zsh
- [x] zsh/.config/zsh/fzf.zsh

### To Skip/Discard
- [ ] claude/.claude/.gitignore (WIP)
- [ ] zsh/.config/zsh/paths.zsh (redundant VS Code path)
- [ ] zsh/.zshrc (local workarounds)

### Untracked to Add
- [x] ghostty/
- [x] zsh/.config/zsh/completions/
- [x] zsh/.config/zsh/fzf-git.sh

### Untracked to Ignore
- .claude/
- .devcontainer/
- claude/.claude/hooks/
- claude/.claude/settings.json

### Follow-up Tasks
- [ ] Add JankyBorders to Brewfile