
-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- Helper function to map keys
local map = function(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end



-- Window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move left" })
map("n", "<C-j>", "<C-w>j", { desc = "Move down" })
map("n", "<C-k>", "<C-w>k", { desc = "Move up" })
map("n", "<C-l>", "<C-w>l", { desc = "Move right" })

-- Split resizing
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Insert mode mappings
map("i", "jk", "<Esc>", { desc = "Quick escape from insert mode" })

-- Maintain selection when shifting blocks
map("x", ">", ">gv")
map("x", "<", "<gv")

map("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Tree" })

