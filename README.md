# Development Environment Configuration

Complete configuration backup for terminal, editor, and AI assistant setup on macOS.

## Contents

- **WezTerm** - Terminal emulator configuration
- **Neovim** - IDE configuration with LSP, plugins, and keybindings
- **Shell** - Zsh and Bash configurations
- **AI Assistant** - Kiro/Q CLI prompts and guidelines

## Quick Start

1. Install dependencies (see DEPENDENCIES.md)
2. Copy configurations to appropriate locations
3. Restart terminal/applications
4. Review SHORTCUTS.md for keybindings

## Directory Structure

```
.
├── wezterm/          # WezTerm terminal configuration
├── nvim/             # Neovim editor configuration
├── shell/            # Shell configurations (.zshrc, .bashrc)
├── kiro/             # AI assistant prompts
├── DEPENDENCIES.md   # Required software and plugins
├── SHORTCUTS.md      # Complete keyboard shortcuts reference
└── README.md         # This file
```

## Installation

### WezTerm
```bash
cp wezterm/.wezterm.lua ~/.wezterm.lua
```

### Neovim
```bash
cp -r nvim/* ~/.config/nvim/
```

### Shell
```bash
cp shell/.zshrc ~/.zshrc
cp shell/.bashrc ~/.bashrc
source ~/.zshrc  # or source ~/.bashrc
```

### AI Assistant
```bash
mkdir -p ~/.aws/amazonq
cp kiro/pre_chat_guidelines.txt ~/.aws/amazonq/
cp kiro/text_review_prompt.txt ~/.aws/amazonq/profiles/text-review/profile_pre_chat.txt
```

## Customization

All configurations use `$HOME` for paths. Update these placeholders:
- `$HOME` - Your home directory
- `$PROJECT_ROOT` - Your main project directory
- `<COMPANY>` - Your company name
- `<PROJECT>` - Your project name

## Notes

- Configurations sanitized for public sharing
- Company-specific references replaced with placeholders
- Sensitive paths and data removed
- Local copies remain unchanged

## Support

For issues or questions, refer to individual configuration documentation in each directory.
