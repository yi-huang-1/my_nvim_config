-- basic configuration
require('basic')
-- key bindings
require('keybindings')
-- Packer plugins management
require("plugins")
-- Colorcheme
require("colorscheme")
-- plugins
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.comment")
require("plugin-config.surround")

require("plugin-config.indent_blankline")
require("plugin-config.coc")

-- Vim Leap
require('leap').add_default_mappings()

require('leap').opts.highlight_unlabeled_phase_one_targets = true
