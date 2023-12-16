local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.icons").diagnostic_signs

local config = function()
	require("neoconf").setup({})

	local lspconfig = require("lspconfig")

	-- Setup icons
	for type, icon in pairs(diagnostic_signs) do 
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- Lua
	lspconfig.lua_ls.setup({
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					-- make LSP recognize `vim` as global
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- Python
	lspconfig.pyright.setup({
		on_attach = on_attach,
		settings = {
			pyright = {
				disableOrganizeImports = false,
				analysis = {
					useLibraryCodeForTypes = true,
					autoSearchPaths = true,
					diagnosticMode = "workspace",
				},
			},
		},
	})

	-- Elixir
	lspconfig.elixirls.setup({
		on_attach = on_attach,
		cmd = { "/usr/bin/elixir-ls/language_server.sh" },
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	-- Python
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")

	-- Configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"python",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = false,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				python = { flake8, black },
			},
		},
	})

	-- Format on Save
	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_group,
		callback = function()
			local efm = vim.lsp.get_active_clients({ name = "efm" })

			if vim.tbl_isempty(efm) then
				return
			end

			vim.lsp.buf.format({ name = "efm" })
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
	},
}
