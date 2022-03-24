--
--  Neovim Native Language Server
--

local custom_lsp_attach = function(client)
    -- See `:help nvim_buf_set_keymap()` for more information
    vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
    -- vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
    vim.api.nvim_buf_set_keymap(0, 'i', '<tab>', '<C-x><C-o>', {noremap = true})

    --[[ local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(0, 'n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts) ]]

    -- ... and other keymappings for LSP

    -- Use LSP as the handler for omnifunc.
    --    See `:help omnifunc` and `:help ins-completion` for more information.
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Use LSP as the handler for formatexpr.
    --    See `:help formatexpr` for more information.
    vim.api.nvim_buf_set_option(0, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')

    -- For plugins with an `on_attach` callback, call them here. For example:
    -- require('completion').on_attach()
end

--[[ require'lspconfig'.pyright.setup{
    on_attach = custom_lsp_attach
}
require'lspconfig'.bashls.setup{
    on_attach = custom_lsp_attach
}
require'lspconfig'.vimls.setup{
    on_attach = custom_lsp_attach
} ]]
--[[ require'lspconfig'.golangci_lint_ls.setup{
    cmd = { "/home/arktnld/.local/share/go/bin/golangci-lint-langserver" },
} ]]

local servers = {'gopls', 'pyright', 'bashls', 'vimls'}
for _, lsp in pairs(servers) do
  require'lspconfig'[lsp].setup {
    on_attach = custom_lsp_attach
  }
end


require'lspconfig'.ltex.setup{
    filetypes = { "bib", "gitcommit", "markdown", "org", "plaintex", "rst", "rnoweb", "tex" },
}

