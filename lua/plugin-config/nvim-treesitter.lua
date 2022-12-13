local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	vim.notify("Not found nvim-treesitter")
	return
end

treesitter.setup({
	-- Install language parser
	-- :TSInstallInfo check supported languages
	ensure_installed = {
		"json",
		"html",
		"css",
		"vim",
		"lua",
		"python",
		"cpp",
		"arduino",
		"cuda",
		"latex",
		"julia",
		"gitignore",
		"dockerfile",
		"cmake",
		"bibtex",
		"bash",
		"javascript",
		"typescript",
	"tsx" },
	-- enable highlight
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<CR>",
			node_incremental = "<CR>",
			node_decremental = "<BS>",
			scope_incremental = "<TAB>",
		},
	},
	indent = {
		enable = true,
	},
	rainbow = {
		enable = true,
		-- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
		extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
		max_file_lines = nil, -- Do not enable for files with more than n lines, int
		-- colors = {}, -- table of hex strings
		-- termcolors = {} -- table of colour name strings
	},
})

-- Enable Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- Default not to fold
-- https://stackoverflow.com/questions/8316139/how-to-set-the-default-to-unfolded-when-you-open-a-file
vim.opt.foldlevel = 99

