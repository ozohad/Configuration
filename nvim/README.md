# Neovim Configuration

Complete IDE setup for software development with LSP, Git integration, and extensive plugins.

## Features

- **LSP Integration** - Full language server support
- **Fuzzy Finding** - Telescope for files, text, and more
- **Git Integration** - Gitsigns, Fugitive, and visual diff
- **File Explorer** - NvimTree with icons
- **Auto-completion** - nvim-cmp with snippets
- **Syntax Highlighting** - Treesitter
- **Session Management** - Auto-save and restore
- **Project Management** - Quick project switching
- **Code Navigation** - Harpoon for quick file access

## Installation

```bash
# Backup existing config
mv ~/.config/nvim ~/.config/nvim.backup

# Copy new config
cp -r nvim ~/.config/nvim

# Launch Neovim (plugins auto-install)
nvim
```

## Dependencies

### Required
- Neovim >= 0.9.0
- Git
- Node.js (for some LSP servers)
- Ripgrep (for Telescope live grep)
- fd (for Telescope file finding)

### Optional
- Nerd Font (for icons)
- Clipboard tool (xclip/xsel on Linux)

## Plugin Manager

Uses **lazy.nvim** - auto-installs on first launch.

## Key Plugins

### Core
- **lazy.nvim** - Plugin manager
- **plenary.nvim** - Lua utilities

### LSP & Completion
- **nvim-lspconfig** - LSP configuration
- **mason.nvim** - LSP server installer
- **mason-lspconfig.nvim** - Bridge mason and lspconfig
- **nvim-cmp** - Completion engine
- **LuaSnip** - Snippet engine
- **cmp-nvim-lsp** - LSP completion source
- **cmp-buffer** - Buffer completion
- **cmp-path** - Path completion
- **friendly-snippets** - Snippet collection

### Navigation
- **telescope.nvim** - Fuzzy finder
- **nvim-tree.lua** - File explorer
- **harpoon** - Quick file navigation
- **project.nvim** - Project management
- **which-key.nvim** - Keybinding helper

### Git
- **gitsigns.nvim** - Git decorations
- **fugitive.vim** - Git commands
- **vim-rhubarb** - GitHub integration

### UI
- **lualine.nvim** - Status line
- **bufferline.nvim** - Buffer tabs
- **alpha-nvim** - Start screen
- **indent-blankline.nvim** - Indent guides
- **nvim-web-devicons** - File icons
- **dressing.nvim** - Better UI elements

### Editing
- **nvim-treesitter** - Syntax highlighting
- **nvim-autopairs** - Auto-close brackets
- **Comment.nvim** - Easy commenting
- **nvim-surround** - Surround text objects
- **substitute.nvim** - Better substitute
- **nvim-ufo** - Advanced folding

### Diagnostics
- **trouble.nvim** - Diagnostics list
- **todo-comments.nvim** - TODO highlights

### Themes
- **catppuccin** - Main theme
- **tokyonight.nvim** - Alternative theme

### Utilities
- **auto-session** - Session management
- **inc-rename.nvim** - Live rename preview

## Structure

```
nvim/
├── init.lua                    # Entry point
├── lua/
│   └── user/
│       ├── core/
│       │   ├── init.lua       # Core initialization
│       │   ├── options.lua    # Vim options
│       │   └── keymaps.lua    # Key mappings
│       ├── plugins/
│       │   ├── init.lua       # Plugin list
│       │   ├── lsp/
│       │   │   ├── mason.lua  # LSP installer
│       │   │   └── lspconfig.lua # LSP config
│       │   ├── telescope.lua  # Fuzzy finder
│       │   ├── nvim-tree.lua  # File explorer
│       │   ├── nvim-cmp.lua   # Completion
│       │   ├── treesitter.lua # Syntax
│       │   ├── gitsigns.lua   # Git integration
│       │   └── ...            # Other plugins
│       └── lazy.lua           # Plugin manager setup
```

## Configuration

### Leader Key
- Leader: `Space`

### Core Options
- Line numbers (relative)
- Smart indentation (2 spaces)
- Smart case search
- Persistent undo
- System clipboard integration
- Mouse support
- 24-bit color

### LSP Servers
Installed via Mason:
- clangd (C/C++)
- ts_ls (TypeScript/JavaScript)
- lua_ls (Lua)
- pyright (Python)
- rust_analyzer (Rust)

Install more:
```vim
:Mason
```

## Usage

### First Launch
1. Open Neovim: `nvim`
2. Plugins auto-install (wait for completion)
3. Restart Neovim
4. Install LSP servers: `:Mason`

### File Navigation
- `Space` + `ff` - Find files
- `Space` + `fg` - Find text
- `Space` + `fr` - Recent files
- `Space` + `e` - Toggle file explorer

### LSP Features
- `gd` - Go to definition
- `gr` - Find references
- `K` - Hover documentation
- `Space` + `ca` - Code actions
- `Space` + `rn` - Rename symbol

### Git Operations
- `Space` + `gs` - Git status
- `Space` + `gc` - Git commit
- `Space` + `gd` - Git diff
- `]c` / `[c` - Next/previous hunk

### Diagnostics
- `Space` + `xx` - Toggle diagnostics
- `[d` / `]d` - Next/previous diagnostic
- `Space` + `D` - Show line diagnostics

## Customization

### Change Theme
Edit `lua/user/plugins/colorscheme.lua`:
```lua
return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    vim.cmd([[colorscheme catppuccin-mocha]])
  end,
}
```

### Add Keybindings
Edit `lua/user/core/keymaps.lua`:
```lua
keymap.set("n", "<leader>custom", ":CustomCommand<CR>", { desc = "Description" })
```

### Configure LSP
Edit `lua/user/plugins/lsp/lspconfig.lua`

### Add Plugins
Edit `lua/user/plugins/init.lua` or create new file in `lua/user/plugins/`

## Troubleshooting

### Plugins Not Installing
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

### Treesitter Issues
```vim
:TSUpdate
:checkhealth nvim-treesitter
```

### General Health Check
```vim
:checkhealth
```

### Reset Configuration
```bash
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
nvim  # Reinstalls everything
```

## Tips

### Telescope
- `CTRL` + `n/p` - Navigate results
- `CTRL` + `c` - Close
- `CTRL` + `u/d` - Scroll preview
- `?` - Show help

### NvimTree
- `a` - Create file/folder
- `d` - Delete
- `r` - Rename
- `x/c/p` - Cut/copy/paste
- `R` - Refresh
- `?` - Help

### Harpoon
- `Space` + `ha` - Add file
- `Space` + `hh` - Toggle menu
- `Space` + `h1-4` - Jump to file

### Which-Key
- Press `Space` and wait - shows available shortcuts
- Press `Space` + `?` - Show all mappings

## Performance

### Startup Time
Check with:
```bash
nvim --startuptime startup.log
```

### Lazy Loading
Most plugins lazy-load on demand for fast startup.

## Updates

### Update Plugins
```vim
:Lazy sync
```

### Update LSP Servers
```vim
:Mason
:MasonUpdate
```

### Update Treesitter Parsers
```vim
:TSUpdate
```

## Project-Specific Config

Create `.nvim.lua` in project root for project-specific settings.

## Additional Resources

- [Neovim Documentation](https://neovim.io/doc/)
- [Lazy.nvim](https://github.com/folke/lazy.nvim)
- [Mason.nvim](https://github.com/williamboman/mason.nvim)
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
