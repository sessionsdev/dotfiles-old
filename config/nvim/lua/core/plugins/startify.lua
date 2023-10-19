M = {}

M.initialize = function()
    local g = vim.g

    g.startify_custom_header = 'startify#pad(startify#fortune#cowsay())'
    g.webdevicons_enable_startify = 1
    g.startify_enable_special = 1
    g.startify_session_autoload = 1
    g.startify_session_delete_buffers = 1
    g.startify_change_to_vcs_root = 1
    g.startify_fortune_use_unicode = 1
    g.startify_session_persistence = 1

    g.startify_lists = {
        { type = 'files',     header = { '   Recent Files' } },
        { type = 'dir',       header = { '   Current Directory ' .. vim.fn.getcwd() .. ':' } },
        { type = 'bookmarks', header = { '   Bookmarks' } },
        { type = 'commands',  header = { '   Commands' } },
    }

    g.startify_bookmarks = {
        { i = '~/git/dotfiles/config/nvim/init.lua' },
    }

    g.startify_commands = {
        { h = ':help reference' }
    }
end

return M