# Keyboard Shortcuts Reference

Complete keyboard shortcuts for WezTerm, Neovim, and Shell.

## Table of Contents
- [WezTerm](#wezterm)
- [Neovim](#neovim)
- [Shell (Zsh/Bash)](#shell-zshbash)

---

## WezTerm

### Leader Key
- **Leader**: `` ` `` (backtick)
- **Timeout**: 1000ms

### Session Management
| Shortcut | Action |
|----------|--------|
| `Leader` + `s` | Save session |
| `Leader` + `r` | Restore session (fuzzy finder) |
| `Leader` + `Shift` + `D` | Delete old sessions |
| `Leader` + `Shift` + `R` | Reload WezTerm configuration |

### Pane Management
| Shortcut | Action |
|----------|--------|
| `Leader` + `-` | Split pane vertically |
| `Leader` + `\` | Split pane horizontally |
| `Leader` + `z` | Toggle pane zoom |
| `Leader` + `q` | Close current pane |
| `Leader` + `x` | Close current pane (with confirmation) |

### Pane Navigation
| Shortcut | Action |
|----------|--------|
| `Option` + `←` | Move to left pane |
| `Option` + `→` | Move to right pane |
| `Option` + `↑` | Move to upper pane |
| `Option` + `↓` | Move to lower pane |

### Pane Resizing
| Shortcut | Action |
|----------|--------|
| `Option` + `Shift` + `←` | Resize pane left |
| `Option` + `Shift` + `→` | Resize pane right |
| `Option` + `Shift` + `↑` | Resize pane up |
| `Option` + `Shift` + `↓` | Resize pane down |

### Pane Rotation
| Shortcut | Action |
|----------|--------|
| `Option` + `Shift` + `>` | Rotate panes clockwise |
| `Option` + `Shift` + `<` | Rotate panes counter-clockwise |

### Tab Management
| Shortcut | Action |
|----------|--------|
| `Leader` + `c` | Create new tab (with name prompt) |
| `Leader` + `,` | Rename current tab |
| `Leader` + `` ` `` | Switch to last tab |
| `Leader` + `Space` | Next tab |
| `Leader` + `1-9` | Jump to tab 1-9 |
| `CMD` + `Shift` + `←` | Move tab left |
| `CMD` + `Shift` + `→` | Move tab right |

### Copy Mode
| Shortcut | Action |
|----------|--------|
| `Leader` + `[` | Enter copy mode |
| `Leader` + `]` | Paste from selection |
| `Leader` + `y` | Copy and quit copy mode |
| `Leader` + `/` | Search (case-sensitive) |
| `Leader` + `?` | Search (case-insensitive) |

### Text Navigation (in terminal)
| Shortcut | Action |
|----------|--------|
| `CTRL` + `←` | Move word backward |
| `CTRL` + `→` | Move word forward |
| `CTRL` + `Shift` + `←` | Move to line beginning |
| `CTRL` + `Shift` + `→` | Move to line end |

### Text Deletion (in terminal)
| Shortcut | Action |
|----------|--------|
| `CTRL` + `W` | Delete word backward |
| `CTRL` + `D` | Delete word forward |
| `CTRL` + `Backspace` | Delete word backward |
| `CTRL` + `Delete` | Delete word forward |
| `CTRL` + `Shift` + `W` | Delete to line beginning |
| `CTRL` + `Shift` + `D` | Delete to line end |
| `CTRL` + `Shift` + `Backspace` | Delete entire line |

### Undo/Redo (in terminal)
| Shortcut | Action |
|----------|--------|
| `CTRL` + `Backspace` | Undo |
| `CTRL` + `Shift` + `Backspace` | Redo |

### Workspace Management
| Shortcut | Action |
|----------|--------|
| `CMD` + `Shift` + `9` | Show workspace launcher |
| `CMD` + `Shift` + `N` | Create/switch workspace |

### Utility
| Shortcut | Action |
|----------|--------|
| `CMD` + `L` | Clear screen |
| `CMD` + `T` | Send CTRL+T to terminal |
| `CMD` + `C` | Send CTRL+C to terminal |
| `CMD` + `A` | Send CTRL+A to terminal |
| `CMD` + `E` | Send CTRL+E to terminal |
| `F11` or `CMD` + `Enter` | Toggle fullscreen |
| `Shift` + `Enter` | New line (for AI assistant) |

---

## Neovim

### Leader Key
- **Leader**: `Space`

### File Operations
| Shortcut | Action |
|----------|--------|
| `Space` + `w` | Save file |
| `Space` + `q` | Quit |
| `Space` + `x` | Save and quit |

### File Navigation (Telescope)
| Shortcut | Action |
|----------|--------|
| `Space` + `ff` | Find files |
| `Space` + `fr` | Recent files |
| `Space` + `fs` / `Space` + `fg` | Find string (live grep) |
| `Space` + `fc` | Find string under cursor |
| `Space` + `fb` | Find buffers |
| `Space` + `fh` | Help tags |
| `Space` + `fp` | Find projects |

### File Explorer (NvimTree)
| Shortcut | Action |
|----------|--------|
| `Space` + `e` | Toggle file explorer |
| `Space` + `ef` | Focus file explorer |
| `CTRL` + `h` | Focus file explorer (global) |
| `CTRL` + `l` | Focus file window (global) |

**In NvimTree:**
| Key | Action |
|-----|--------|
| `Enter` or `o` | Open file/folder |
| `Tab` or `l` | Jump to file window |
| `a` | Create file/folder |
| `d` | Delete |
| `r` | Rename |
| `x` | Cut |
| `c` | Copy |
| `p` | Paste |
| `y` | Copy name |
| `Y` | Copy relative path |
| `gy` | Copy absolute path |
| `R` | Refresh |
| `H` | Toggle hidden files |
| `?` | Help |

### Window Navigation
| Shortcut | Action |
|----------|--------|
| `CTRL` + `h` | Move to left window |
| `CTRL` + `l` | Move to right window |
| `CTRL` + `j` | Move to lower window |
| `CTRL` + `k` | Move to upper window |

### Window Management
| Shortcut | Action |
|----------|--------|
| `Space` + `sv` | Split vertically |
| `Space` + `sh` | Split horizontally |
| `Space` + `se` | Make splits equal size |
| `Space` + `sx` | Close current split |
| `Space` + `sm` | Maximize/minimize split |

### Tab Management
| Shortcut | Action |
|----------|--------|
| `Space` + `to` | Open new tab |
| `Space` + `tx` | Close current tab |
| `Space` + `tn` | Next tab |
| `Space` + `tp` | Previous tab |
| `Space` + `tf` | Open current buffer in new tab |
| `Space` + `1-5` | Jump to tab 1-5 |
| `Shift` + `←` | Previous tab |
| `Shift` + `→` | Next tab |
| `Alt` + `←` | Previous tab |
| `Alt` + `→` | Next tab |

### LSP Navigation
| Shortcut | Action |
|----------|--------|
| `gd` | Go to definition |
| `gr` | Find references |
| `gi` | Go to implementation |
| `gt` | Go to type definition |
| `K` | Hover documentation |
| `Space` + `oh` | Switch header/source (C/C++) |
| `CTRL` + `o` | Go back (jump history) |
| `CTRL` + `i` | Go forward (jump history) |

### LSP Actions
| Shortcut | Action |
|----------|--------|
| `Space` + `ca` | Code actions |
| `Space` + `rn` | Rename symbol |
| `Space` + `D` | Show line diagnostics |
| `[d` | Previous diagnostic |
| `]d` | Next diagnostic |
| `Space` + `rs` | Restart LSP |

### Diagnostics (Trouble)
| Shortcut | Action |
|----------|--------|
| `Space` + `xx` | Toggle diagnostics |
| `Space` + `xw` | Workspace diagnostics |
| `Space` + `xd` | Document diagnostics |
| `Space` + `xq` | Quickfix list |
| `Space` + `xl` | Location list |

### Git Integration
| Shortcut | Action |
|----------|--------|
| `Space` + `gs` | Git status |
| `Space` + `gd` | Git diff split |
| `Space` + `gc` | Git commit |
| `Space` + `gb` | Git blame |
| `Space` + `gl` | Git log |
| `Space` + `gp` | Git push |
| `Space` + `gP` | Git pull |
| `]c` | Next git hunk |
| `[c` | Previous git hunk |
| `Space` + `hs` | Stage hunk |
| `Space` + `hr` | Reset hunk |
| `Space` + `hS` | Stage buffer |
| `Space` + `hu` | Undo stage hunk |
| `Space` + `hR` | Reset buffer |
| `Space` + `hp` | Preview hunk |
| `Space` + `hb` | Blame line |
| `Space` + `hd` | Diff this |
| `Space` + `hD` | Diff this ~ |

### Harpoon (Quick Navigation)
| Shortcut | Action |
|----------|--------|
| `Space` + `ha` | Add file to harpoon |
| `Space` + `hh` | Toggle harpoon menu |
| `Space` + `h1-4` | Jump to harpoon file 1-4 |

### Code Editing
| Shortcut | Action |
|----------|--------|
| `gcc` | Toggle line comment |
| `gc` + motion | Comment motion |
| `gbc` | Toggle block comment |
| `gb` + motion | Block comment motion |
| `Space` + `/` | Toggle comment |

### Text Objects
| Shortcut | Action |
|----------|--------|
| `s` + motion | Substitute motion |
| `ss` | Substitute line |
| `S` | Substitute to end of line |

### Word Navigation
| Shortcut | Action |
|----------|--------|
| `CTRL` + `←` | Move word backward |
| `CTRL` + `→` | Move word forward |
| `b` | Word backward (normal mode) |
| `w` | Word forward (normal mode) |
| `e` | End of word (normal mode) |

### Folding (UFO)
| Shortcut | Action |
|----------|--------|
| `zR` | Open all folds |
| `zM` | Close all folds |
| `zr` | Open one fold level |
| `zm` | Close one fold level |
| `K` | Peek fold (hover) |

### Auto-Refresh (Log Files)
| Shortcut | Action |
|----------|--------|
| `Space` + `ra` | Enable auto-refresh |
| `Space` + `rd` | Disable auto-refresh |
| `Space` + `rm` | Manual refresh |
| `Space` + `rh` | Toggle highlighting |
| `Space` + `rj` | Toggle auto-jump |
| `Space` + `rn` | Jump to next change |
| `Space` + `rc` | Clear highlights |
| `Space` + `rf` | Force reload |

### Undo/Redo
| Shortcut | Action |
|----------|--------|
| `u` | Undo |
| `CTRL` + `r` | Redo |
| `CMD` + `r` | Redo (macOS) |
| `CTRL` + `Backspace` | Undo (insert mode) |
| `CTRL` + `Shift` + `Backspace` | Redo (insert mode) |

### Search
| Shortcut | Action |
|----------|--------|
| `/` | Search forward |
| `?` | Search backward |
| `n` | Next match |
| `N` | Previous match |
| `Space` + `nh` | Clear search highlights |

### Visual Mode
| Shortcut | Action |
|----------|--------|
| `v` | Visual mode |
| `V` | Visual line mode |
| `CTRL` + `v` | Visual block mode |
| `>` | Indent right |
| `<` | Indent left |

### Increment/Decrement
| Shortcut | Action |
|----------|--------|
| `Space` + `+` | Increment number |
| `Space` + `-` | Decrement number |

---

## Shell (Zsh/Bash)

### Line Navigation
| Shortcut | Action |
|----------|--------|
| `CTRL` + `A` | Beginning of line |
| `CTRL` + `E` | End of line |
| `Option` + `A` | Beginning of line |
| `Option` + `E` | End of line |
| `CTRL` + `Shift` + `←` | Beginning of line |
| `CTRL` + `Shift` + `→` | End of line |

### Word Navigation
| Shortcut | Action |
|----------|--------|
| `CTRL` + `←` | Word backward |
| `CTRL` + `→` | Word forward |
| `Option` + `←` | Word backward |
| `Option` + `→` | Word forward |
| `Option` + `B` | Word backward |
| `Option` + `F` | Word forward |

### Text Deletion
| Shortcut | Action |
|----------|--------|
| `CTRL` + `W` | Delete word backward |
| `CTRL` + `D` | Delete word forward |
| `CTRL` + `Shift` + `W` | Delete to line beginning |
| `CTRL` + `Shift` + `D` | Delete to line end |
| `CTRL` + `U` | Delete entire line |
| `CTRL` + `K` | Delete to line end |

### History
| Shortcut | Action |
|----------|--------|
| `↑` | Previous command |
| `↓` | Next command |
| `CTRL` + `R` | Search history |
| `CTRL` + `P` | Previous command |
| `CTRL` + `N` | Next command |

### Undo/Redo
| Shortcut | Action |
|----------|--------|
| `CTRL` + `Backspace` | Undo |
| `CTRL` + `Shift` + `Backspace` | Redo |

### Process Control
| Shortcut | Action |
|----------|--------|
| `CTRL` + `C` | Kill current process |
| `CTRL` + `Z` | Suspend current process |
| `CTRL` + `D` | EOF / Logout (use `Alt` + `D` instead) |
| `Alt` + `D` | EOF / Logout (safer) |

### FZF (Fuzzy Finder)
| Shortcut | Action |
|----------|--------|
| `CTRL` + `T` | Find files |
| `CTRL` + `R` | Search history |
| `Alt` + `C` | Change directory |

### Custom Aliases
| Command | Action |
|---------|--------|
| `ll` | List all files (detailed) |
| `ls` | List files with icons (eza) |
| `lt` | Tree view (level 2) |
| `ltree` | Tree view with icons |
| `cd` | Smart cd (zoxide) |
| `cx` | cd and list |
| `fcd` | Fuzzy cd |
| `f` | Find file (copy path) |
| `fv` | Find and open in nvim |

### AI Assistant (Custom)
| Command | Action |
|---------|--------|
| `qp` | Launch AI agent picker |
| `qpf` | Launch AI agent picker (filtered) |
| `qq <text>` | Quick text review |

---

## Tips

### WezTerm
- Use Leader key for most operations
- Session management preserves entire workspace
- Copy mode works like vim
- Pane management similar to tmux

### Neovim
- Space is your friend (leader key)
- Use Telescope for everything (files, text, help)
- LSP provides IDE features
- Harpoon for quick file switching
- Which-key shows available shortcuts

### Shell
- FZF makes everything searchable
- Zoxide learns your frequent directories
- Eza provides better file listings
- History search with CTRL+R is powerful

### General Workflow
1. WezTerm for terminal management
2. Neovim for editing
3. Telescope for navigation
4. Git integration for version control
5. LSP for code intelligence

## Conflicts to Avoid

### macOS System Shortcuts
- Disable Mission Control shortcuts (CTRL + ←/→)
- Check System Settings → Keyboard → Keyboard Shortcuts

### Application Conflicts
- Some shortcuts may conflict with other apps
- Adjust in application preferences if needed

## Customization

All shortcuts can be customized in:
- WezTerm: `~/.wezterm.lua`
- Neovim: `~/.config/nvim/lua/user/core/keymaps.lua`
- Shell: `~/.zshrc` or `~/.bashrc`
