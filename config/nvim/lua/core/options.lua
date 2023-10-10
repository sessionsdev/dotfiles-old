local opt = vim.opt




--backsups
opt.backup = false
opt.swapfile = false
opt.undofile = true
opt.undodir = vim.fn.getenv("HOME") .. "/.nvim/undodir"

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indents
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- cursorline
opt.cursorline = true
opt.guicursor = ""

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.colorcolumn = "80"
opt.scrolloff = 8

-- backspace
opt.backspace = "indent,eol,start"

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.updatetime = 50

-- netrw_banner
vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
