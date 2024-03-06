local plugins = {
    -- deps
    'nvim-lua/plenary.nvim',

    -- colorscheme
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = require('core.plugins.catppuccin').configure
    },
    "EdenEast/nightfox.nvim",

    -- treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = require('core.plugins.treesitter').build_with_sync,
        config = require('core.plugins.treesitter').configure
    },

    -- LSP And Completions
    'L3MON4D3/LuaSnip',
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'neovim/nvim-lspconfig',
    { 'VonHeikemen/lsp-zero.nvim',   branch = 'v3.x', lazy = false },
    'mfussenegger/nvim-jdtls', -- java lsp
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- CoPilot
    'github/copilot.vim',

    -- icons
    { 'nvim-tree/nvim-web-devicons', opt = true },

    -- git
    'tpope/vim-fugitive',

    -- editor
    { "mhinz/vim-startify", init = require('core.plugins.startify').initialize },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, -- indent guide
    { "nvim-lualine/lualine.nvim", config = require('core.plugins.lualine').configure },

    -- Telescope
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    "nvim-telescope/telescope-file-browser.nvim",
    { 'nvim-telescope/telescope.nvim', tag = '0.1.3', config = require('core.plugins.telescope').configure },

    -- OIL
    { 'stevearc/oil.nvim', opts = {}, config = require('core.plugins.oil').configure },

    -- Obsidian 
    -- { "epwalsh/obsidian.nvim", opts = require('core.plugins.obsidian').opts },

    --undo tree
    'mbbill/undotree',

    -- nonsense
    'ThePrimeagen/vim-be-good'
}


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(plugins)
