-- Enhanced <PROJECT> project configuration
return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    
    -- <PROJECT> specific keymaps using new API
    wk.add({
      { "<leader>r", group = "<PROJECT> Development" },
      { "<leader>rb", group = "Build" },
      { "<leader>rbc", "<cmd>!cd $PROJECT_ROOT/vendor/<company>/<project> && ./generate_compile_commands.sh<CR><cmd>LspRestart<CR>", desc = "Generate compile commands & restart LSP" },
      { "<leader>rbb", "<cmd>!cd $PROJECT_ROOT && make<CR>", desc = "Build <PROJECT> project" },
      { "<leader>rbt", "<cmd>!cd $PROJECT_ROOT && make test<CR>", desc = "Run tests" },
      { "<leader>rbd", "<cmd>!cd $PROJECT_ROOT && make debug<CR>", desc = "Debug build" },
      
      { "<leader>rf", group = "Find" },
      { "<leader>rff", "<cmd>Telescope find_files cwd=$PROJECT_ROOT/vendor/<company>/<project><CR>", desc = "Find files in <PROJECT>" },
      { "<leader>rfg", "<cmd>Telescope live_grep cwd=$PROJECT_ROOT/vendor/<company>/<project><CR>", desc = "Live grep in <PROJECT>" },
      { "<leader>rfs", "<cmd>Telescope lsp_document_symbols<CR>", desc = "Document symbols" },
      { "<leader>rfS", "<cmd>Telescope lsp_workspace_symbols<CR>", desc = "Workspace symbols" },
      { "<leader>rfr", "<cmd>Telescope lsp_references<CR>", desc = "Find references" },
      { "<leader>rfi", "<cmd>Telescope lsp_implementations<CR>", desc = "Find implementations" },
      { "<leader>rfd", "<cmd>Telescope lsp_definitions<CR>", desc = "Find definitions" },
      { "<leader>rft", "<cmd>Telescope lsp_type_definitions<CR>", desc = "Find type definitions" },
      { "<leader>rfc", "<cmd>Telescope lsp_incoming_calls<CR>", desc = "Incoming calls" },
      { "<leader>rfo", "<cmd>Telescope lsp_outgoing_calls<CR>", desc = "Outgoing calls" },
      
      { "<leader>rn", group = "Navigate" },
      { "<leader>rnr", "<cmd>cd $PROJECT_ROOT/vendor/<company>/<project><CR>", desc = "Go to <PROJECT> root" },
      { "<leader>rno", "<cmd>cd $PROJECT_ROOT/out<CR>", desc = "Go to build output" },
      { "<leader>rnd", "<cmd>cd $PROJECT_ROOT/vendor/<company>/<project>/drv<CR>", desc = "Go to drivers" },
      { "<leader>rna", "<cmd>cd $PROJECT_ROOT/vendor/<company>/<project>/app<CR>", desc = "Go to applications" },
      { "<leader>rnu", "<cmd>cd $PROJECT_ROOT/vendor/<company>/<project>/utz<CR>", desc = "Go to utilities" },
      { "<leader>rni", "<cmd>cd $PROJECT_ROOT/vendor/<company>/<project>/inf<CR>", desc = "Go to interfaces" },
      
      { "<leader>rd", group = "Documentation" },
      { "<leader>rdg", "<cmd>!cd $PROJECT_ROOT/vendor/<company>/<project> && ./generate_docs.sh<CR>", desc = "Generate docs" },
      { "<leader>rdo", "<cmd>!open $PROJECT_ROOT/vendor/<company>/<project>/doxygen_output/html/index.html<CR>", desc = "Open docs" },
    })

    -- Auto-commands for <PROJECT> project
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        local cwd = vim.fn.getcwd()
        if string.find(cwd, "$PROJECT_ROOT/vendor/<company>/<project>") then
          -- Set up <PROJECT> specific settings
          vim.opt.path:append("$PROJECT_ROOT/vendor/<company>/<project>/**")
          vim.opt.path:append("$PROJECT_ROOT/out/**")
          
          -- Set up include paths for better navigation
          vim.g.<project>_project = true
          
          print("🚀 <PROJECT> Development Environment Loaded")
        end
      end,
    })

    -- Auto-detect <PROJECT> files and set appropriate settings
    vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
      pattern = {"$PROJECT_ROOT/vendor/<company>/<project>/*"},
      callback = function()
        -- Set C++ specific settings for <PROJECT>
        vim.bo.commentstring = "// %s"
        vim.bo.expandtab = true
        vim.bo.shiftwidth = 4
        vim.bo.tabstop = 4
        
        -- Enable clangd for better C++ support
        vim.cmd("LspStart clangd")
      end,
    })
  end,
}