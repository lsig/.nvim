require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { 
        "sumneko_lua", 
        "rust_analyzer",
        "pyright",
        "tsserver"
    }
})
local mason_null_ls = require("mason-null-ls")

mason_null_ls.setup({
    ensure_installed = {
        "prettier",
        "stylua",
        "eslint_d",
        "pylint"
    }
})

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}


