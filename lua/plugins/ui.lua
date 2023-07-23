return {
	{
		'akinsho/bufferline.nvim',
		dependencies = {
			'nvim-tree/nvim-web-devicons'
		},
		config = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = true,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = {
			current_line_blame = true,
			numhl = true,
		},
	},
	{
		"RRethy/vim-illuminate",
		config = function()
			require('illuminate').configure({})
		end,
	},
}
