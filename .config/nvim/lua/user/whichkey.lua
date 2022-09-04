local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true, -- adds help for motions
			text_objects = true, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
		separator = "➜", -- symbol used between a key and it's label
		group = "+", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = "<c-d>", -- binding to scroll down inside the popup
		scroll_up = "<c-u>", -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n", -- NORMAL mode
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local opts_v = {
	mode = "v",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}


local mappings = {
	-- Bufferline and buffer management
	["gb"] = { "<cmd>BufferLinePick<CR>", "Pick a buffer" },
	["<S-l>"] = { "<cmd>BufferLineCycleNext<CR>", "Cycle to next buffer" },
	["<S-h>"] = { "<cmd>BufferLineCyclePrev<CR>", "Cycle to previous buffer" },
	["<leader>c"] = { "<cmd>Bdelete!<CR>", "Close current buffer" },
	["<leader>b"] = {
		c = {
			name = "Closing buffers (options)",
			l = { "<cmd>BufferLineCloseLeft<CR>", "Buffers to the left" },
			r = { "<cmd>BufferLineCloseRight<CR>", "Buffers to the right" },
			c = { "<cmd>BufferLinePickClose<CR>", "Choose buffer" },
		},
		s = {
			"<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
			"Show buffers"
		},
	},

	-- Resizing windows
	["<C-Up>"] = { "<cmd>resize -2<CR>", "Resize window up" },
	["<C-Down>"] = { "<cmd>resize +2<CR>", "Resize window down" },
	["<C-Left>"] = { "<cmd>vertical resize -2<CR>", "Resize window left" },
	["<C-Right>"] = { "<cmd>vertical resize +2<CR>", "Resize window right" },

	-- Utility
	[";"] = { ":", "Allow to save a keystroke" },
	["<C-b>"] = { "<C-v>", "Visual block mode" },
	["<leader>w"] = { "<cmd>w!<CR>", "Save" },
	["<leader>q"] = { "<cmd>q<CR>", "Quit" },
	["<leader>y"] = { "<cmd>lua require('telescope').extensions.neoclip.default()<CR>", "Neoclip saved yanks" },
	["<leader>z"] = { "<cmd>lua require('zen-mode').toggle()<CR>", "Toggle zen-mode" },
	["<leader>x"] = { "<cmd>HopWord<CR>", "Hop to any word" },
	["<leader>X"] = { "<cmd>HopAnywhere<CR>", "Hop to anywhere" },

	--[[ -- System clipboard ]]
	--[[ ["<space>yy"] = { '"+yy' }, ]]
	--[[ ["<space>yg_"] = { '"+yg_' }, ]]
	--[[ ["<space>p"] = { '"+p' }, ]]
	--[[ ["<space>P"] = { '"+P' }, ]]


	-- nvim-tree/file explorer
	["<leader>e"] = {
		name = "Explorer",
		e = { "<cmd>NvimTreeToggle<cr>", "Toggle" },
		o = { "<cmd>NvimTreeOpen<cr>", "Open" },
		c = { "<cmd>NvimTreeClose<cr>", "Close" },
		r = { "<cmd>NvimTreeRefresh<cr>", "Refresh" },
	},

	-- telescope
	["<leader>f"] = {
		"<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
		"Find files",
	},
	["<leader>F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
	["<leader>P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },

	-- harpoon
	["<leader>H"] = { "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", "Harpoon menu" },
	["<leader>hm"] = { "<cmd>lua require('harpoon.mark').add_file()<cr>", "Add file to harpoon" },
	["<leader>hn"] = { "<cmd>lua require('harpoon.ui').nav_next()<cr>", "Navigate to next harpoon file" },
	["<leader>hb"] = { "<cmd>lua require('harpoon.ui').nav_prev()<cr>", "Navigate to prev harpoon file" },
	["<leader>h1"] = { "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", "Navigate to 1st harpoon file" },
	["<leader>h2"] = { "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", "Navigate to 2nd harpoon file" },
	["<leader>h3"] = { "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", "Navigate to 3rd harpoon file" },
	["<leader>h4"] = { "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", "Navigate to 4th harpoon file" },



	-- packer
	["<leader>p"] = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	-- git utilities
	["<leader>g"] = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Diff",
		},
	},

	-- LSP utilities
	["<leader>l"] = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		d = {
			"<cmd>Telescope lsp_document_diagnostics<cr>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<cr>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.formatting{async=true}<cr>", "Format" },
		i = { "<cmd>LspInfo<cr>", "Info" },
		I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
			"Workspace Symbols",
		},
	},

	-- DAP
	["<leader>d"] = {
		name = "DAP",
		-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
		-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
		-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
		-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
		-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
		-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
		-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
		-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
		-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle breakpoint" },
		c = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
		i = { "<cmd>lua require'dap'.step_into()<CR>", "Step into" },
		o = { "<cmd>lua require'dap'.step_over()<CR>", "Step over" },
		O = { "<cmd>lua require'dap'.step_out()<CR>", "Step out" },
		r = { "<cmd>lua require'dap'.repl.toggle()<CR>", "Toggle REPL" },
		l = { "<cmd>lua require'dap'.run_last()<CR>", "Run last" },
		u = { "<cmd>lua require'dapui'.toggle()<CR>", "Toggle UI" },
		t = { "<cmd>lua require'dap'.terminate()<CR>", "Terminate" },
	},

	["<leader>s"] = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		C = { "<cmd>Telescope commands<cr>", "Commands" },
	},

	["<leader>t"] = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
		t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		l = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "LazyGit" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
}

-- Bindings for moving lines up and down
local mappings_n = {
	["<S-n>"] = { "J", "Concatenate next line" },
	["<S-k>"] = { "<cmd>MoveLine(-1)<CR>", "Move line up" },
	["<S-j>"] = { "<cmd>MoveLine(1)<CR>", "Move line down" },
}

local mappings_v = {
	["<S-n>"] = { "J", "Concatenate lines" },
	["<S-k>"] = { ":'<,'>MoveBlock(-1)<CR>", "Move lines up" },
	["<S-j>"] = { ":'<,'>MoveBlock(1)<CR>", "Move lines down" },
	--[[ ["<space>y"] = { '"+y' }, ]]
	--[[ ["<space>p"] = { "+p" }, ]]
	--[[ ["<space>P"] = { "+P" }, ]]
}


which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(mappings_n, opts)
which_key.register(mappings_v, opts_v)
