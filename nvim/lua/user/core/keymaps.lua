-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

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
keymap.set("n", "<C-S-Left>", "<C-w>h", { desc = "Move to left window" })
keymap.set("n", "<C-S-Down>", "<C-w>j", { desc = "Move to window below" })
keymap.set("n", "<C-S-Up>", "<C-w>k", { desc = "Move to window above" })
keymap.set("n", "<C-S-Right>", "<C-w>l", { desc = "Move to right window" })

-- tab navigation with arrow keys
keymap.set("n", "<C-Left>", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<C-Right>", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tc", "<cmd>tabnew<CR><cmd>NvimTreeOpen<CR>", { desc = "Create new tab with tree" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
