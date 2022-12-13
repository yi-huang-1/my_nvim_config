local status, telescope = pcall(require, "telescope")
if not status then
	vim.notify("Not found telescope")
	return
end

telescope.setup({
	defaults = {
		-- default mode after open telescope
		initial_mode = "insert",
		-- shortcuts
		mappings = require("keybindings").telescopeList,
	},
	pickers = {
		find_files = {
		  -- inner theme: dropdown, cursor, ivy
		  theme = "dropdown", 
		}
		},
		extensions = {

	},
})
-- telescope extensions
pcall(telescope.load_extension, "env")

