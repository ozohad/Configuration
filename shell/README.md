# Shell Configuration

Zsh and Bash configurations with modern CLI tools, plugins, and productivity enhancements.

## Features

- **Powerlevel10k** - Fast, customizable prompt
- **Auto-suggestions** - Command suggestions as you type
- **Syntax Highlighting** - Real-time syntax highlighting
- **FZF Integration** - Fuzzy finding everywhere
- **Modern CLI Tools** - bat, eza, zoxide replacements
- **Smart History** - Shared, deduplicated history
- **Custom Keybindings** - Optimized for productivity

## Installation

```bash
# Zsh
cp .zshrc ~/.zshrc
source ~/.zshrc

# Bash
cp .bashrc ~/.bashrc
source ~/.bashrc
```

## Dependencies

### Required
- Zsh or Bash
- Homebrew (macOS/Linux)

### Zsh Plugins
```bash
brew install powerlevel10k
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
```

### CLI Tools
```bash
brew install fzf bat eza zoxide mise pyenv
```

### Optional
```bash
brew install pnpm node
```

## Features Breakdown

### Powerlevel10k Prompt
- Fast startup
- Git status
- Command execution time
- Exit code indicators
- Customizable segments

Configure:
```bash
p10k configure
```

### Auto-suggestions
- Suggests commands from history
- Accept with `→` key
- Partial accept with `CTRL` + `→`

### Syntax Highlighting
- Real-time command validation
- Color-coded syntax
- Error highlighting

### FZF (Fuzzy Finder)
- `CTRL` + `T` - Find files
- `CTRL` + `R` - Search history
- `ALT` + `C` - Change directory
- Custom preview with bat

### Bat (Better Cat)
- Syntax highlighting
- Git integration
- Line numbers
- Paging

Theme: Visual Studio Dark+

### Eza (Better Ls)
- Icons
- Git status
- Tree view
- Color coding

Aliases:
- `ls` - List with icons
- `ll` - Detailed list
- `lt` - Tree view (level 2)
- `ltree` - Tree with icons

### Zoxide (Smart Cd)
- Learns frequent directories
- Jump to directories by partial name
- Faster than cd

Usage:
```bash
z project  # Jump to project directory
z doc      # Jump to documents
```

### Mise (Runtime Manager)
- Manages tool versions
- Replaces asdf, nvm, rbenv
- Per-project versions

## Keybindings

### Line Navigation
- `CTRL` + `A` - Beginning of line
- `CTRL` + `E` - End of line
- `Option` + `A/E` - Alternative

### Word Navigation
- `CTRL` + `←/→` - Word backward/forward
- `Option` + `←/→` - Alternative
- `Option` + `B/F` - Vim-style

### Text Deletion
- `CTRL` + `W` - Delete word backward
- `CTRL` + `D` - Delete word forward
- `CTRL` + `Shift` + `W` - Delete to line start
- `CTRL` + `Shift` + `D` - Delete to line end
- `CTRL` + `U` - Delete entire line

### History
- `↑/↓` - Navigate history
- `CTRL` + `R` - Search history (FZF)
- `CTRL` + `P/N` - Previous/next command

### Undo/Redo
- `CTRL` + `Backspace` - Undo
- `CTRL` + `Shift` + `Backspace` - Redo

## Custom Functions

### Navigation
```bash
cx <dir>    # cd and list
fcd         # Fuzzy cd
f           # Find file (copy path)
fv          # Find and open in nvim
```

### AI Assistant (if configured)
```bash
qp          # Launch agent picker
qq <text>   # Quick text review
```

## Configuration

### Zsh
Main config: `~/.zshrc`

Key sections:
- Powerlevel10k initialization
- Plugin loading
- History settings
- Keybindings
- Aliases
- Custom functions
- Tool initialization (pyenv, fzf, zoxide, mise)

### Bash
Main config: `~/.bashrc`

Similar structure to zsh but with bash-specific syntax.

### History Settings
```bash
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history           # Share between sessions
setopt hist_expire_dups_first  # Expire duplicates first
setopt hist_ignore_dups        # Ignore consecutive duplicates
setopt hist_verify             # Show before executing from history
```

## Customization

### Change Prompt
```bash
p10k configure
```

### Add Aliases
Edit `~/.zshrc` or `~/.bashrc`:
```bash
alias myalias='command'
```

### Add Functions
```bash
myfunction() {
  # Your code here
}
```

### Change FZF Options
```bash
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse"
```

### Change Bat Theme
```bash
export BAT_THEME="theme-name"
bat --list-themes  # See available themes
```

## Troubleshooting

### Slow Startup
1. Check plugin load times:
   ```bash
   zsh -xv 2>&1 | ts -i '%.s' > /tmp/zsh-startup.log
   ```
2. Disable unused plugins
3. Use lazy loading

### Completions Not Working
```bash
rm -f ~/.zcompdump
compinit
```

### FZF Not Working
```bash
# Reinstall
brew reinstall fzf
$(brew --prefix)/opt/fzf/install
```

### Powerlevel10k Issues
```bash
# Reconfigure
p10k configure

# Check font
echo "\ue0b0 \ue0b2"  # Should show triangles
```

### Zoxide Not Learning
```bash
# Check database
zoxide query --list

# Remove and rebuild
rm ~/.local/share/zoxide/db.zo
```

## Performance Tips

1. **Lazy Load Plugins** - Load only when needed
2. **Minimize Startup Commands** - Move to functions
3. **Use Async** - Load non-critical items asynchronously
4. **Cache Completions** - Don't rebuild every time

## Integration with Other Tools

### Git
- Powerlevel10k shows git status
- FZF for git log/diff browsing
- Aliases for common operations

### Docker
- Completions auto-loaded
- Aliases for common commands

### Python
- pyenv for version management
- Virtual environment indicators in prompt

### Node.js
- mise for version management
- pnpm for package management

## Updates

### Update Plugins
```bash
brew upgrade powerlevel10k zsh-autosuggestions zsh-syntax-highlighting
```

### Update CLI Tools
```bash
brew upgrade fzf bat eza zoxide mise
```

### Update Shell
```bash
# Zsh
brew upgrade zsh

# Bash
brew upgrade bash
```

## Tips

1. **Use FZF** - `CTRL` + `R` for history is game-changing
2. **Learn Zoxide** - Faster than cd after a few days
3. **Customize Prompt** - Make it yours with p10k configure
4. **Use Aliases** - Create shortcuts for frequent commands
5. **Explore Bat** - Better than cat for viewing files
6. **Try Eza** - Better ls with icons and git status

## Additional Resources

- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
- [FZF](https://github.com/junegunn/fzf)
- [Zoxide](https://github.com/ajeetdsouza/zoxide)
- [Bat](https://github.com/sharkdp/bat)
- [Eza](https://github.com/eza-community/eza)
- [Mise](https://github.com/jdx/mise)
