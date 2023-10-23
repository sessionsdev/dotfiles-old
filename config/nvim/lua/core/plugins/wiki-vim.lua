WIKIVIM_MODULE = {}

WIKIVIM_MODULE.initialize = function()
    local vault_path = vim.fn.getenv("ARCA_PATH")
    vim.g.wiki_index_name = '_arca'
    vim.g.wiki_root = vault_path
    vim.g.wiki_journal = {
        name = 'journal',
        frequency = 'daily',
        date_format = {
            daily = '%Y/%m/%Y-%m-%d',
            weekly = '%Y/%Y-W%V'
        }
    }
    vim.g.wiki_mappings_use_defaults = 'none'
    vim.g.wiki_link_transform_on_follow = 0
end

return WIKIVIM_MODULE
