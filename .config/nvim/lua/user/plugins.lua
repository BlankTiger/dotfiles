return require('packer').startup(function(use)
	-- speed up startup
	use('lewis6991/impatient.nvim')

	use('wbthomason/packer.nvim')

	-- useful lua functions
	use('nvim-lua/plenary.nvim')


	-- status line
	use('nvim-lualine/lualine.nvim')
	use('akinsho/bufferline.nvim')


	-- treesitter
	use('nvim-treesitter/nvim-treesitter')


	-- telescope
	use('nvim-telescope/telescope.nvim')
	use({
		'nvim-telescope/telescope-fzf-native.nvim',
		run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
	})
	use('nvim-telescope/telescope-file-browser.nvim')


	-- LSP
	use('neovim/nvim-lspconfig')
	use('williamboman/nvim-lsp-installer')
	use('jose-elias-alvarez/null-ls.nvim')
	use('folke/trouble.nvim')
	-- use('glepnir/lspsaga.nvim')


	-- DAP
	-- use('mfussenegger/nvim-dap')
	-- use({'rcarriga/nvim-dap-ui', requires={'mfussenegger/nvim-dap'}})
	-- use('theHamsta/nvim-dap-virtual-text')
	-- use('mfussenegger/nvim-dap-python')
	-- use('ravenxrz/DAPInstall.nvim')
	-- use('nvim-telescope/telescope-dap.nvim')


	-- utilities for languages, linters, fixers
	use('simrat39/rust-tools.nvim')
	use('Vimjas/vim-python-pep8-indent')


	-- autocompletion
	use('hrsh7th/nvim-cmp')
	use('hrsh7th/cmp-path')
	use('hrsh7th/cmp-buffer')
	use('hrsh7th/cmp-nvim-lsp')
	use('hrsh7th/cmp-nvim-lua')
	use('hrsh7th/cmp-copilot')
	-- use({'tzachar/cmp-tabnine', run='powershell ./install.ps1'})
	use('saadparwaiz1/cmp_luasnip')


	-- snippets
	use('L3MON4D3/LuaSnip')
	use('rafamadriz/friendly-snippets')


	-- visuals
	use('glepnir/dashboard-nvim')
	use('lewis6991/gitsigns.nvim')
	-- use('karb94/neoscroll.nvim')
	use('norcalli/nvim-colorizer.lua')
	use('kyazdani42/nvim-web-devicons')
	use('folke/zen-mode.nvim')
	use('folke/twilight.nvim')
	use('frazrepo/vim-rainbow') -- rainbow parenthesis
	use('romainl/vim-cool') -- disable highlighting of search after it's done
	use('segeljakt/vim-silicon') -- share code snippets


	-- utilities, ease of use
	-- use('potamides/pantran.nvim') -- for translations
	use('ThePrimeagen/harpoon')
	use({ 'AckslD/nvim-neoclip.lua', requires = { 'nvim-telescope/telescope.nvim' } })
	use('github/copilot.vim')
	use('tpope/vim-surround')
	use('tpope/vim-repeat')
	use('tpope/vim-sleuth')
	use('tpope/vim-obsession')
	use('windwp/nvim-autopairs')
	use('numToStr/Comment.nvim')
	use('JoosepAlviste/nvim-ts-context-commentstring')
	use('moll/vim-bbye')
	use('akinsho/toggleterm.nvim')
	use('ahmedkhalf/project.nvim')
	use('lukas-reineke/indent-blankline.nvim')
	use('folke/which-key.nvim')
	use({ 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } })
	use('fedepujol/move.nvim') -- move blocks and lines around
	use('phaazon/hop.nvim') -- easier file navigation


	-- colorschemes
	use('amadeus/vim-evokai')
end)
