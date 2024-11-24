-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'


  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    "catppuccin/nvim",
    as = "catppuccin",
    config = function()
      vim.cmd('colorscheme catppuccin-mocha')
    end
  }

  use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
  use('nvim-treesitter/playground')

  use('nvim-lua/plenary.nvim')
  use('ThePrimeagen/harpoon')

  use('mbbill/undotree')
  use('tpope/vim-fugitive')

  use({ 'VonHeikemen/lsp-zero.nvim', branch = 'v4.x' })
  use({ 'neovim/nvim-lspconfig' })
  use({ 'hrsh7th/nvim-cmp' })
  use({ 'hrsh7th/cmp-nvim-lsp' })

  use {
    'prettier/vim-prettier',
    run = 'yarn install --frozen-lockfile --production',
    ft = { 'javascript', 'typescript', 'css', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html' }
  }

  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  }

  use('github/copilot.vim')

  use { 'mistricky/codesnap.nvim', run = 'make' }

  use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use('tjdevries/train.nvim')
end)
