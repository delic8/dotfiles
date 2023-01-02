local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
end
vim.api.nvim_command('packadd packer.nvim')
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

local function get_setup(name)
  return string.format("require('setup/%s')", name)
end

return require('packer').startup({ function(use) use({'wbthomason/packer.nvim'})
  -- Theme --
  use({ 'rose-pine/neovim', as = 'rose-pine', config = get_setup('rosepine')})
  use({ "nathom/filetype.nvim", config = get_setup("filetype") })
  use({ "EdenEast/nightfox.nvim", config = get_setup("nightfox") })
  -- Line --
  -- use({'nvim-lualine/lualine.nvim', requires = {'kyazdani42/nvim-web-devicons', opt = true}, config = get_setup('lualine')})
  use({'akinsho/bufferline.nvim', requires = 'kyazdani43/nvim-web-devicons', config = get_setup('bufferline')})
  -- Git --
  use({'lewis6991/gitsigns.nvim', config = get_setup('gitsigns')})
  -- Vim Util --
  use({'goolord/alpha-nvim', requires = {'kyazdani42/nvim-web-devicons'}, config = get_setup('alpha')})
  use({'akinsho/toggleterm.nvim', config = get_setup('toggleterm')})
  use({'terryma/vim-multiple-cursors'})
  -- Explorer --
  use({'kyazdani42/nvim-tree.lua', requires = {'kyazdani42/nvim-web-devicons', opt = true}, config = get_setup('tree') })
  use({'folke/which-key.nvim', config = get_setup('whichkey')})
  use({
    'nvim-telescope/telescope.nvim',
    module = 'telescope',
    cmd = 'Telescope',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      -- { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }, replace 'rg' need test
      {'nvim-telescope/telescope-media-files.nvim'},
      {'nvim-telescope/telescope-project.nvim'},
    },
    config = get_setup('telescope'),
  })
  -- Treesitter && Code Util--
  -- use({'nvim-treesitter/nvim-treesitter', config = get_setup('treesitter'), run = ':TSUpdate'})
  use({'windwp/nvim-ts-autotag'})
  use({'p00f/nvim-ts-rainbow'})
  use({'windwp/nvim-autopairs', config = get_setup('autopairs')})
  use({'lukas-reineke/indent-blankline.nvim', config = get_setup('blankline'), event = 'BufRead'})
  use({'norcalli/nvim-colorizer.lua', config = get_setup('colorizer')})
  use({'numToStr/Comment.nvim', opt = true, keys = { 'gc', 'gcc' }, config = get_setup('comment')})
  -- use({'lukas-reineke/format.nvim', config = get_setup('format')})
  -- LSP --
  use({
    'neovim/nvim-lspconfig',
    config = get_setup('lsp'),
    requires = {
      {'williamboman/nvim-lsp-installer'}, -- simple to use language server installer
      {'tamago324/nlsp-settings.nvim'}, -- language server settings defined in json for
      {'tami5/lspsaga.nvim'}, -- highlight and dignostic better ui
    },
  })
  -- CMP --
  use({
    'hrsh7th/nvim-cmp', -- The completion plugin
    requires = {
      {'hrsh7th/cmp-nvim-lsp'}, -- cmp with lsp engine
      {'hrsh7th/cmp-nvim-lua'}, -- what?
      {'hrsh7th/cmp-buffer'}, -- typing buffer
      {'hrsh7th/cmp-path'}, -- path completion
      {'hrsh7th/cmp-cmdline'}, -- cmdline completion
      {'hrsh7th/vim-vsnip'}, -- vim snippet completion
      {'hrsh7th/cmp-vsnip'}, -- vscode sinppet completion
      {'hrsh7th/vim-vsnip-integ'}, -- vscode sinpet tag
      {'onsails/lspkind-nvim'}, -- vscode pictogram lsp kind
      {'f3fora/cmp-spell', {'hrsh7th/cmp-calc'}, {'hrsh7th/cmp-emoji'} }, -- check spell
    },
  })
end
})

