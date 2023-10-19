VIMWIKI_MODULE = {}

VIMWIKI_MODULE.initialize = function()
    vim.g.vimwiki_list = {
        {
            path = '~/git/arca',
            syntax = 'markdown',
            ext = '.md',
            index = '_arca'
        }
    }
end

return VIMWIKI_MODULE