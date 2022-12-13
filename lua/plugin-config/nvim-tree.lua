local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
	vim.notify("Not found nvim-tree")
	return
end

-- shortcuts
local list_keys = require('keybindings').nvimTreeList
nvim_tree.setup({
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
	view ={
		-- width
		width = 40,
		-- side location
		side = 'left',
		-- hiden root
		hide_root_folder = false,
		-- custom shortcuts
		mappings = {
			custom_only = false,
			list = list_keys,
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
})

-- close automatically
vim.cmd([[
	autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])
