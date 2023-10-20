local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

-- setup mason lspconfig and any custom handlers
require('mason').setup({})

require('mason-lspconfig').setup({
   --  ensure_installed = { 'jdtls' },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = require("core.lsp.lua").setup(),
        jdtls = lsp_zero.noop,
        ocamllsp = lsp_zero.noop
    }
})


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    sources = {
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'nvim_lua' },
        { name = 'buffer' },
        { name = 'copilot' }
    },
    formatting = lsp_zero.cmp_format(),
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
})

-- language server configs
require("core.lsp.java")
require("core.lsp.ocaml")



