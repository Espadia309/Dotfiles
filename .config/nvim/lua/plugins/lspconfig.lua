return {
    "neovim/nvim-lspconfig",
    dependencies = {
            { "mason-org/mason.nvim", config = true},
            "mason-org/mason-lspconfig.nvim",
    },
    config = function()
        local servers = {
                lua_ls = {},
                pyright = {},
                ts_ls = {},
                clangd = {},
                cmake = {},
                roslyn_ls = {},
                bashls = {},
                qmlls = {},
         }

        local lspconfig = require("lspconfig")

        require("mason-lspconfig").setup({
                ensure_installed = vim.tbl_keys(servers),

                handlers = {
                        function(server_name)
                                lspconfig[server_name].setup(servers[server_name] or {})
                        end,
                }
        })

        require("mason").setup({
                firewall = {
                        enabled = true,
                }
        })
    end,
}
