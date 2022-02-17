vim.opt.termguicolors = true
vim.opt.listchars:append("eol:↴")
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#303030 gui=nocombine]]

require("indent_blankline").setup {
    space_char_blankline = " ",
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
    show_end_of_line = true,
    buftype_exclude = { 'terminal', 'nofile' },
    filetype_exclude = { 'help', 'man' },
}
