return {
    -- You can also add new plugins here as well:
    -- Add plugins, the lazy syntax
    -- "andweeb/presence.nvim",
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
    "p00f/clangd_extensions.nvim", -- install lsp plugin
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            -- ensure_installed = { "clangd" },     -- automatically install lsp
        },
    },

    -- `rust-tool` for inlay hints
    "simrat39/rust-tools.nvim",
}
