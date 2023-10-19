local util = require('core.utilities')
local Map = util.map
local toggle = util.toggle_option

-- Move lines
util.map("v", "J", ":m '>+1<CR>gv=gv")
util.map("v", "K", ":m '<-2<CR>gv=gv")

--scrolling
util.map("n", "<C-d>", "<C-d>zz")
util.map("n", "<C-u>", "<C-u>zz")
util.map("n", "n", "nzzzv")
util.map("n", "N", "Nzzzv")

-- Copy to clipboard
util.map("v", "<leader>y", '"+y')
util.map("n", "<leader>Y", '"+yg_')
util.map("n", "<leader>y", '"+y')
util.map("n", "<leader>yy", '"+yy')

-- Paste from clipboard
util.map("n", "<leader>p", '"+p')
util.map("n", "<leader>P", '"+P')
util.map("v", "<leader>p", '"+p')
util.map("v", "<leader>P", '"+P')

-- Buffer nav
util.map("n", "<TAB>", ":bn<CR>")
util.map("n", "<S-TAB>", ":bp<CR>")

-- Window Nav
util.map("n", "<leader>w", "<C-w>")
util.map("n", "<leader>nw", "<C-w>v")

-- better indenting
util.map("v", "<", "<gv")
util.map("v", ">", ">gv")

-- map for quick open the file init.lua
util.map('n', '<leader>nv', ':vsplit ~/.config/nvim/init.lua<cr>')

-- Toggle options
util.map("n", "<leader>tw", function() toggle("wrap") end, { desc = "Word Wrap" })

-- GIT
util.map("n", "<leader>gs", vim.cmd.Git)

-- Telescope/Fuzzy Finder Maps
util.map("n", "<leader>fb", "<cmd> Telescope file_browser <CR>")
util.map("n", "<leader>pf", "<cmd> Telescope find_files <CR>")
util.map("n", "<C-p>", "<cmd> Telescope git_files <CR>")
util.map("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>")
util.map("n", "<leader>fs", "<cmd> Telescope live_grep <CR>")
util.map("n", "<leader><leader>", "<cmd> Telescope live_grep <CR>")
util.map("n", "<leader>o", "<cmd> Telescope buffers <CR>")
util.map("n", "<leader>fh", "<cmd> Telescope help_tags <CR>")
util.map("n", "<leader>of", "<cmd> Telescope oldfiles <CR>")
util.map("n", "<leader>km", "<cmd> Telescope keymaps <CR>")


-- LSP KeyMaps

local lspZeroOnAttach = function(client, bufnr)
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
end

local lsp_zero = require('lsp-zero')
lsp_zero.on_attach(lspZeroOnAttach)


-- undo tree
util.map('n', '<leader>u', vim.cmd.UndotreeToggle, { desc = 'Toggle undo tree' })