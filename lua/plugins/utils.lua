return {
	{
		"rhysd/accelerated-jk",
		keys = {
			{ "j", "<Plug>(accelerated_jk_gj)" },
			{ "k", "<Plug>(accelerated_jk_gk)" },

		},
	},
	{
		"folke/persistence.nvim",
		keys = {
			{ "<leader>qs", [[<cmd>lua require("persistence").load()<cr>]] },
			{ "<leader>ql", [[<cmd>lua require("persistence").load({ last = true})<cr>]] },
			{ "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]] },
		},
		config = true,
	},
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = true,
	},
	{
		"windwp/nvim-autopairs",
		event = "VeryLazy",
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
		keys = {
			{
				"s",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "Flash",
			},
			{
				"S",
				mode = { "n", "o", "x" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"r",
				mode = "o",
				function()
					require("flash").remote()
				end,
				desc = "Remote Flash",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search()
				end,
				desc = "Flash Treesitter Search",
			},
			{
				"<c-s>",
				mode = { "c" },
				function()
					require("flash").toggle()
				end,
				desc = "Toggle Flash Search",
			},
		},
		config = true,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>m", "<cmd>Neotree toggle<CR>", desc = "Open the neo-tree", mode = { "n", "v" } }
		},
		config = true,
	},
	{
		"ellisonleao/glow.nvim",
		event = "VeryLazy",
		config = true,
	},
	-- {
	-- 	"folke/which-key.nvim",
	-- 	event = "VeryLazy",
	-- 	config = true,
	-- },
	{
		-- enhance a/i to text objects
		'echasnovski/mini.ai',
		event = "VeryLazy",
		config = true,
	},
	{
		"echasnovski/mini.comment",
		event = "VeryLazy",
		config = true,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end
	}
}
