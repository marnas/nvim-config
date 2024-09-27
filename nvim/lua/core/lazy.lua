local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Install your plugins here
local plugins = {
	"nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
	"nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

	-- Colorschemes
	"jacoborus/tender.vim",
	"rebelot/kanagawa.nvim",
	{
		"loctvl842/monokai-pro.nvim",
		tag = 'v1.1.9',
	},

	-- Telescope for fuzzy finding
	"nvim-telescope/telescope.nvim",

	-- Treesitter for better color highlighting
	{
		"nvim-treesitter/nvim-treesitter",
		tag = 'v0.9.2',
		build = function()
			pcall(require('nvim-treesitter.install').update { with_sync = true })
		end,
		dependencies = {
			'nvim-treesitter/nvim-treesitter-textobjects',
		}
	},

	-- NeoTree for left side navigation
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
			"MunifTanjim/nui.nvim",
		}
	},

	-- Bufferline for top tab style buffers
	{
		'akinsho/bufferline.nvim',
		dependencies = 'nvim-tree/nvim-web-devicons'
	},

	-- "christoomey/vim-tmux-navigator",
	{
		"numToStr/Navigator.nvim",
		config = function() require('Navigator').setup({ disable_on_zoom = true }) end
	},

	"nvim-lualine/lualine.nvim",

	-- LSP Configuration & Plugins
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Automatically install LSPs to stdpath for neovim
			'williamboman/mason.nvim',
			'williamboman/mason-lspconfig.nvim',

			-- Useful status updates for LSP
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ 'j-hui/fidget.nvim', opts = {} },

			-- Additional lua configuration, makes nvim stuff amazing!
			'folke/neodev.nvim',
		},
	},
	'towolf/vim-helm',

	{
		-- Autocompletion
		'hrsh7th/nvim-cmp',
		dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
	},

	{
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	},

	-- show git changes
	"lewis6991/gitsigns.nvim",

	-- "gc" to comment visual regions/lines
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},

	-- neovim dashboard
	{
		'goolord/alpha-nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},

	{
		'ggandor/leap.nvim',
		config = function() require('leap').add_default_mappings() end
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
