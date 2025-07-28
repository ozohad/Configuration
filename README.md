# Working Environment Configuration

A comprehensive development environment setup for macOS and Linux with WezTerm, Neovim, and Zsh configurations.

## Overview

This configuration package provides:
- **WezTerm**: Modern terminal with tmux-like features, session management, and custom themes
- **Neovim**: Full IDE setup with LSP, plugins, and project-specific configurations
- **Zsh**: Enhanced shell configuration with plugins and themes
- **Cross-platform compatibility**: Works on both macOS and Linux

## Features

### WezTerm Features
- Catppuccin Mocha theme with transparency
- Session management with resurrect plugin
- Tmux-like keybindings with ` (backtick) as leader
- Status bar with system information
- 50,000 lines scrollback buffer
- Custom tab management
- Pane splitting and navigation

### Neovim Features
- LSP support with clangd for C++ development
- File explorer (NvimTree) with tab integration
- Fuzzy finder (Telescope) with project support
- Git integration (Gitsigns + Fugitive)
- Session management and project detection
- Code navigation, refactoring, and diagnostics
- Syntax highlighting and auto-completion
- Folding support for large files
- Custom project configurations

### Key Dependencies
- **Neovim >= 0.9.0**
- **WezTerm >= 20230712**
- **Git**
- **Node.js** (for LSP servers)
- **Clangd** (for C++ development)
- **MesloLGS Nerd Font** (for icons)

## Installation

### Prerequisites

#### macOS
```bash
# Install Homebrew if not already installed
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install dependencies
brew install neovim wezterm git node clangd
brew install --cask font-meslo-lg-nerd-font
```

#### Linux (Ubuntu/Debian)
```bash
# Update package list
sudo apt update

# Install dependencies
sudo apt install git curl build-essential

# Install Neovim (latest)
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo tar -C /opt -xzf nvim-linux64.tar.gz
sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install clangd
sudo apt install clangd

# Install WezTerm
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update
sudo apt install wezterm

# Install Nerd Font
mkdir -p ~/.local/share/fonts
curl -fsSL https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Meslo.zip -o /tmp/Meslo.zip
unzip /tmp/Meslo.zip -d ~/.local/share/fonts/
fc-cache -fv
```

### Quick Install
```bash
# Clone or download this configuration
cd ~/tmp/working_env_config

# Run the installation script
./install.sh
```

### Manual Installation

1. **Backup existing configurations**:
```bash
mv ~/.config/nvim ~/.config/nvim.backup 2>/dev/null || true
mv ~/.wezterm.lua ~/.wezterm.lua.backup 2>/dev/null || true
mv ~/.zshrc ~/.zshrc.backup 2>/dev/null || true
```

2. **Install configurations**:
```bash
# Copy Neovim configuration
cp -r nvim ~/.config/

# Copy WezTerm configuration
cp wezterm.lua ~/.wezterm.lua

# Copy Zsh configuration (if provided)
cp zshrc ~/.zshrc
```

3. **Install Neovim plugins**:
```bash
nvim --headless -c "Lazy! sync" -c "qa"
```

## Configuration Details

### WezTerm Keybindings

#### Leader Key: ` (backtick)

| Key | Action |
|-----|--------|
| `` ` `` + `s` | Save session |
| `` ` `` + `r` | Restore session |
| `` ` `` + `Shift+R` | Reload config |
| `` ` `` + `-` | Split vertically |
| `` ` `` + `\\` | Split horizontally |
| `` ` `` + `z` | Toggle pane zoom |
| `` ` `` + `c` | Create new tab |
| `` ` `` + `q` | Close pane |
| `` ` `` + `,` | Rename tab |
| `` ` `` + `[` | Copy mode |
| `` ` `` + `]` | Paste |

#### Navigation
| Key | Action |
|-----|--------|
| `Opt+Arrow` | Navigate panes |
| `Opt+Shift+Arrow` | Resize panes |
| `` ` `` + `1-9` | Switch to tab |

### Neovim Keybindings

#### Leader Key: Space

| Key | Action |
|-----|--------|
| `Space ee` | Toggle file explorer |
| `Space ff` | Find files |
| `Space fs` | Live grep |
| `Space xx` | Show diagnostics |
| `Space gs` | Git status |
| `Space ha` | Harpoon add file |
| `Space hh` | Harpoon menu |

#### Code Navigation
| Key | Action |
|-----|--------|
| `gd` | Go to definition |
| `gr` | Show references |
| `gi` | Go to implementation |
| `K` | Show documentation |
| `Space ca` | Code actions |
| `Space rn` | Rename symbol |

#### Tab Navigation
| Key | Action |
|-----|--------|
| `Ctrl+Left` | Previous tab |
| `Ctrl+Right` | Next tab |
| `Ctrl+Shift+Arrow` | Navigate windows |

#### Custom Project Development
| Key | Action |
|-----|--------|
| `Space r` | Project menu |
| `Space rbb` | Build project |
| `Space rbc` | Generate compile commands |
| `Space rff` | Find files in project |
| `Space rfg` | Live grep in project |

## Platform-Specific Configurations

### macOS Specific
- CMD key mappings in WezTerm
- macOS window blur effects
- Homebrew paths

### Linux Specific
- Alt key mappings instead of CMD
- X11 clipboard integration
- Different font paths

## Customization

### Adding New Neovim Plugins
1. Create a new file in `nvim/lua/user/plugins/`
2. Follow the lazy.nvim plugin specification
3. Restart Neovim and run `:Lazy sync`

### WezTerm Themes
Available themes in `wezterm.lua`:
- Catppuccin Mocha (default)
- Gruvbox
- Monokai Pro

### Project-Specific Configurations
The setup includes project-specific configurations. To add your own:
1. Create a new plugin file in `nvim/lua/user/plugins/`
2. Modify paths and commands for your project
3. Update the auto-detection logic

## Troubleshooting

### Common Issues

1. **Neovim plugins not loading**:
```bash
nvim --headless -c "Lazy! sync" -c "qa"
```

2. **LSP not working**:
```bash
# Check if clangd is installed
which clangd

# Generate compile commands for C++ projects
cd your-project && cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .
```

3. **WezTerm font issues**:
- Ensure MesloLGS Nerd Font is installed
- Check font configuration in `wezterm.lua`

4. **Session restore not working**:
- Check WezTerm plugin installation
- Verify session directory permissions

### Logs and Debugging
- Neovim: `:checkhealth` and `:LspLog`
- WezTerm: Check terminal output for errors
- LSP: Check `~/.local/state/nvim/lsp.log`

## Contributing

To contribute improvements:
1. Test changes on both macOS and Linux
2. Update documentation
3. Ensure backward compatibility
4. Add appropriate error handling

## License

This configuration is provided as-is for personal and educational use.

## Credits

- Based on various community configurations
- Plugins by their respective authors
- Themes and color schemes by their creators