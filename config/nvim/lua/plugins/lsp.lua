return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = false
  },

  {
    'neovim/nvim-lspconfig',
    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp' },
    }
  },
  {
    'williamboman/mason.nvim',
    config = function()
        require('mason').setup({})
    end
  },
  { 'williamboman/mason-lspconfig.nvim' },
}
