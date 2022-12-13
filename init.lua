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

-- lsp
require("lsp.setup")
require("lsp.ui")
require("lsp.cmp")
-- require("lsp.formatter")
require("lsp.null-ls")

require("plugin-config.indent_blankline")
