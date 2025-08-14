return {
    {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
     
    local builtin = require("telescope.builtin")
    
    --Fichiers et recherhces
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

    -- LSP avec Telescope
    vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, { desc = "Go to Definition (Telescope)" })
    vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = 'Go to References (Telescope)' })
    vim.keymap.set('n', 'gi', builtin.lsp_implementations, { desc = 'Go to Implementation (Telescope)' })
    -- vim.keymap.set('n', 'gt', builtin.lsp_type_definitions, { desc = 'Go to Type Definition (Telescope)' })
    -- vim.keymap.set('n', '<leader>ds', builtin.lsp_document_symbols, { desc = 'Document Symbols (Telescope)' })
    -- vim.keymap.set('n', '<leader>ws', builtin.lsp_workspace_symbols, { desc = 'Workspace Symbols (Telescope)' })
    -- vim.keymap.set('n', '<leader>ca', builtin.lsp_code_actions, { desc = 'Code Actions (Telescope)' })
    vim.keymap.set('n', '<leader>di', builtin.diagnostics, { desc = 'Diagnostics (Telescope)' })

    -- Déplacements + Raccourcis
    vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Keymaps (Telescope)' })
    vim.keymap.set('n', '<leader>fj', builtin.jumplist, { desc = 'Jump List (Telescope)' })
    vim.keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Marks (Telescope)' })
    vim.keymap.set('n', '<leader>fr', builtin.registers, { desc = 'Registers (Telescope)' })
    vim.keymap.set('n', '<leader>fq', builtin.quickfix, { desc = 'Quickfix (Telescope)' })
    vim.keymap.set('n', '<leader>fl', builtin.loclist, { desc = 'Location List (Telescope)' })
    end
    },
    {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
        require("telescope").setup({
            extensions = {
            ["ui-select"] = {
                 require("telescope.themes").get_dropdown {}
                }
            }
        })
        require("telescope").load_extension("ui-select")
    end
    },
    {
      'nvim-telescope/telescope-project.nvim',
      dependencies = { 'nvim-telescope/telescope.nvim' },
      config = function()
        require("telescope").setup({
                extensions = {project = {}}
            })
        require("telescope").load_extension("project")
      end
    }
}
