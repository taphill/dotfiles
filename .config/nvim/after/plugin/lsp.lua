--
-- [[ LSP ]]
--

local lspconfig = require("lspconfig")
local lspconfig_defaults = lspconfig.util.default_config
local cmp = require("cmp")

--
-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
--

lspconfig_defaults.capabilities = vim.tbl_deep_extend(
  "force",
  lspconfig_defaults.capabilities,
  require("cmp_nvim_lsp").default_capabilities()
)


--
-- Enable features that only work if there is a language server active in the file
--

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "LSP actions",
  callback = function(event)
    local nmap = function(keys, func, desc)
      if desc then
        desc = "LSP: " .. desc
      end
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = desc })
    end
    nmap("]d", vim.diagnostic.goto_next, "Next Diagnostic")
    nmap("[d", vim.diagnostic.goto_prev, "Previous Diagnostic")
    nmap("K", vim.lsp.buf.hover, "Hover Documentation")
    nmap("gd", vim.lsp.buf.definition, "Go to Definition")
    nmap("gD", vim.lsp.buf.declaration, "Go to Declaration")
    nmap("gi", vim.lsp.buf.implementation, "Go to Implementation")
    nmap("go", vim.lsp.buf.type_definition, "Go to Type Definition")
    nmap("gr", vim.lsp.buf.references, "Go to References")
    nmap("gs", vim.lsp.buf.signature_help, "Signature Help")
    nmap("<F2>", vim.lsp.buf.rename, "Rename Symbol")
    nmap("<F3>", function() vim.lsp.buf.format({ async = true }) end, "Format Code")
    nmap("<F4>", vim.lsp.buf.code_action, "Code Action")
  end,
})


--
-- Setup language servers
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
--

lspconfig.ts_ls.setup({
  root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
  flags = {
    debounce_text_changes = 150,
  },
})


--
-- Enable completion
--

cmp.setup({
  sources = {
    {name = "nvim_lsp"},
  },
  snippet = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Confirm completion with Enter
  }),
})


--
-- Diagnostics config
--

vim.diagnostic.config {
  signs = false,
  underline = true,
  virtual_text = false,
}

