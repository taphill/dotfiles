-- Attempt to find prettier exe in node_modules
vim.g.neoformat_try_node_exe = 1

-- Format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.ts", "*.jsx", "*.tsx", "*.css", "*.scss", "*.html" },
  command = "Neoformat",
})

