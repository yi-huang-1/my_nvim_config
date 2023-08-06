return {
	{
		'akinsho/bufferline.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		event = "VeryLazy",
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "VeryLazy",
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		config = {
			current_line_blame = true,
			numhl = true,
		},
	},
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
		end
	},
	{
		"RRethy/vim-illuminate",
		event = "VeryLazy",
		config = function()
			require('illuminate').configure({})
		end,
	},
	-- lazy.nvim
	-- {
	-- 	"folke/noice.nvim",
	-- 	event = "VeryLazy",
	-- 	opts = {
	-- 		-- add any options here
	-- 	},
	-- 	dependencies = {
	-- 		-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 		"MunifTanjim/nui.nvim",
	-- 		-- OPTIONAL:
	-- 		--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 		--   If not available, we use `mini` as the fallback
	-- 		"rcarriga/nvim-notify",
	-- 	},
	-- 	config = function()
	-- 		require("noice").setup({
	-- 			lsp = {
	-- 				-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
	-- 				override = {
	-- 					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
	-- 					["vim.lsp.util.stylize_markdown"] = true,
	-- 					["cmp.entry.get_documentation"] = true,
	-- 				},
	-- 			},
	-- 			-- you can enable a preset for easier configuration
	-- 			presets = {
	-- 				bottom_search = true, -- use a classic bottom cmdline for search
	-- 				command_palette = true, -- position the cmdline and popupmenu together
	-- 				long_message_to_split = true, -- long messages will be sent to a split
	-- 				inc_rename = false, -- enables an input dialog for inc-rename.nvim
	-- 				lsp_doc_border = false, -- add a border to hover docs and signature help
	-- 			},
	-- 			messages = {
	-- 				-- NOTE: If you enable messages, then the cmdline is enabled automatically.
	-- 				-- This is a current Neovim limitation.
	-- 				enabled = false, -- enables the Noice messages UI
	-- 				view = "notify", -- default view for messages
	-- 				view_error = "notify", -- view for errors
	-- 				view_warn = "mini", -- view for warnings
	-- 				view_history = "messages", -- view for :messages
	-- 				view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
	-- 			},
	-- 		})
	-- 	end
	--
	-- },
}
