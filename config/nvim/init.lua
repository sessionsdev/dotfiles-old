vim.g.mapleader = " "


require("core.init")
-- Line number colors
-- vim.api.nvim_set_hl_ns(0)  -- Use the global namespace for highlights
-- vim.api.nvim_set_hl(0, 'LineNr', {background='#000000', foreground='#ffffff'})

require('core.utilities').set_os_globals()

