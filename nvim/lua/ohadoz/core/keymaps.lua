-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- Word navigation and deletion (unified with WezTerm)
keymap.set("i", "<C-Left>", "<C-o>b", { desc = "Move word backward" })
keymap.set("i", "<C-Right>", "<C-o>w", { desc = "Move word forward" })
keymap.set("n", "<C-Left>", "b", { desc = "Move word backward" })
keymap.set("n", "<C-Right>", "w", { desc = "Move word forward" })

-- Explicit mappings for the actual sequences sent by WezTerm (^[b and ^[f)
keymap.set("i", "<Esc>b", "<C-o>b", { desc = "Move word backward (Alt+b)" })
keymap.set("i", "<Esc>f", "<C-o>w", { desc = "Move word forward (Alt+f)" })
keymap.set("n", "<Esc>b", "b", { desc = "Move word backward (Alt+b)" })
keymap.set("n", "<Esc>f", "w", { desc = "Move word forward (Alt+f)" })
keymap.set("i", "<C-S-Left>", "<C-o>0", { desc = "Move to beginning of line" })
keymap.set("i", "<C-S-Right>", "<C-o>$", { desc = "Move to end of line" })
-- Word deletion shortcuts (unified Control+W/D)
keymap.set("i", "<C-w>", "<C-w>", { desc = "Delete word backward" })
keymap.set("i", "<C-d>", "<C-o>dw", { desc = "Delete word forward" })
keymap.set("n", "<C-w>", "db", { desc = "Delete word backward" })
keymap.set("n", "<C-d>", "dw", { desc = "Delete word forward" })

-- Line deletion shortcuts (unified Control+Shift+W/D)
keymap.set("i", "<C-S-w>", "<C-o>d0", { desc = "Delete to beginning of line" })
keymap.set("i", "<C-S-d>", "<C-o>D", { desc = "Delete to end of line" })
keymap.set("n", "<C-S-w>", "d0", { desc = "Delete to beginning of line" })
keymap.set("n", "<C-S-d>", "D", { desc = "Delete to end of line" })

-- Reassign nvim scroll down to Alt+D
keymap.set("n", "<A-d>", "<C-d>", { desc = "Scroll down half page" })
keymap.set("v", "<A-d>", "<C-d>", { desc = "Scroll down half page" })

-- Undo shortcut (unified Control+\)
-- Control+Backspace for undo (only use C-BS, not C-h due to NvimTree conflict)
keymap.set("n", "<C-BS>", "u", { desc = "Undo last change" })
keymap.set("i", "<C-BS>", "<C-o>u", { desc = "Undo last change" })

-- Control+Shift+Backspace for redo
keymap.set("n", "<C-S-BS>", "<C-r>", { desc = "Redo last change" })
keymap.set("i", "<C-S-BS>", "<C-o><C-r>", { desc = "Redo last change" })

-- Legacy word deletion shortcuts (keep for compatibility)
keymap.set("i", "<C-Del>", "<C-o>dw", { desc = "Delete word forward" })
keymap.set("i", "<C-BS>", "<C-o>u", { desc = "Undo last change" })
keymap.set("i", "<C-S-Del>", "<C-o>D", { desc = "Delete to end of line" })
keymap.set("i", "<C-S-BS>", "<C-o><C-r>", { desc = "Redo last change" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- line number toggles
keymap.set("n", "<leader>nn", "<cmd>set number!<CR>", { desc = "Toggle line numbers" })
keymap.set("n", "<leader>nr", "<cmd>set relativenumber!<CR>", { desc = "Toggle relative line numbers" })

-- window navigation with arrow keys
keymap.set("n", "<M-h>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<M-j>", "<C-w>j", { desc = "Move to window below" })
keymap.set("n", "<M-k>", "<C-w>k", { desc = "Move to window above" })
keymap.set("n", "<M-l>", "<C-w>l", { desc = "Move to right window" })

-- tab navigation with arrow keys
keymap.set("n", "<D-Left>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<D-Right>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tc", "<cmd>tabnew<CR><cmd>NvimTreeOpen<CR>", { desc = "Create new tab with tree" })

-- Alternative tab navigation that works better
keymap.set("n", "<leader>th", "<cmd>tabp<CR>", { desc = "Go to previous tab (left)" })
keymap.set("n", "<leader>tl", "<cmd>tabn<CR>", { desc = "Go to next tab (right)" })

-- Also add number-based tab switching
keymap.set("n", "<leader>1", "1gt", { desc = "Go to tab 1" })
keymap.set("n", "<leader>2", "2gt", { desc = "Go to tab 2" })
keymap.set("n", "<leader>3", "3gt", { desc = "Go to tab 3" })
keymap.set("n", "<leader>4", "4gt", { desc = "Go to tab 4" })
keymap.set("n", "<leader>5", "5gt", { desc = "Go to tab 5" })

-- Try different arrow key combinations
keymap.set("n", "<M-Left>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })  -- Alt+Left
keymap.set("n", "<M-Right>", "<cmd>tabn<CR>", { desc = "Go to next tab" })    -- Alt+Right

-- Shift+Arrow keys for tab navigation
keymap.set("n", "<S-Left>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })  -- Shift+Left
keymap.set("n", "<S-Right>", "<cmd>tabn<CR>", { desc = "Go to next tab" })    -- Shift+Right

-- CLEANED UP REFRESH SHORTCUTS - All start with 'r' for consistency

-- Main auto-refresh with highlighting and auto-jump
keymap.set("n", "<leader>ra", function()
  vim.opt.autoread = true
  vim.opt.autowriteall = true  -- Auto-save changes
  
  -- Handle file conflicts automatically
  vim.opt.confirm = false  -- Don't show confirmation dialogs
  
  -- Stop existing timer
  if _G.refresh_timer then
    _G.refresh_timer:stop()
    _G.refresh_timer:close()
  end
  
  local filename = vim.fn.expand("%:p")
  local last_modified = vim.fn.getftime(filename)
  
  -- Store current content for comparison
  local current_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  _G.last_content = vim.deepcopy(current_lines)
  _G.highlight_enabled = true
  _G.auto_jump_enabled = true  -- Enable auto-jump by default
  
  -- Create highlight group for new content
  vim.api.nvim_set_hl(0, "NewContent", { bg = "#3d4f2f", fg = "#a6e3a1" })  -- Green background
  
  -- Create timer that checks file every 500ms
  _G.refresh_timer = vim.loop.new_timer()
  _G.refresh_timer:start(500, 500, vim.schedule_wrap(function()
    local current_modified = vim.fn.getftime(filename)
    
    if current_modified > last_modified then
      last_modified = current_modified
      
      -- Save current buffer if modified to avoid conflicts
      if vim.bo.modified then
        vim.cmd("silent! write")
      end
      
      -- Get old content before reload
      local old_lines = vim.deepcopy(_G.last_content or {})
      
      -- Reload the file without prompts
      vim.cmd("silent! checktime")
      vim.cmd("silent! edit!")  -- Force reload
      
      -- Get new content after reload
      local new_lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
      _G.last_content = vim.deepcopy(new_lines)
      
      -- Only highlight if enabled
      if _G.highlight_enabled ~= false then
        -- Clear previous highlights
        vim.api.nvim_buf_clear_namespace(0, -1, 0, -1)
        
        -- Find and highlight new/changed lines
        local changes_found = false
        local first_change_line = nil
        
        for i, new_line in ipairs(new_lines) do
          local old_line = old_lines[i] or ""
          if new_line ~= old_line then
            -- Highlight the changed line
            vim.api.nvim_buf_add_highlight(0, -1, "NewContent", i-1, 0, -1)
            changes_found = true
            -- Remember first change line
            if not first_change_line then
              first_change_line = i
            end
          end
        end
        
        -- Highlight completely new lines (if file grew)
        if #new_lines > #old_lines then
          for i = #old_lines + 1, #new_lines do
            vim.api.nvim_buf_add_highlight(0, -1, "NewContent", i-1, 0, -1)
            changes_found = true
            -- Remember first new line if no changes found yet
            if not first_change_line then
              first_change_line = i
            end
          end
        end
        
        -- Jump to first change if auto-jump is enabled
        if changes_found and first_change_line and _G.auto_jump_enabled then
          -- Move cursor to first changed line
          vim.api.nvim_win_set_cursor(0, {first_change_line, 0})
          -- Center the line on screen
          vim.cmd("normal! zz")
        end
        
        -- Show notification
        local file_name = vim.fn.expand("%:t")
        if changes_found then
          local jump_msg = _G.auto_jump_enabled and " (jumped to line " .. first_change_line .. ")" or ""
          vim.notify("File reloaded with highlighted changes: " .. file_name .. jump_msg, "info", {
            title = "🔄 Auto-refresh",
            timeout = 3000,
          })
        else
          vim.notify("File reloaded: " .. file_name, "info", {
            title = "🔄 Auto-refresh",
            timeout = 2000,
          })
        end
      end
    end
  end))
  
  vim.notify("Auto-refresh with change highlighting and auto-jump enabled", "success", {
    title = "✅ Auto-refresh",
    timeout = 2000,
  })
end, { desc = "Enable auto-refresh with highlighting and auto-jump" })

-- Disable auto-refresh
keymap.set("n", "<leader>rd", function()
  vim.opt.autoread = false
  
  if _G.refresh_timer then
    _G.refresh_timer:stop()
    _G.refresh_timer:close()
    _G.refresh_timer = nil
    
    vim.notify("Auto-refresh disabled", "warn", {
      title = "🔄 Auto-refresh",
      timeout = 2000,
    })
  else
    vim.notify("Auto-refresh was not active", "info", {
      title = "🔄 Auto-refresh", 
      timeout = 2000,
    })
  end
end, { desc = "Disable auto-refresh" })

-- Manual refresh
keymap.set("n", "<leader>rm", function()
  vim.cmd("checktime")
  local file_name = vim.fn.expand("%:t")
  vim.notify("Manually refreshed: " .. file_name, "info", {
    title = "🔄 Manual refresh",
    timeout = 1500,
  })
end, { desc = "Manual refresh with notification" })

-- Toggle highlighting on/off (FIXED - no more conflict with tab navigation)
keymap.set("n", "<leader>rh", function()
  if _G.highlight_enabled == false then
    -- Re-enable highlighting
    _G.highlight_enabled = true
    vim.notify("Change highlighting enabled", "info", {
      title = "🎨 Highlighting",
      timeout = 1500,
    })
  else
    -- Disable highlighting
    _G.highlight_enabled = false
    -- Clear all highlights
    vim.api.nvim_buf_clear_namespace(0, -1, 0, -1)
    vim.notify("Change highlighting disabled", "warn", {
      title = "🎨 Highlighting", 
      timeout = 1500,
    })
  end
end, { desc = "Toggle change highlighting" })

-- Toggle auto-jump to changes
keymap.set("n", "<leader>rj", function()
  if _G.auto_jump_enabled == false then
    _G.auto_jump_enabled = true
    vim.notify("Auto-jump to changes enabled", "info", {
      title = "🎯 Auto-jump",
      timeout = 1500,
    })
  else
    _G.auto_jump_enabled = false
    vim.notify("Auto-jump to changes disabled", "warn", {
      title = "🎯 Auto-jump",
      timeout = 1500,
    })
  end
end, { desc = "Toggle auto-jump to first change" })

-- Clear all highlights manually
keymap.set("n", "<leader>rc", function()
  vim.api.nvim_buf_clear_namespace(0, -1, 0, -1)
  vim.notify("All highlights cleared", "info", {
    title = "🎨 Clear highlights",
    timeout = 1500,
  })
end, { desc = "Clear all highlights" })

-- Jump to next change manually
keymap.set("n", "<leader>rn", function()
  local current_line = vim.api.nvim_win_get_cursor(0)[1]
  local total_lines = vim.api.nvim_buf_line_count(0)
  
  -- Look for next highlighted line after current position
  for line = current_line + 1, total_lines do
    local highlights = vim.api.nvim_buf_get_extmarks(0, -1, {line-1, 0}, {line-1, -1}, {details = true})
    for _, mark in ipairs(highlights) do
      if mark[4] and mark[4].hl_group == "NewContent" then
        vim.api.nvim_win_set_cursor(0, {line, 0})
        vim.cmd("normal! zz")
        vim.notify("Jumped to change at line " .. line, "info", {
          title = "🎯 Jump to change",
          timeout = 1500,
        })
        return
      end
    end
  end
  
  -- If no change found after current line, wrap to beginning
  for line = 1, current_line do
    local highlights = vim.api.nvim_buf_get_extmarks(0, -1, {line-1, 0}, {line-1, -1}, {details = true})
    for _, mark in ipairs(highlights) do
      if mark[4] and mark[4].hl_group == "NewContent" then
        vim.api.nvim_win_set_cursor(0, {line, 0})
        vim.cmd("normal! zz")
        vim.notify("Jumped to change at line " .. line .. " (wrapped)", "info", {
          title = "🎯 Jump to change",
          timeout = 1500,
        })
        return
      end
    end
  end
  
  vim.notify("No highlighted changes found", "warn", {
    title = "🎯 Jump to change",
    timeout = 1500,
  })
end, { desc = "Jump to next highlighted change" })

-- Force reload file (discard local changes) - keep this one as it's useful for conflicts
keymap.set("n", "<leader>rf", function()
  vim.cmd("edit!")  -- Force reload, discarding local changes
  vim.notify("File force-reloaded (local changes discarded)", "warn", {
    title = "🔄 Force reload",
    timeout = 2000,
  })
end, { desc = "Force reload file (discard local changes)" })

-- Switch between header and source files (C/C++)
keymap.set("n", "<leader>oh", "<cmd>ClangdSwitchSourceHeader<CR>", { desc = "Switch between header/source file" })