M = {}

M.map = function(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

M.toggle_option = function(option, silent)
    vim.opt_local[option] = not vim.opt_local[option]:get()
    if not silent then
        vim.notify(
            (vim.opt_local[option]:get() and "Enabled" or "Disabled") .. " " .. option,
            vim.log.levels.INFO,
            { title = "Option" }
        )
    end
end

M.set_os_globals = function()
    -- Default values
    vim.g.is_win = false
    vim.g.is_linux = false
    vim.g.is_mac = false

    -- Determine the platform
    local os_name = vim.loop.os_uname().sysname

    if os_name == "Windows_NT" then
        vim.g.is_win = true
        print("Detected OS: Windows")
    elseif os_name == "Linux" then
        vim.g.is_linux = true
        print("Detected OS: Linux")
    elseif os_name == "Darwin" then
        vim.g.is_mac = true
        print("Detected OS: macOS")
    else
        print("Detected OS: Unknown")
    end
end

M.get_knowledge_vault_path = function()
    local vault_path = vim.fn.getenv("OBSIDIAN_VAULT_PATH")
    if vault_path == "" or vault_path == nil then
    print("Vault Path Is Null")
        return "./arca"
    end

    local is_dir = vim.fn.is_dir(vault_path)
    if is_dir == 1 then
        print("VAULT_PATH: " .. vault_path)
        return vault_path
    end

    return "./arca"
end

return M
