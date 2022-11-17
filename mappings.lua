local Terminal = require("toggleterm.terminal").Terminal

local lazyTest = Terminal:new({
	cmd = "ls",
	close_on_exit = false,
})

return {
	i = {

		["C-s"] = { "<cmd>w!<cr>", desc = "Force write" },
	},
	-- first key is the mode
	n = {
		-- second key is the lefthand side of the map
		-- mappings seen under group name "Buffer"
		["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
		["<leader><leader>"] = {
			function()
				require("telescope.builtin").find_files()
			end,
			desc = "find files",
		},
		["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
		["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
		["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
		["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
		["<TAB>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Move buffer tab right" },
		["<S-TAB>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Move buffer tab left" },
		["gr"] = { "<cmd>Telescope lsp_references<cr>", desc = "lsp reference" },
		["go"] = { "<cmd>Telescope lsp_document_symbols<cr>", desc = "lsp_document_symbols" },
		["<leader><C-f>"] = { "<cmd> Telescope live_grep<cr>", desc = "live_grep" },
		["<leader>1"] = {
			function()
				vim.lsp.buf.code_action()
			end,
			desc = "LSP code action",
		},
		["<C-f>"] = { "/", desc = "" },

		-- neotest
		["<leader>rt"] = { "<cmd>TestNearest<cr>", desc = "TestNearest" },

		["<leader>rs"] = {
			function()
				lazyTest:toggle()
			end,
			desc = "test",
		},

		-- quick save
		-- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
	},
	t = {
		-- setting a mapping to false will disable it
		-- ["<esc>"] = false,
		["<esc>"] = { "<C-\\><C-n>", desc = "normal mode" },
	},
}
