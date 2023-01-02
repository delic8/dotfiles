local function map(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = ' '
-- ### Default --
-- files
map('n', '<c-s>', ':w<CR>')
map('i', '<c-s>', '<Esc>:w<CR>')

-- buffer
map("n", "<Tab>n", ":bnext<CR>")
map("n", "<Tab>p", ":bprevious<CR>")
map("n", "<Tab>q", ":bp <BAR> bd #<Enter>")

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", { silent = true })
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi<Esc>", { silent = true })
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi<Esc>", { silent = true })
map("x", "a", "<Esc>ggVG<c-$>")

-- ### Plugins --
-- nvim-tree
map("n", "<c-e>", ":NvimTreeToggle<CR>", { silent = true })
map("n", "<c-f>", ":NvimTreeFindFile<CR>", { silent = true })
