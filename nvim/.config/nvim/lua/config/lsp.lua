local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Python LSP
lspconfig.pylsp.setup({
    cmd = { "pylsp" },
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = { enabled = true, maxLineLength = 100 },
                pylint = { enabled = false },
                yapf = { enabled = false },
            }
        }
    }
})
