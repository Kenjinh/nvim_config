-- LSP Support
return {
  {
    -- LSP Configuration
    -- https://github.com/neovim/nvim-lspconfig
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      local servers = {
        "bashls",
        "cssls",
        "html",
        "lua_ls",
        "jsonls",
        "marksman",
        "yamlls",
        "pyright",
      }

      opts.servers = opts.servers or {}
      for _, server in ipairs(servers) do
        opts.servers[server] = opts.servers[server] or {}
      end

      opts.servers.lua_ls = vim.tbl_deep_extend("force", opts.servers.lua_ls or {}, {
        settings = {
          Lua = {
            diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = { "vim" },
            },
          },
        },
      })
    end,
  },

  {
    -- https://github.com/j-hui/fidget.nvim
    "j-hui/fidget.nvim",
    opts = {},
  },

  {
    -- https://github.com/mason-org/mason.nvim
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = {}
    end,
  },

  {
    "neovim/nvim-lspconfig",
    init = function()
      -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
      local open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or "rounded"
        return open_floating_preview(contents, syntax, opts, ...)
      end
    end,
  },
}
