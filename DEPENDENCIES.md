# Dependencies

Complete list of required software, plugins, and tools for this configuration.

## Core Requirements

### Terminal Emulator
- **WezTerm** - https://wezfurlong.org/wezterm/
  ```bash
  brew install --cask wezterm
  ```

### Editor
- **Neovim** (>= 0.9.0) - https://neovim.io/
  ```bash
  brew install neovim
  ```

### Shell
- **Zsh** (default on macOS)
- **Bash** (fallback)

## WezTerm Dependencies

### Required Plugins
- **resurrect.wezterm** - Session management
  - Auto-installed via WezTerm plugin system
  - URL: https://github.com/MLFlexer/resurrect.wezterm

- **tabline.wez** - Enhanced tab bar
  - Auto-installed via WezTerm plugin system
  - URL: https://github.com/michaelbrusegard/tabline.wez

### Fonts
- **MesloLGS Nerd Font Mono** - Required for icons
  ```bash
  brew tap homebrew/cask-fonts
  brew install font-meslo-lg-nerd-font
  ```

## Neovim Dependencies

### Plugin Manager
- **lazy.nvim** - Auto-installed on first launch
  - URL: https://github.com/folke/lazy.nvim

### LSP Servers (via Mason)
- **clangd** - C/C++ language server
- **ts_ls** - TypeScript/JavaScript language server
- **lua_ls** - Lua language server
- **pyright** - Python language server

Install via Mason in Neovim:
```vim
:Mason
```

### Key Plugins (auto-installed via lazy.nvim)

#### Core Functionality
- **nvim-treesitter** - Syntax highlighting
- **telescope.nvim** - Fuzzy finder
- **nvim-tree.lua** - File explorer
- **which-key.nvim** - Keybinding helper

#### LSP & Completion
- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP server manager
- **nvim-cmp** - Autocompletion
- **LuaSnip** - Snippet engine

#### Git Integration
- **gitsigns.nvim** - Git decorations
- **fugitive.vim** - Git commands
- **vim-rhubarb** - GitHub integration

#### UI Enhancements
- **lualine.nvim** - Status line
- **bufferline.nvim** - Buffer tabs
- **alpha-nvim** - Start screen
- **indent-blankline.nvim** - Indent guides

#### Code Tools
- **trouble.nvim** - Diagnostics list
- **todo-comments.nvim** - TODO highlights
- **nvim-autopairs** - Auto-close brackets
- **Comment.nvim** - Easy commenting
- **nvim-ufo** - Advanced folding

#### Navigation
- **harpoon** - Quick file navigation
- **project.nvim** - Project management
- **auto-session** - Session management

#### Themes
- **catppuccin** - Color scheme
- **tokyonight.nvim** - Alternative theme

## Shell Dependencies

### Package Manager
- **Homebrew** - https://brew.sh/
  ```bash
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

### Zsh Plugins
- **powerlevel10k** - Prompt theme
  ```bash
  brew install powerlevel10k
  ```

- **zsh-autosuggestions** - Command suggestions
  ```bash
  brew install zsh-autosuggestions
  ```

- **zsh-syntax-highlighting** - Syntax highlighting
  ```bash
  brew install zsh-syntax-highlighting
  ```

### CLI Tools
- **fzf** - Fuzzy finder
  ```bash
  brew install fzf
  ```

- **bat** - Better cat with syntax highlighting
  ```bash
  brew install bat
  ```

- **eza** - Better ls with icons
  ```bash
  brew install eza
  ```

- **zoxide** - Smart cd command
  ```bash
  brew install zoxide
  ```

- **mise** - Runtime version manager
  ```bash
  brew install mise
  ```

### Python Environment
- **pyenv** - Python version manager
  ```bash
  brew install pyenv
  ```

## AI Assistant Dependencies

### Kiro CLI
- Installation varies by platform
- Requires AWS credentials for Amazon Q integration
- See official documentation for setup

## Optional Tools

### Development
- **git** - Version control (pre-installed on macOS)
- **node** - JavaScript runtime
  ```bash
  brew install node
  ```

- **pnpm** - Fast package manager
  ```bash
  brew install pnpm
  ```

### Terminal Multiplexer (Alternative)
- **tmux** - If not using WezTerm panes
  ```bash
  brew install tmux
  ```

## Installation Order

1. Install Homebrew
2. Install core tools (WezTerm, Neovim, fonts)
3. Install shell plugins (powerlevel10k, fzf, etc.)
4. Install CLI utilities (bat, eza, zoxide)
5. Copy configurations
6. Launch Neovim (plugins auto-install)
7. Install LSP servers via Mason

## Verification

### Check WezTerm
```bash
wezterm --version
```

### Check Neovim
```bash
nvim --version
```

### Check Shell Plugins
```bash
# In zsh
echo $ZSH_VERSION
which fzf bat eza zoxide
```

### Check Neovim Plugins
```vim
:Lazy
:Mason
:checkhealth
```

## Troubleshooting

### Neovim Plugin Issues
```vim
:Lazy sync
:Lazy clean
:Lazy update
```

### LSP Not Working
```vim
:LspInfo
:Mason
:checkhealth lsp
```

### Shell Completions Not Working
```bash
# Rebuild zsh completions
rm -f ~/.zcompdump
compinit
```

### Font Icons Not Showing
- Ensure Nerd Font is installed
- Set terminal font to "MesloLGS Nerd Font Mono"
- Restart terminal

## Platform Notes

### macOS Specific
- Some shortcuts use CMD key (mapped to CTRL in configs)
- Mission Control shortcuts may conflict (disable in System Settings)
- Requires Xcode Command Line Tools:
  ```bash
  xcode-select --install
  ```

### Linux Adaptations
- Replace `brew` with appropriate package manager
- Adjust key mappings (CMD → CTRL)
- Font installation may differ

## Updates

Keep dependencies updated:
```bash
# Homebrew
brew update && brew upgrade

# Neovim plugins
nvim +Lazy sync +qa

# LSP servers
nvim +Mason +MasonUpdate +qa
```
