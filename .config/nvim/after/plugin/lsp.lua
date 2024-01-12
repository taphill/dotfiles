--
-- [[ LSP ]]
-- See `:help lsp-zero`
--

local lsp = require("lsp-zero").preset({
	name = "minimal",
	set_lsp_keymaps = false,
	manage_nvim_cmp = true,
	suggest_lsp_servers = false,
})

lsp.ensure_installed({
	"denols",
	"tailwindcss",
	"tsserver",
})

local lsp_util = require("lspconfig.util")

lsp.configure("denols", {
	root_dir = lsp_util.root_pattern("deno.json", "deno.jsonc"),
})

lsp.configure("tailwindcss", {
	root_dir = lsp_util.root_pattern("tailwind.config.js", "tailwind.config.cjs"),
})

lsp.configure("tsserver", {
	root_dir = lsp_util.root_pattern("package.json", "tsconfig.json", "jsconfig.json"),
})

local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	-- Diagnostics for various Linters and formatters
	sources = {
		null_ls.builtins.diagnostics.actionlint,
		null_ls.builtins.diagnostics.cfn_lint,
		null_ls.builtins.formatting.deno_fmt.with({
			condition = function(utils)
				return utils.root_has_file("deno.json", "deno.jsonc")
			end,
		}),
		null_ls.builtins.formatting.prettier.with({
			condition = function(utils)
				return utils.root_has_file({
					".prettierrc",
					".prettierrc.cjs",
					".prettierrc.js",
					".prettierrc.json",
					".prettierrc.json5",
					".prettierrc.toml",
					".prettierrc.yml",
					".prettierrc.yaml",
					".prettierrc.yaml",
					"prettier.config.cjs",
					"prettier.config.js",
				})
			end,
		}),
		null_ls.builtins.formatting.prismaFmt,
		null_ls.builtins.formatting.stylua,
	},

	-- Format on save
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end,
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
})

-- disable completion with tab
-- this helps with copilot setup
cmp_mappings["<Tab>"] = nil
cmp_mappings["<S-Tab>"] = nil

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

vim.diagnostic.config({
	virtual_text = true,
})

lsp.on_attach(function(client, bufnr)
	local nmap = function(keys, func, desc)
		if desc then
			desc = "LSP: " .. desc
		end

		vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
	end

	nmap("]d", vim.diagnostic.goto_next, "Go to next Diagnostic")
	nmap("[d", vim.diagnostic.goto_prev, "Go to previous Diagnostic")
	nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
	nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
	nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
	nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition")
	nmap("K", vim.lsp.buf.hover, "Hover Documentation")
	-- Find something that doesn't conflict
	-- nmap("P", vim.lsp.buf.signature_help, "Signature Documentation")
end)

lsp.setup()
