-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local function map(mode, lhs, rhs, opts)
  local keys = require("lazy.core.handler").handlers.keys
  ---@cast keys LazyKeysHandler
  -- do not create the keymap if a lazy keys handler exists
  if not keys.active[keys.parse({ lhs, mode = mode }).id] then
    opts = opts or {}
    opts.silent = opts.silent ~= false
    if opts.remap and not vim.g.vscode then
      opts.remap = nil
    end
    vim.keymap.set(mode, lhs, rhs, opts)
  end
end

-- Neo-tree
map("n", "<leader>E", "<cmd>Neotree toggle buffers<cr>", { desc = "Toggle Buffers Explorer" })

-- Telescope
map("n", "<C-p>", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fw", "<cmd>Telescope live_grep<cr>")
map("n", "<leader>fa", "<cmd>Telescope live_grep_args<cr>")
map("n", "<leader>fx", "<cmd>Telescope find_files find_command=rg,--ignore,--hidden,--files,--glob=.env<cr>")

-- Tranparent
map("n", "<leader>uT", "<cmd>TransparentEnable<cr>", { desc = "Enable background transparency" })
map("n", "<leader>ut", "<cmd>TransparentToggle<cr>", { desc = "Toggle background transparency" })

-- mini.nvim
map("n", "<leader>C", function()
  require("mini.bufremove").delete(0, false)
end, { desc = "Delete Buffer" })

-- some utilities
map("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and Replace RegExp" })
map("n", "tn", "<cmd>tabnew<cr>")
map("n", "<leader>n", "<cmd>noh<cr>", { desc = "Remove highlighting of search matches" })

-- utilities to center the screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
-- Go to end current line
map("n", "9", "$")

-- visual
map("v", "p", '"_dP')
map("v", "<", "<gv")
map("v", ">", ">gv")

map("i", "jk", "<esc>")
map("v", "jk", "<esc>")

local function toggle_root_terminal()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end

vim.defer_fn(function()
  vim.keymap.set({ "n", "t" }, "<C-/>", toggle_root_terminal, { desc = "Terminal (Root Dir)", silent = true })
  vim.keymap.set({ "n", "t" }, "<C-_>", toggle_root_terminal, { desc = "Terminal (Root Dir)", silent = true })
  vim.keymap.set("t", "<leader>T", [[<C-\><C-N>:q!<CR>]], { desc = "Close Terminal", silent = true })
end, 100)

map("n", "<M-C-W>", ":w<CR>")

map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
map("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>")

-- Vim Rest Console
map("n", "<leader>xr", ":call VrcQuery()<CR>")
