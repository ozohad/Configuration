return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 35,
        relativenumber = false,
        number = true,
      },
      -- Disable nvim-tree from updating focused file (this prevents tab title changes)
      update_focused_file = {
        enable = false,
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
          quit_on_open = false,
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
      on_attach = function(bufnr)
        local api = require('nvim-tree.api')
        
        local function opts(desc)
          return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        
        -- Custom function to open file in current window
        local function open_file_current_window()
          local node = api.tree.get_node_under_cursor()
          if node and node.type == "file" then
            -- Open file in the other window
            vim.cmd('wincmd l')
            vim.cmd('edit ' .. node.absolute_path)
          elseif node and node.type == "directory" then
            api.node.open.edit()
          end
        end
        
        -- Default mappings first
        api.config.mappings.default_on_attach(bufnr)
        
        -- Override Enter to open in current window
        vim.keymap.set('n', '<CR>', open_file_current_window, opts('Open: Current Window'))
        vim.keymap.set('n', 'o', open_file_current_window, opts('Open: Current Window'))
        
        -- Keep 't' for new tab if needed
        vim.keymap.set('n', 't', function()
          api.node.open.tab()
        end, opts('Open: New Tab'))
        
        -- Add Tab key to jump to file window from within NvimTree
        vim.keymap.set('n', '<Tab>', function()
          vim.cmd('wincmd l')
        end, opts('Jump to file window'))
      end,
    })

    -- Auto-close NvimTree when last file is closed
    vim.api.nvim_create_augroup("NvimTreeAutoClose", { clear = true })
    vim.api.nvim_create_autocmd("BufEnter", {
      group = "NvimTreeAutoClose",
      pattern = "*",
      callback = function()
        local layout = vim.api.nvim_call_function("winlayout", {})
        if layout[1] == "leaf" and vim.api.nvim_buf_get_option(vim.api.nvim_win_get_buf(layout[2]), "filetype") == "NvimTree" and layout[3] == nil then
          vim.cmd("confirm quit")
        end
      end
    })

    -- Simple approach: Override the buffer name display
    -- This autocmd prevents nvim-tree from changing what's shown in tabs
    vim.api.nvim_create_augroup("FixNvimTreeTabTitle", { clear = true })
    
    vim.api.nvim_create_autocmd("BufEnter", {
      group = "FixNvimTreeTabTitle",
      pattern = "*",
      callback = function()
        local buf = vim.api.nvim_get_current_buf()
        local buf_name = vim.api.nvim_buf_get_name(buf)
        
        -- If this is nvim-tree, don't let it change the tab title
        if buf_name:match("NvimTree") then
          -- Find the main file buffer in this tab and use its name
          local current_tab = vim.api.nvim_get_current_tabpage()
          local windows = vim.api.nvim_tabpage_list_wins(current_tab)
          
          for _, win in ipairs(windows) do
            local win_buf = vim.api.nvim_win_get_buf(win)
            local win_buf_name = vim.api.nvim_buf_get_name(win_buf)
            local buf_type = vim.api.nvim_buf_get_option(win_buf, 'buftype')
            
            -- Found a regular file buffer
            if buf_type == '' and win_buf_name ~= '' and not win_buf_name:match('NvimTree') then
              local filename = vim.fn.fnamemodify(win_buf_name, ':t')
              -- Set the nvim-tree buffer name to show the file name instead
              vim.api.nvim_buf_set_name(buf, filename .. " (NvimTree)")
              break
            end
          end
        end
      end,
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" })
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
    
    -- Enhanced pane navigation with Ctrl+h/l (changed from Ctrl+Left/Right to avoid word navigation conflict)
    keymap.set("n", "<C-h>", function()
      -- Find nvim-tree window and focus it
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local buf_name = vim.api.nvim_buf_get_name(buf)
        if buf_name:match("NvimTree") then
          vim.api.nvim_set_current_win(win)
          return
        end
      end
    end, { desc = "Focus NvimTree (left pane)" })
    
    keymap.set("n", "<C-l>", function()
      -- Find the main file window and focus it
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        local buf = vim.api.nvim_win_get_buf(win)
        local buf_name = vim.api.nvim_buf_get_name(buf)
        local buf_type = vim.api.nvim_buf_get_option(buf, 'buftype')
        if buf_type == '' and not buf_name:match("NvimTree") then
          vim.api.nvim_set_current_win(win)
          return
        end
      end
    end, { desc = "Focus file window (right pane)" })
  end
}