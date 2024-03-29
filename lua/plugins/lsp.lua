return {
	"neovim/nvim-lspconfig",
	cmd = { "Mason", "Neoconf" },
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"folke/neoconf.nvim",
		"folke/neodev.nvim",
		{
			"j-hui/fidget.nvim",
			tag = "legacy",
			event = "LspAttach",
			opts = {
				-- options
			},
		},
		'nvimdev/lspsaga.nvim',
	},
	config = function()
		local servers = {
			lua_ls = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
				},
			},
			pyright = {},
			jsonls = {},
			marksman = {},
			volar = {},
			dockerls = {},
			docker_compose_language_service = {},
			bashls = {},
			-- jedi_language_server = {},
			-- pylsp = {
			-- 	pylsp = {
			-- 		plugins = {
			-- 			pycodestyle = {
			-- 				ignore = { 'W391' },
			-- 				maxLineLength = 100
			-- 			}
			-- 		}
			-- 	}
			-- },
		}
		require("neoconf").setup({})
		-- IMPORTANT: make sure to setup neodev BEFORE lspconfig
		require("neodev").setup({})
		require("fidget").setup({})
		require("lspsaga").setup({})
		require("mason").setup()
		-- Set up lspconfig.
		local capabilities = require('cmp_nvim_lsp').default_capabilities()
		require("mason-lspconfig").setup({
			ensure_installed = vim.tbl_keys(servers),
			handlers = {
				function(server_name) -- default handler (optional)
					require("lspconfig")[server_name].setup {
						settings = servers[server_name],
						capabilities = capabilities
					}
				end,
			},
		})
		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd('LspAttach', {
			group = vim.api.nvim_create_augroup('UserLspConfig', {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }
				vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
				-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
				vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, opts)
				-- vim.keymap.set('n'. 'K', vim.lsp.buf.hover, opts)
				vim.keymap.set('n', '.', "<cmd>Lspsaga hover_doc<cr>", opts)
				-- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, opts)
				vim.keymap.set('n', '<C-.>', vim.lsp.buf.signature_help, opts)
				vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
				vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
				vim.keymap.set('n', '<space>wl', function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, opts)
				vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
				-- vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
				vim.keymap.set('n', '<space>rn', "<cmd>Lspsaga rename ++project<cr>", opts)
				-- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
				vim.keymap.set({ 'n', 'v' }, '<space>ca', "<cmd>Lspsags code_action<cr>", opts)
				-- vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
				vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
				vim.keymap.set('n', '<leader>da', require('telescope.builtin').diagnostics, opts)
				vim.keymap.set('n', '<space>f', function()
					vim.lsp.buf.format { async = true }
				end, opts)
			end,
		})
	end,
}
