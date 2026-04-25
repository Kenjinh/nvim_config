return {
  {
    "supermaven-inc/supermaven-nvim",
    event = "InsertEnter",
    cond = function()
      local log_path = vim.fs.joinpath(vim.fn.stdpath("cache"), "supermaven-nvim.log")
      local ok, file = pcall(io.open, log_path, "a")
      if file then
        file:close()
      end
      return ok and file ~= nil
    end,
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<c-a>",
          clear_suggestion = "<c-x>",
          accept_word = "<c-q>",
        },
        ignore_filetypes = { cpp = true },
        color = {
          suggestion_color = "#FFC0CB",

          cterm = 244,
        },
      })
    end,
  },
}
