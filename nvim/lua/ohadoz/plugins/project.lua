return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      -- Detection methods
      detection_methods = { "lsp", "pattern" },
      
      -- Patterns to detect project root
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", "CMakeLists.txt", "compile_commands.json" },
      
      -- Don't calculate root dir on every buffer change
      ignore_lsp = {},
      
      -- Don't show hidden files in telescope
      show_hidden = false,
      
      -- When set to false, you will get a message when project.nvim changes your directory.
      silent_chdir = true,
      
      -- What scope to change the directory
      scope_chdir = 'global',
      
      -- Path where project.nvim will store the project history for use in telescope
      datapath = vim.fn.stdpath("data"),
    })
    
    -- Telescope integration
    require('telescope').load_extension('projects')
  end,
  keys = {
    {"<leader>fp", "<cmd>Telescope projects<cr>", desc = "Find projects"},
  },
}