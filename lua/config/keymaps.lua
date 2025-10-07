-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- some utilities
local map = vim.keymap.set
-- Neo-tree
map(
  "n",
  "<leader>E",
  "<cmd>Neotree toggle buffers<cr>",
  { desc = "Toggle Buffers Explorer" }
)

-- Telescope
map("n", "<C-p>", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fa", "<cmd>Telescope live_grep_args<cr>")
map(
  "n",
  "<leader>fx",
  "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,--glob=.env<cr>"
)

map(
  "n",
  "<leader>r",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Search and Replace RegExp" }
)

-- utilities to center the screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
-- Go to end current line
map("n", "9", "$")

-- visual
map("v", "p", '"_dP')
map("v", "<", "<gv")
map("v", ">", ">gv")

map("i", "jk", "<esc>")
map("v", "jk", "<esc>")

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
