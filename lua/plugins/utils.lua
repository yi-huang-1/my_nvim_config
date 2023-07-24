return {
	{
		"rhysd/accelerated-jk",
		config = function()
			vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
			vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
		end,
	},
	{
		"folke/persistence.nvim",
		config = function()
			require("persistence").setup()
			vim.keymap.set("n", "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]])
			vim.keymap.set("n", "<leader>ql", [[<cmd>lua require("persistence").load({ last = true})<cr>]])
			vim.keymap.set("n", "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]])
		end
	},
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = true,
	},
	{
		"windwp/nvim-autopairs",
		opts = {
			enable_check_bracket_line = false,
		},
	},
	{
		-- move cursor to the locations last opened
		"ethanholz/nvim-lastplace",
		config = true,
	},
	{
		"folke/flash.nvim",
		config = function()
			require("flash").setup()
			vim.keymap.set({ "n", "x", "o" }, "s",
				function()
					require("flash").jump({
						search = {
							mode = function(str)
								return "\\<" .. str
							end,
						},
					})
				end
			)
			vim.keymap.set({ "n", "x", "o" }, "s",
				function()
					require("flash").treesitter()
				end
			)
			vim.keymap.set({ "o" }, "r",
				function()
					require("flash").remote()
				end
			)
			vim.keymap.set({ "o", "x" }, "r",
				function()
					require("flash").treesitter_search()
				end
			)
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		config = function()
			local function my_on_attach(bufnr)
				local api = require "nvim-tree.api"

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- custom mappings
				vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent, opts('Up'))
				vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
			end

			-- pass to setup along with your other options
			require("nvim-tree").setup {
				---
				on_attach = my_on_attach,
				---
				-- git status
				git = {
					enable = true,
				},
				-- project plugin
				update_cwd = true,
				update_focused_file = {
					enable = true,
					update_cwd = true,
				},
				-- hide .* files and node_modules
				filters = {
					dotfiles = false,
					custom = { 'node_modules' },
				},
				view = {
					-- width
					width = 40,
					-- side location
					side = 'left',
					-- hiden root
					hide_root_folder = false,
					-- custom shortcuts
					mappings = {
						custom_only = false,
						list = {
							-- open files or folders
							{ key = { "CR", "o", "<2-LeftMouse>" }, action = "edit" },
							-- split open files
							{ key = "v",                            action = "vsplit" },
							{ key = "h",                            action = "split" },
							-- show hidden files
							{ key = "i",                            action = "toggle_custom" }, -- connect with filters
							{ key = ".",                            action = "toggle_dotfiles" }, -- hide (dotfiles)
							-- file operations
							{ key = "<F5>",                         action = "refresh" },
							{ key = "a",                            action = "create" },
							{ key = "d",                            action = "remove" },
							{ key = "r",                            action = "rename" },
							{ key = "x",                            action = "cut" },
							{ key = "c",                            action = "copy" },
							{ key = "p",                            action = "paste" },
							{ key = "s",                            action = "system_open" },
						},
					},
					-- line numbers
					number = false,
					relativenumber = false,
					-- show icon
					signcolumn = 'yes',
				},
				actions = {
					open_file = {
						-- resize window on open
						resize_window = true,
						-- quite tree when open files
						quit_on_open = true,
					},
				},

				system_open = {
					cmd = 'open',
				},
			}
		end,
	},
	{
		"ellisonleao/glow.nvim",
		config = true,
	},
	-- {
	-- 	"folke/which-key.nvim",
	-- 	config = true,
	-- },
	{
		-- enhance a/i to text objects
		'echasnovski/mini.ai',
		config = true,
	},
	{
		"echasnovski/mini.comment",
		config = true,
	},
}
