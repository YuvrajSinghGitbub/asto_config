return {
    -- Configure AstroNvim updates
    updater = {
        remote = "origin",     -- remote to use
        channel = "stable",    -- "stable" or "nightly"
        version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        branch = "nightly",    -- branch name (NIGHTLY ONLY)
        commit = nil,          -- commit hash (NIGHTLY ONLY)
        pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
        skip_prompts = false,  -- skip prompts about breaking changes
        show_changelog = true, -- show the changelog after performing an update
        auto_quit = false,     -- automatically quit the current session after a successful update
        remotes = {            -- easily add new remotes to track
            --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
            --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
            --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        },
    },
    -- Set colorscheme to use
    colorscheme = "catppuccin",
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
        virtual_text = true,
        underline = true,
    },
    lsp = {
        -- customize lsp formatting options
        formatting = {
            -- control auto formatting on save
            format_on_save = {
                enabled = true,     -- enable or disable format on save globally
                allow_filetypes = { -- enable format on save for specified filetypes only
                    -- "go",
                },
                ignore_filetypes = { -- disable format on save for specified filetypes
                    -- "cpp",
                },
            },
            disabled = { -- disable formatting capabilities for the listed language servers
                "clangd",
                "html-lsp",
                "htmx-lsp"
            },
            timeout_ms = 1000, -- default format timeout
            -- filter = function(client) -- fully override the default formatting function
            --   return true
            -- end
        },
        -- enable servers that you already have installed without mason
        servers = {
            -- "pyright"
            -- "gleam"
        },
        -- adding a custom config for clangd using `clangd_extensions`
        setup_handlers = {
            -- add custom handler
            -- clangd = function(_, opts) require("clangd_extensions").setup { server = opts } end,
            -- custom handler for rust and rust-tools
            rust_analyzer = function(_, opts) require("rust-tools").setup { server = opts } end,
        },
        config = {
            clangd = {
                capabilities = {
                    offsetEncoding = "utf-8",
                },

            },
        },
    },
    -- Configure require("lazy").setup() options
    lazy = {
        defaults = { lazy = true },
        performance = {
            rtp = {
                -- customize default disabled vim plugins
                disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
            },
        },
    },
    plugins = {
        "simrat39/rust-tools.nvim", -- add lsp plugin
        {
            "williamboman/mason-lspconfig.nvim",
            opts = {
                -- ensure_installed = { "rust_analyzer" },
                tools = {
                    inlay_hints = {
                        auto = true,
                        only_current_line = false,
                        show_parameter_hints = true,
                        parameter_hints_prefix = "<- ",
                        other_hints_prefix = "=> ",
                        max_len_align = false,
                        max_len_align_padding = 1,
                        right_align = false,
                        right_align_padding = 7,
                        -- highlight = "Comment",
                        highlight = "#1ababa",
                    },
                },
            },
        },
        -- "p00f/clangd_extensions.nvim", -- add lsp plugin
        -- init = function()
        --         -- load clangd extensions when clangd attaches
        --         local augroup = vim.api.nvim_create_augroup("clangd_extensions", { clear = true })
        --         vim.api.nvim_create_autocmd("LspAttach", {
        --           group = augroup,
        --           desc = "Load clangd_extensions with clangd",
        --           callback = function(args)
        --             if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
        --               require "clangd_extensions"
        --               -- add more `clangd` setup here as needed such as loading autocmds
        --               vim.api.nvim_del_augroup_by_id(augroup) -- delete auto command since it only needs to happen once
        --             end
        --           end,
        --         })
        --       end,
        -- {
        --     "williamboman/mason-lspconfig.nvim",
        --     opts = {
        --         inlay_hints = {
        --               inline = vim.fn.has("nvim-0.10") == 1,
        --               only_current_line = false,
        --               only_current_line_autocmd = { "CursorHold" },
        --               show_parameter_hints = true,
        --               parameter_hints_prefix = "<- ",
        --               other_hints_prefix = "=> ",
        --               max_len_align = false,
        --               max_len_align_padding = 1,
        --               right_align = false,
        --               right_align_padding = 7,
        --               highlight = "Comment",
        --               priority = 100,
        --           },
        --     },
        -- },
    },
    -- This function is run last and is a good place to configuring
    -- augroups/autocommands and custom filetypes also this just pure lua so
    -- anything that doesn't fit in the normal config locations above can go here
    polish = function()
        -- Set up custom filetypes
        -- vim.filetype.add {
        --   extension = {
        --     foo = "fooscript",
        --   },
        --   filename = {
        --     ["Foofile"] = "fooscript",
        --   },
        --   pattern = {
        --     ["~/%.config/foo/.*"] = "fooscript",
        --   },
        -- }
        vim.filetype.add({ extension = { templ = "templ" } })
        end,
}
