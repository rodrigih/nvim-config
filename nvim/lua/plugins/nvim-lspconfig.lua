local on_attach = require("util.lsp").on_attach
local diagnostic_signs = require("util.icons").diagnostic_signs

local config = function()
	require("neoconf").setup({})

	-- Setup icons
	for type, icon in pairs(diagnostic_signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
	end

	-- Lua
	vim.lsp.config("lua_ls", {
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
	vim.lsp.config("pyright", {
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

	-- Typescript
	vim.lsp.config("ts_ls", {
		on_attach = on_attach,
	})

	-- Lua
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	-- Python
	local flake8 = require("efmls-configs.linters.flake8")
	local black = require("efmls-configs.formatters.black")

	-- C/C++
	local cpplint = require("efmls-configs.linters.cpplint")
	local clangformat = require("efmls-configs.formatters.clang_format")

	-- CSS
	local stylelint = require("efmls-configs.linters.stylelint")

	-- Javascript
	local eslint = require("efmls-configs.linters.eslint_d")
	local prettier = require("efmls-configs.formatters.prettier_d")

	-- Configure efm server
	vim.lsp.config("efm", {
		filetypes = {
			"c",
			"cpp",
			"css",
			"html",
			"javascript",
			"javascriptreact",
			"lua",
			"python",
			"typescript",
			"typescriptreact",
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
				c = { clangformat, cpplint },
				cpp = { clangformat, cpplint },
				css = { stylelint, prettier },
				javascript = { eslint, prettier },
				javascriptreact = { eslint, prettier },
				lua = { stylua, luacheck },
				python = { black, flake8 },
				typescript = { eslint, prettier },
				typescriptreact = { eslint, prettier },
			},
		},
	})

  -- Enable LSPs
  vim.lsp.enable({"lua_ls", "pyright", "ts_ls", "efm"})

	-- Format on Save
	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})

	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_group,
		callback = function()
			local efm = vim.lsp.get_clients({ name = "efm" })

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
