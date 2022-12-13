-- local packer = require("packer")

-- Install Packer.nvim automatically
-- location
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
	vim.notify("Installiing Pakcer.nvim ...")
	paccker_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1", -- "https://github.com/wbthomason/packer.nvim",
		"https://gitcode.net/mirrors/wbthomason/packer.nvim",
		install_path,
	})

	-- https://github.com/wbthomason/packer.nvim/issues/750
	local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
	if not string.find(vim.o.runtimepath, rtp_addition) then
		vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
	end
	vim.notify("Pakcer.nvim Finished")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	vim.notify("Not found packer.nvim")
	return
end
packer.startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")
	-- Colorscheme
	use("Mofiqul/dracula.nvim")
	-- Custom plugins ---------------------
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	use({
		"akinsho/bufferline.nvim",
		tag = "v3.*",
		requires = {
			"nvim-tree/nvim-web-devicons",
			"moll/vim-bbye",
		},
	})
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	use("arkav/lualine-lsp-progress")
	use({
		"nvim-telescope/telescope.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-- telescope extensions
	use("LinArcX/telescope-env.nvim")

	-- dashboard-nvim
	use("glepnir/dashboard-nvim")

	-- project
	use("ahmedkhalf/project.nvim")

	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	-- use({ "nvim-treesitter/nvim-treesitter"})

	--------------------- LSP --------------------
	use({ "williamboman/mason.nvim" })
	use({ "williamboman/mason-lspconfig.nvim" })
	-- Lspconfig
	use({ "neovim/nvim-lspconfig" })

	-- complete engine
	use("hrsh7th/nvim-cmp")

	-- snippet engine
	use("L3MON4D3/LuaSnip")
	use("saadparwaiz1/cmp_luasnip")

	-- complete source
	use("hrsh7th/vim-vsnip")
	use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
	use("hrsh7th/cmp-vsnip")
	use("hrsh7th/cmp-buffer") -- { name = 'buffer' },
	use("hrsh7th/cmp-path") -- { name = 'path' }
	use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
	use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }

	-- common snippets
	use("rafamadriz/friendly-snippets")

	-- UI 增强
	use("onsails/lspkind-nvim")
	use("tami5/lspsaga.nvim")

	-- indent-blankline
	use("lukas-reineke/indent-blankline.nvim")

	-- formatting
	-- use("mhartington/formatter.nvim")
	use({ "jose-elias-alvarez/null-ls.nvim", requires = "nvim-lua/plenary.nvim" })

    -- nvim-autopairs
    use("windwp/nvim-autopairs")

    -- Comment
    use("numToStr/Comment.nvim")

	-- JSON 增强
	use("b0o/schemastore.nvim")
end)

config = {
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "single" })
		end,
	},
}

-- automatic install plugins when saved
pcall(
	vim.cmd,
	[[
		augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
		augroup end
	]]
)
