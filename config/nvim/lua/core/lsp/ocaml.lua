local lspconfig = require('lspconfig')

lspconfig.ocamllsp.setup {
    cmd = { "/Users/jonathansessions/.opam/default/bin/ocamllsp" },
    root_dir = lspconfig.util.root_pattern("*.opam", "esy.json", "package.json", ".git", "dune-project", "dune-workspace"),
    filetypes = { "ocaml", "ocaml.menhir", "ocaml.interface", "ocaml.ocamllex", "reason", "dune" },
    log_level = vim.lsp.protocol.MessageType.Log,
    log_file = "/tmp/nvim-lsp.log",
}