-- General purpose linters
return {
  -- https://github.com/mfussenegger/nvim-lint
  "mfussenegger/nvim-lint",
  event = "BufWritePost",
  config = function()
    -- Define a table of linters for each filetype (not extension).
    -- Additional linters can be found here: https://github.com/mfussenegger/nvim-lint#available-linters
    local lint = require("lint")

    local function has(cmd)
      return vim.fn.executable(cmd) == 1
    end

    local python_linters = {}
    for _, linter in ipairs({ "ruff", "mypy" }) do
      if has(linter) then
        table.insert(python_linters, linter)
      end
    end

    lint.linters_by_ft = {
      python = python_linters,
    }

    -- Automatically run linters after saving.  Use "InsertLeave" for more aggressive linting.
    vim.api.nvim_create_autocmd({ "BufWritePost" }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
