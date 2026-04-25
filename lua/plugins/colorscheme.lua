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
    opts = {
      transparent_background = true,
    },
  },
  -- Enable transparent mode
  { "rose-pine/neovim", name = "rose-pine", opts = { styles = { transparency = true } } },
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
  {
    "xiyaowong/transparent.nvim",
    lazy = false,
    config = function()
      local transparent = require("transparent")

      transparent.setup({
        extra_groups = {
          "NormalFloat",
          "FloatBorder",
          "FloatTitle",
          "Pmenu",
          "PmenuSel",
          "PmenuSbar",
          "PmenuThumb",
          "SignColumn",
          "StatusLine",
          "StatusLineNC",
          "TabLine",
          "TabLineFill",
          "WinBar",
          "WinBarNC",
          "WinSeparator",
          "NeoTreeNormal",
          "NeoTreeNormalNC",
          "NeoTreeEndOfBuffer",
          "NeoTreeVertSplit",
          "NeoTreeWinSeparator",
          "NeoTreeStatusLine",
          "NeoTreeStatusLineNC",
          "NvimTreeNormal",
          "NvimTreeNormalNC",
          "NvimTreeEndOfBuffer",
          "NvimTreeVertSplit",
        },
        exclude_groups = {},
      })

      vim.g.transparent_enabled = true
      transparent.clear_prefix("NeoTree")
      transparent.clear_prefix("NvimTree")
      transparent.clear_prefix("BufferLine")
      transparent.clear_prefix("lualine")
      transparent.clear()
    end,
  },
}
