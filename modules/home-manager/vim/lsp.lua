require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "clangd", "nil", "marksman", "pyright",
  },
  automatic_installation = true,
})


local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local servers = {
  nil_ls = {},    -- Nix
  clangd = {},    -- C/C++
  marksman = {},  -- Markdown
  pyright = {},   -- Python
}

for name, config in pairs(servers) do
  config.on_attach = on_attach
  config.capabilities = capabilities
  lspconfig[name].setup(config)
end

vim.diagnostic.config({
  virtual_text = {
    spacing = 2,
    prefix = "●",
  },
  signs = true,
  underline = true,
  update_in_insert = true,
  severity_sort = true,
})

