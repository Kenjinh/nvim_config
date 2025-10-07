-- LSP Support
return {
  -- LSP Configuration
  -- https://github.com/neovim/nvim-lspconfig
  "neovim/nvim-lspconfig",
  event = "VeryLazy",
  dependencies = {
    { "mason-org/mason.nvim" },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        automatic_enable = false,
        ensure_installed = {
          -- formatters
          -- "prettier", -- install manually with 'npm i -g prettier'
          -- "stylua", -- install manually with ':MasonInstall stylua'

          -- LSPs
          "ruff",
          "taplo",
          "lua_ls",
          "ts_ls",
          "pyright",
          "tailwindcss",
        },
      },
    },
    { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    { "j-hui/fidget.nvim", opts = {} },
    {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
}
