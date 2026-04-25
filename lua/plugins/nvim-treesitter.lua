-- Code Tree Support / Syntax Highlighting
return {
  {
    -- https://github.com/nvim-treesitter/nvim-treesitter
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      local parsers = {
        "bash",
        "css",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      }

      local tree_sitter_ok = false
      local ok, result = pcall(function()
        return vim.system({ "tree-sitter", "--version" }, { text = true }):wait()
      end)
      tree_sitter_ok = ok and result and result.code == 0

      opts.ensure_installed = tree_sitter_ok and parsers or {}

      opts.highlight = vim.tbl_deep_extend("force", opts.highlight or {}, {
        enable = true,
        disable = {},
      })
      opts.indent = vim.tbl_deep_extend("force", opts.indent or {}, {
        enable = true,
        disable = { "python", "yaml" },
      })
      opts.folds = vim.tbl_deep_extend("force", opts.folds or {}, {
        enable = false,
      })
    end,
  },
}
