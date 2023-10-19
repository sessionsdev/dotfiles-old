return { 
    'vimwiki/vimwiki',
    init = function()
        vim.g.vimwiki_list = {
            {
                path = '~/git/arca',
                syntax = 'markdown',
                ext = '.md',
                index = '_arca'
            }
        }
    end
}
