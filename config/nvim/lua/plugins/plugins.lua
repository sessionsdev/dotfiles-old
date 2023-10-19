return {
    -- deps
    'nvim-lua/plenary.nvim',

    -- colorscheme
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
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x', lazy = false},
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
    {"mhinz/vim-startify", init = require('core.plugins.startify').initialize},
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} }, -- indent guide
    {"nvim-lualine/lualine.nvim", config = require('core.plugins.lualine').configure},

    -- Telescope
    {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'},
    "nvim-telescope/telescope-file-browser.nvim",
    {'nvim-telescope/telescope.nvim', tag = '0.1.3', config = require('core.plugins.telescope').configure},

    -- Obsidian and Wiki
    {"epwalsh/obsidian.nvim", opts = require('core.plugins.obsidian').opts},
    {'vimwiki/vimwiki', init = require('core.plugins.vimwiki').initialize},

    --undo tree
    'mbbill/undotree',

    -- nonsense
    'ThePrimeagen/vim-be-good'
}