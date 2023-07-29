return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = "VeryLazy",
		-- dependencies = {
		-- 	"nvim-treesitter/playground"
		-- },
		main = "nvim-treesitter.configs",
		build = ":TSUpdate",
		opts = {
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = "all",
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		},
		playground = {
			enable = true,
		},
	},
}
