return {
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make'
			},
		},
		config = function()
			extensions = {
				fzf = {
					fuzzy = true,                    -- false will only do exact matching
					override_generic_sorter = true,  -- override the generic sorter
					override_file_sorter = true,     -- override the file sorter
					case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
												   -- the default case_mode is "smart_case"
				}
			}
			-- To get fzf loaded and working with telescope, you need to call
			-- load_extension, somewhere after setup function:
			require('telescope').load_extension('fzf')
			-- Keybindings
			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {
				desc = "Lists files in your current working directory, respects .gitignore"
			})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {
				desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore. (Requires ripgrep)"
			})
			vim.keymap.set('n', '<leader><space>', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {
				desc = "Help Tag"
			})
			vim.keymap.set('n', '<leader>?', builtin.oldfiles, {
				desc = "[?] Find recently opened files"
			})
		end,
	},
}
