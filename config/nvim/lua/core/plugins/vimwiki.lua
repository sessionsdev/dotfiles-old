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
    vim.g.vimwiki_key_mappings = {
        all_maps = 1,
        global = 0,
        headers = 1,
        table_format = 1,
        table_mappings = 1,
        lists = 1,
        links = 1,
        html = 1,
    }
end

return VIMWIKI_MODULE
