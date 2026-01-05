return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "williamboman/mason-lspconfig.nvim", -- setup des lsp qui n'ont pas de config
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "pyright", "marksman", "bashls", "clangd" }
            })
        end
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim", 
        config = function()
            require("mason-tool-installer").setup({
                ensure_installed = {
                    -- LSP servers qui ont besoin de config 
                    -- "lua_ls",
                    -- "pyright", 
                    -- "marksman",
                    -- "jdtls",
                    
                    -- Formateurs installés automatiquement, cf conform.lua pr les utiliser par fichier
                    "stylua",      -- Lua formatter
                    "black",       -- Python formatter
                    "isort",       -- Python import sorter
                    "clang-format",-- C formatter
                    "prettier",    -- JS/TS/JSON/YAML/MD formatter
                    "prettierd",   -- idem mais meilleure perf
                    "google-java-format", -- Java formatter
                    
                    -- Linters (optionnel)
                    -- "luacheck",    -- Lua linter
                    "flake8",      -- Python linter
                },
                auto_update = false,
                run_on_start = true,  -- Installe automatiquement au démarrage
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            -- lspconfig.lua_ls.setup({})

            -- Configuration pour Python
            -- lspconfig.pyright.setup({})

            -- Configuration pour Markdown
            -- lspconfig.marksman.setup({})

            -- Configuration pour Markdown
            -- lspconfig.clangd.setup({})
            
            -- Configuration pour Bash
            -- lspconfig.bashls.setup({})
            lspconfig.bashls.setup({
                filetypes = { "sh", "bash", "zsh", "bashrc" },
                single_file_support = true,
                settings = {
                    bashIde = {
                        globPattern = "*@(.sh|.inc|.bash|.command)"
                    }
                }
            })


            -- Configuration pour Java (jdtls)
            lspconfig.jdtls.setup({
                cmd = {
                    'jdtls',
                    '--jvm-arg=-javaagent:' .. vim.fn.expand('~/.local/share/nvim/mason/packages/jdtls/lombok.jar'),
                },
                root_dir = function(fname)
                    return lspconfig.util.root_pattern('pom.xml', 'gradle.build', '.git')(fname) or vim.fn.getcwd()
                end,
                settings = {
                    java = {
                        eclipse = {
                            downloadSources = true,
                        },
                        configuration = {
                            updateBuildConfiguration = "interactive",
                        },
                        maven = {
                            downloadSources = true,
                        },
                        implementationsCodeLens = {
                            enabled = true,
                        },
                        referencesCodeLens = {
                            enabled = true,
                        },
                        references = {
                            includeDecompiledSources = true,
                        },
                    }
                },
                init_options = {
                    bundles = {}
                },
            })
            -- Raccourcis désactivés, utilisé avec l'affichage Telescope
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
            -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
            -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })
            -- vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Hover documentation' })
            -- vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename symbol' })
            -- vim.keymap.set('n', '<C-M-l>', vim.lsp.buf.format, { desc = 'Format code' })
        end
    }
}
