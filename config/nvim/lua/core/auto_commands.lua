vim.cmd [[
augroup MyWikiAutocmds
    autocmd!
    autocmd User WikiBufferInitialized lua require'core.keymap'.map_wiki_keys()
augroup END
]]