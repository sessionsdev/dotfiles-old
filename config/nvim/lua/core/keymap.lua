function Map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

local function toggle(option, silent)
    vim.opt_local[option] = not vim.opt_local[option]:get()
    if not silent then
        vim.notify(
            (vim.opt_local[option]:get() and "Enabled" or "Disabled") .. " " .. option,
            vim.log.levels.INFO,
            { title = "Option" }
        )
    end
end

-- Move lines
Map("v", "J", ":m '>+1<CR>gv=gv")
Map("v", "K", ":m '<-2<CR>gv=gv")

--scrolling
Map("n", "<C-d>", "<C-d>zz")
Map("n", "<C-u>", "<C-u>zz")
Map("n", "n", "nzzzv")
Map("n", "N", "Nzzzv")

-- Copy to clipboard
Map("v", "<leader>y", '"+y')
Map("n", "<leader>Y", '"+yg_')
Map("n", "<leader>y", '"+y')
Map("n", "<leader>yy", '"+yy')

-- Paste from clipboard
Map("n", "<leader>p", '"+p')
Map("n", "<leader>P", '"+P')
Map("v", "<leader>p", '"+p')
Map("v", "<leader>P", '"+P')


-- Telescope/Fuzzy Finder Maps
Map("n", "<leader>fb", "<cmd> Telescope file_browser <CR>")
Map("n", "<leader>pf", "<cmd> Telescope find_files <CR>")
Map("n", "<C-p>", "<cmd> Telescope git_files <CR>")
Map("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>")
Map("n", "<leader>fs", "<cmd> Telescope live_grep <CR>")
Map("n", "<leader><leader>", "<cmd> Telescope live_grep <CR>")
Map("n", "<leader>o", "<cmd> Telescope buffers <CR>")
Map("n", "<leader>fh", "<cmd> Telescope help_tags <CR>")
Map("n", "<leader>of", "<cmd> Telescope oldfiles <CR>")
Map("n", "<leader>km", "<cmd> Telescope keymaps <CR>")

-- Buffer nav
Map("n", "<TAB>", ":bn<CR>")
Map("n", "<S-TAB>", ":bp<CR>")

-- Window Nav
Map("n", "<leader>w", "<C-w>")
Map("n", "<leader>nw", "<C-w>v")

-- better indenting
Map("v", "<", "<gv")
Map("v", ">", ">gv")

-- map for quick open the file init.lua
Map('n', '<leader>nv', ':vsplit ~/.config/nvim/init.lua<cr>')

-- Toggle options
Map("n", "<leader>tw", function() toggle("wrap") end, { desc = "Word Wrap" })

-- Undo tree
Map('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle undo tree' })

-- GIT
Map("n", "<leader>gs", vim.cmd.Git)


-- Set the lsp keymaps
local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(function(client, bufnr)
    local default_opts = { buffer = bufnr, remap = false }

    local function opts_with_desc(desc)
        return vim.tbl_extend('force', default_opts, { desc = desc })
    end

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts_with_desc('LSP - Get symbol definition'))
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts_with_desc('LSP - Get symbol hover results'))
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end,
        opts_with_desc('LSP - workspace symbols'))
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end,
        opts_with_desc('LSP - Open diagnostics'))
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts_with_desc('LSP - Go to next diagnostic'))
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end,
        opts_with_desc('LSP - Go to previous diagnostic'))
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts_with_desc('LSP - Get code actions'))
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts_with_desc('LSP - Get references'))
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts_with_desc('LSP - Rename symbol'))
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts_with_desc('LSP - Get signature help'))
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts_with_desc('LSP - Get code actions'))
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts_with_desc('LSP - Rename symbol'))
    vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format() end, opts_with_desc('LSP - Format buffer'))
end)
