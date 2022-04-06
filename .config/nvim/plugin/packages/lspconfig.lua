--
--  Neovim Native Language Server
--

local custom_lsp_attach = function(client)

    if client.resolved_capabilities.document_highlight then
        vim.cmd('autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()')
        vim.cmd('autocmd CursorHoldI <buffer> lua vim.lsp.buf.document_highlight()')
        vim.cmd('autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()')
    end

    -- See `:help nvim_buf_set_keymap()` for more information
    vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
    -- vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
    vim.api.nvim_set_keymap('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
    vim.api.nvim_set_keymap('i', '<tab>', '<C-x><C-o>', {noremap = true})

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


local fn = vim.fn
local diagnostic = vim.diagnostic

diagnostic.config({
  virtual_text = false,
  severity_sort = true,
})

local sign_char = '│' -- U+2022 BULLET
fn.sign_define('DiagnosticSignError', {
  text = sign_char,
  texthl = 'DiagnosticSignError',
})
fn.sign_define('DiagnosticSignWarn', {
  text = sign_char,
  texthl = 'DiagnosticSignWarn',
})
fn.sign_define('DiagnosticSignInfo', {
  text = sign_char,
  texthl = 'DiagnosticSignInfo',
})
fn.sign_define('DiagnosticSignHint', {
  text = sign_char,
  texthl = 'DiagnosticSignHint',
})

vim.api.nvim_set_keymap(
'n',
'<Leader>l',
'<Cmd>lua vim.diagnostic.open_float(0, { source = "always", scope = "line", header = false, width = 55 })<CR>',
{ silent = true }
)


