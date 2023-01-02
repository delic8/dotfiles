vim.g.nvim_tree_width =2
vim.g.nvim_tree_indent_markers = 1 
vim.g.nvim_tree_respect_buf_cwd = 1
require('nvim-tree').setup({
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  auto_open = 1,
  auto_close = 1,
  gitignore = 1,
  view = {
    width = 28,
  }
})
