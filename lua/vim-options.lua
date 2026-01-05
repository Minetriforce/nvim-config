vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")
vim.g.mapleader = " "
vim.wo.number = true
vim.o.cursorline = true
-- vim.o.clipboard = "unnamedplus"

-- Affiche les diagnostics sur la ligne
vim.diagnostic.config({
    virtual_text = true,
})

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

-- Enleve le surlignage de la recherche
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- Permet de suppr le mot où on est en mode normal avec Ctrl + suppr
vim.keymap.set("i", "<C-BS>", "<C-o>diw", { desc = "Delete inner word" })

-- vim.keymap.set(
--     'n',
--     '<leader>dt', 
--     function()
--         if vim.diagnostic.is_enabled() then
--             vim.diagnostic.disable()
--         else
--             vim.diagnostic.enable()
--         end
--     end,
    -- { desc = 'Toogle diagnostics' })
