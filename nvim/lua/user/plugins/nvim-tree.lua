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
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
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
        
        -- Custom function to open file in new tab with tree
        local function open_tab_with_tree()
          api.node.open.tab()
          vim.schedule(function()
            vim.cmd('NvimTreeOpen')
            -- Focus on the file window so tab shows file name
            vim.cmd('wincmd l')
          end)
        end
        
        -- Default mappings first
        api.config.mappings.default_on_attach(bufnr)
        
        -- Override to open in new tab with tree
        vim.keymap.set('n', '<CR>', open_tab_with_tree, opts('Open: New Tab with Tree'))
        vim.keymap.set('n', 'o', open_tab_with_tree, opts('Open: New Tab with Tree'))
        vim.keymap.set('n', 't', open_tab_with_tree, opts('Open: New Tab with Tree'))
      end,
    })

    -- set keymaps
    local keymap = vim.keymap -- for conciseness
    -- Ctrl+w (Command +w) switch between panes

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
  end
}
