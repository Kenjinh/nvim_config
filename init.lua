-- bootstrap lazy.nvim, LazyVim and your plugins
vim.filetype.add({
  extension = {
    mdx = "mdx",
  },
})
require("config.options")
require("config.lazy")
