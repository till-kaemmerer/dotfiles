-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config

lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lspconfig_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function(event)
    local opts = { buffer = event.buf }

    vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
    vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
    vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
    vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
    vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
    vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
    vim.keymap.set({ 'n', 'x' }, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
    vim.keymap.set('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)

    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = function()
        local clients = vim.lsp.get_clients({ bufnr = event.buf })
        if not clients then
          return
        end
        for _, client in pairs(clients) do
          if client.supports_method 'textDocument/formatting' then
            vim.lsp.buf.format {
              async = false,
            }
          end
        end
      end,
    })
  end,
})

local servers = { 'lua_ls', 'tailwindcss', 'ts_ls', 'jsonls', 'eslint', 'csharp_ls', 'rust_analyzer', 'biome', 'cssls',
  'html', 'yamlls', 'dockerls', 'vimls', 'pyright', 'clangd', 'jdtls', 'svelte',
  'volar' }

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = servers,
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})
