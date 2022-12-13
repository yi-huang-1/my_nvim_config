local status, mason = pcall(require, "mason")
if not status then
	vim.notify("Not found mason")
	return
end

local status, mason_config = pcall(require, "mason-lspconfig")
if not status then
	vim.notify("Not found mason-lspconfig")
	return
end

local status, lspconfig = pcall(require, "lspconfig")
if not status then
	vim.notify("Not found lspconfig")
	return
end

-- :h mason-default-settings
require("mason").setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

-- mason-lspconfig uses the `lspconfig` server names in the APIs it exposes - not `mason.nvim` package names
-- https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
mason_config.setup({
	ensure_installed = {
		"sumneko_lua",
		"bashls",
		"cssls",
		"dockerls",
		"html",
		"jsonls",
		"pyright",
		"yamlls",
		"remark_ls",
		"ltex",
		"cmake",
		"clangd",
	},
})

-- Installation
-- { key: language value: config }
-- key must be the ones listed in the links below
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
	sumneko_lua = require("lsp.config.lua"), -- lua/lsp/config/lua.lua
	bashls = require("lsp.config.bash"),
	cssls = require("lsp.config.css"),
	dockerls = require("lsp.config.docker"),
	html = require("lsp.config.html"),
	jsonls = require("lsp.config.json"),
	pyright = require("lsp.config.pyright"),
	yamlls = require("lsp.config.yamlls"),
	remark_ls = require("lsp.config.markdown"),
	ltex = require("lsp.config.latex"),
	cmake = require("lsp.config.cmake"),
	clangd = require("lsp.config.clangd"),
}

for name, config in pairs(servers) do
  if config ~= nil and type(config) == "table" then
    config.on_setup(lspconfig[name])
  else
    -- Use default
    lspconfig[name].setup({})
  end
end

require("lsp.ui")
