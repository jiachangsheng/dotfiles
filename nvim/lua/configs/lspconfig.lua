require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls","all" }

vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers 
