-- <PROJECT> Project specific configuration
return {
  -- Enhanced C++ support
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
    config = function()
      require("clangd_extensions").setup({
        inlay_hints = {
          inline = vim.fn.has("nvim-0.10") == 1,
          only_current_line = false,
          only_current_line_autocmd = "CursorHold",
          show_parameter_hints = true,
          parameter_hints_prefix = "<- ",
          other_hints_prefix = "=> ",
          max_len_align = false,
          max_len_align_padding = 1,
          right_align = false,
          right_align_padding = 7,
          highlight = "Comment",
          priority = 100,
        },
        ast = {
          role_icons = {
            type = "",
            declaration = "",
            expression = "",
            specifier = "",
            statement = "",
            ["template argument"] = "",
          },
          kind_icons = {
            Compound = "",
            Recovery = "",
            TranslationUnit = "",
            PackExpansion = "",
            TemplateTypeParm = "",
            TemplateTemplateParm = "",
            TemplateParamObject = "",
          },
        },
        memory_usage = {
          border = "none",
        },
        symbol_info = {
          border = "none",
        },
      })
    end,
  },

  -- Better syntax highlighting for C++
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "c", "cpp", "cmake", "make" })
      end
    end,
  },

  -- Project management
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
        detection_methods = { "lsp", "pattern" },
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "CMakeLists.txt" },
        ignore_lsp = {},
        exclude_dirs = {},
        show_hidden = false,
        silent_chdir = true,
        scope_chdir = 'global',
      })
    end,
  },

  -- Enhanced file navigation
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Add file to harpoon" })
      vim.keymap.set("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Toggle harpoon menu" })

      vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
      vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
      vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
      vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
    end,
  },

  -- Symbol outline
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    config = function()
      require("symbols-outline").setup({
        highlight_hovered_item = true,
        show_guides = true,
        auto_preview = false,
        position = 'right',
        relative_width = true,
        width = 25,
        auto_close = false,
        show_numbers = false,
        show_relative_numbers = false,
        show_symbol_details = true,
        preview_bg_highlight = 'Pmenu',
        autofold_depth = nil,
        auto_unfold_hover = true,
        fold_markers = { '', '' },
        wrap = false,
        keymaps = {
          close = {"<Esc>", "q"},
          goto_location = "<Cr>",
          focus_location = "o",
          hover_symbol = "<C-space>",
          toggle_preview = "K",
          rename_symbol = "r",
          code_actions = "a",
          fold = "h",
          unfold = "l",
          fold_all = "W",
          unfold_all = "E",
          fold_reset = "R",
        },
        lsp_blacklist = {},
        symbol_blacklist = {},
      })
    end,
  },
}
