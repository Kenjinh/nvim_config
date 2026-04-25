-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.g.lazyvim_python_lsp = "pyright"
vim.g.lazyvim_python_ruff = "ruff"
vim.g.lazyvim_ts_lsp = "vtsls"

local shada_dir = vim.fs.joinpath(vim.fn.stdpath("state"), "shada")
local shada_probe = vim.fs.joinpath(shada_dir, ".write-test")
pcall(vim.fn.mkdir, shada_dir, "p")
local ok, file = pcall(io.open, shada_probe, "w")
if file then
  file:close()
  os.remove(shada_probe)
end
if not ok or not file then
  vim.opt.shadafile = "NONE"
end
