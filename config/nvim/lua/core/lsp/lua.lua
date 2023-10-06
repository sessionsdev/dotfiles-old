local lsp_zero = require('lsp-zero')  -- If lsp_zero is needed

local M = {}

M.setup = function()
    local lua_opts = lsp_zero.nvim_lua_ls()
    require('lspconfig').lua_ls.setup(lua_opts)
end

return M