return {
  "smjonas/inc-rename.nvim",
  cmd = "IncRename",
  config = function()
    require("inc_rename").setup()
    
    -- Override the default LSP rename keymap
    vim.keymap.set("n", "<leader>rn", function()
      return ":IncRename " .. vim.fn.expand("<cword>")
    end, { expr = true, desc = "Incremental rename" })
  end,
}