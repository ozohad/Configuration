# WezTerm Configuration

Terminal emulator configuration with TMUX-like features, session management, and enhanced UI.

## Features

- **Session Management** - Save/restore terminal sessions with resurrect plugin
- **TMUX-like Keybindings** - Familiar pane and tab management
- **Enhanced Tab Bar** - Custom tabline with system info
- **Catppuccin Mocha Theme** - Modern, pleasant color scheme
- **Nerd Font Support** - Icons and glyphs
- **macOS Optimized** - Shortcuts adapted for macOS

## Installation

```bash
cp .wezterm.lua ~/.wezterm.lua
```

## Dependencies

- WezTerm (latest version)
- MesloLGS Nerd Font Mono
- Plugins (auto-installed):
  - resurrect.wezterm
  - tabline.wez

## Key Features

### Leader Key
- Leader: `` ` `` (backtick)
- Timeout: 1000ms

### Session Management
- Save sessions with workspace/window/tab state
- Restore sessions via fuzzy finder
- Periodic auto-save every 5 minutes
- Delete old sessions

### Pane Management
- Split vertically/horizontally
- Navigate with Option+Arrows
- Resize with Option+Shift+Arrows
- Rotate panes clockwise/counter-clockwise
- Zoom individual panes

### Tab Management
- Create tabs with custom names
- Rename tabs on the fly
- Jump to specific tabs (1-9)
- Move tabs left/right
- Last tab switching

### Copy Mode
- Vim-like copy mode
- Search with `/` and `?`
- Copy and paste selections

### Text Editing
- Word navigation (CTRL+Arrow)
- Line navigation (CTRL+Shift+Arrow)
- Word deletion (CTRL+W/D)
- Line deletion (CTRL+Shift+W/D)
- Undo/Redo (CTRL+Backspace)

## Configuration Highlights

### Theme
- Color scheme: Catppuccin Mocha
- Background opacity: 0.9
- macOS blur: 10
- Custom tab bar colors

### Status Bar
- CPU and RAM usage
- Date and time
- Battery status
- Current domain
- Tab information

### Shortcuts
See [SHORTCUTS.md](../SHORTCUTS.md) for complete list.

## Customization

Edit `~/.wezterm.lua` to customize:
- Color scheme
- Font and size
- Keybindings
- Tab bar appearance
- Session save interval

## Troubleshooting

### Plugins Not Loading
Plugins auto-install on first launch. If issues occur:
1. Check internet connection
2. Restart WezTerm
3. Check WezTerm logs

### Font Icons Not Showing
1. Install MesloLGS Nerd Font
2. Set font in config: `config.font = wezterm.font("MesloLGS Nerd Font Mono")`
3. Restart WezTerm

### Shortcuts Not Working
1. Check for conflicts with macOS system shortcuts
2. Disable Mission Control shortcuts in System Settings
3. Verify leader key timeout

## Tips

- Use Leader+s frequently to save sessions
- Leader+r to restore after restart
- Copy mode (Leader+[) works like vim
- Pane zoom (Leader+z) for focus
- Tab names help organize work

## Updates

Keep WezTerm updated:
```bash
brew upgrade wezterm
```

Configuration auto-reloads on save (Leader+Shift+R to force reload).
