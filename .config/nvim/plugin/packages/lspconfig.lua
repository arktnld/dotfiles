--
--  Neovim Native Language Server
--

require'lspconfig'.pyright.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.vimls.setup{}
--[[ require'lspconfig'.golangci_lint_ls.setup{
    cmd = { "/home/arktnld/.local/share/go/bin/golangci-lint-langserver" },
} ]]
