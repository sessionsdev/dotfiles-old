local lspconfig = require('lspconfig')
local cmd_path = vim.fn.getenv("OCAMLLSP_PATH")

-- Ensure cmd_path is a valid string
if not cmd_path or cmd_path == "" then
    print("Error: OCAMLLSP_PATH is not set or is empty!")
    return
end

lspconfig.ocamllsp.setup {
    cmd = { cmd_path },
    root_dir = lspconfig.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
    filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
    log_level = vim.lsp.protocol.MessageType.Log,
    log_file = "/tmp/nvim-lsp.log",
}
