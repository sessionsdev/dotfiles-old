TELESCOPE_MODULE = {}

local file_browser = {
    -- theme = "ivy",
    layout_config = {
        horizontal = {
            --   prompt_position = "top",
            preview_width = 0.5,
        },
    },
    sorting_strategy = "ascending",
    -- disables netrw and use telescope-file-browser in its place
    hijack_netrw = true,
    -- mappings = {
    --   ["i"] = {
    --     -- your custom insert mode mappings
    --   },
    --   ["n"] = {
    --     -- your custom normal mode mappings
    --   },
    -- },
    depth = 1,
    -- auto_depth = 3,
    select_buffer = true,
    hidden = true,
    prompt_path = true,
    grouped = true,
}

local fzf = {
    fuzzy = true,                   -- false will only do exact matching
    override_generic_sorter = true, -- override the generic sorter
    override_file_sorter = true,    -- override the file sorter
    case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
    -- the default case_mode is "smart_case"
}

TELESCOPE_MODULE.configure = function()
    require("telescope").setup {
        defaults = {
            theme = "center",
            sorting_strategy = "ascending",

        },

        extensions = {
            file_browser = file_browser,
            fzf = fzf,
        },
        
    }
    -- To get telescope-file-browser loaded and working with telescope,
    -- you need to call load_extension, somewhere after setup function:
    require("telescope").load_extension "file_browser"
    require("telescope").load_extension "fzf"
end

return TELESCOPE_MODULE


