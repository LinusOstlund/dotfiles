# Dotfilsrepositorium

På skakiga Bambiben gör jag mitt första repo för dotfiler. 
Otroliga features finnes, bl.a:
* GNU Stow för _symlänka_ filer hit och dit.
* Claude Kod har skrivit det mesta, även om jag hittat det mesta i olika forum och andra dotfilsrepositorier. 

Jag har följande här inne:
* Ghostty med jättefina färger (klassisk _flavor-of-the-month_ grej, GPU-backad terminalgrej)
* confad tmux (även om Ghostty typ gör tmux överflödigt)
* starship prompt
* confad zsh med massa goa alias
* git grejer
* mer. 

## Setup Instructions

**TODO**: fixa detta fina förslaget: https://anhari.dev/blog/saving-vscode-settings-in-your-dotfiles

### Prerequisites
```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install GNU Stow
brew install stow
```

### Installation Order

1. **Install Homebrew packages first** (before stowing configs)
   ```bash
   cd ~/dotfiles
   brew bundle --file=brew/Brewfile
   ```

2. **Stow your dotfiles** (creates symlinks from repo to $HOME)
   ```bash
   # Stow individual packages
   stow zsh
   stow starship
   stow tmux
   stow git
   stow fzf

   # Or stow everything at once
   stow */
   ```

3. **Restart your terminal** to load the new configs

### What Gets Symlinked

- `zsh/.zshrc` → `~/.zshrc`
- `zsh/.config/zsh/*` → `~/.config/zsh/*` (modular configs)
- `starship/.config/starship.toml` → `~/.config/starship.toml`
- `fzf/.fzf.zsh` → `~/.fzf.zsh`
- `tmux/.tmux.conf` → `~/.tmux.conf` (if exists)
- `git/.gitconfig` → `~/.gitconfig` (if exists)

### Updating

When you make changes to files in this repo, they're automatically reflected (symlinks!). But if you modify the Brewfile:

```bash
cd ~/dotfiles
brew bundle --file=brew/Brewfile
```

### Troubleshooting

If stow complains about existing files:
```bash
# Backup existing configs
mv ~/.zshrc ~/.zshrc.backup
mv ~/.config/zsh ~/.config/zsh.backup

# Then try stow again
stow zsh
```
