return {
  {
    "catppuccin/nvim",
    priority = 1000, -- make sure to load this before all the other start plugins
--    config = function()

    -- load the colorscheme here
--    end,
  },
--  { 
--    "ellisonleao/gruvbox.nvim", 
--    priority = 1000 ,
--    config = function() 
--    vim.cmd([[colorscheme gruvbox]])
--  end,
--  },
  { 
    "savq/melange-nvim", 
     priority = 1000,
    config = function() 
    vim.cmd([[colorscheme melange]])
    end,
  },
--  vim.cmd([[colorscheme catppuccin]])
--  vim.cmd([[colorscheme melange]])

}
