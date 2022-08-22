local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

local function config(_config)
  return vim.tbl_deep_extend('force', {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  }, _config or {})
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
local on_attach = require('plugins.lsp')

lspconfig['pylsp'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    require('plugins.pylsp'),
}
lspconfig['sumneko_lua'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    require('plugins.sumneko_lua'),
}
lspconfig['lemminx'].setup{
    on_attach = on_attach,
    flags = lsp_flags
}
