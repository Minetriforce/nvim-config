vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.wo.number = true
vim.o.cursorline = true
-- vim.o.clipboard = "unnamedplus"

vim.keymap.set(
    'n',
    '<leader>vt',
    [[<cmd>rightbelow vsplit | term<cr>A]],
    { desc = 'Open terminal in vertical split' }
)
vim.keymap.set(
    'n',
    '<leader>ht',
    [[<cmd>belowright split | term<cr>A]],
    { desc = 'Open terminal in horizontal split' }
)
vim.keymap.set(
    't',
    'jk',
    '<C-\\><C-n>',
    { desc = 'Use jk to enter in terminal normal mode' }
)

-- Copy from system clipboard
vim.keymap.set(
    { 'n', 'x' },
    '<C-c>', '"+y'
)

