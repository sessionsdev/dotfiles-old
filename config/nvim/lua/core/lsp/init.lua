local lsp_zero = require('lsp-zero')
lsp_zero.extend_lspconfig()

-- setup mason lspconfig and any custom handlers
require('mason-lspconfig').setup({
    ensure_installed = { 'jdtls' },
    handlers = {
        lsp_zero.default_setup,
        lua_ls = require("core.lsp.lua").setup(),
        jdtls = lsp_zero.noop,
        ocamllsp = lsp_zero.noop
    }
})

-- language server configs
require("core.lsp.java")
require("core.lsp.ocaml")



