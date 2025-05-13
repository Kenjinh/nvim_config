-- Dracula Theme
-- https://github.com/Mofiqul/dracula.nvim
--  Mofiqul/dracula.nvim
return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    opts = { transparent = true },
  },
  -- best theme ever
  {
    "catppuccin/nvim",
  },
  -- Enable transparent mode
  { "rose-pine/neovim", name = "rose-pine" },
  { "folke/tokyonight.nvim", name = "tokyonight", opts = { transparent = true } },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "dracula",
      -- colorscheme = "catppuccin-frappe",
      -- colorscheme = "rose-pine-moon",
      -- colorscheme = "tokyonight",
    },
  },
}
