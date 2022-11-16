return {
	-- Syntax highlighting
	["nvim-treesitter/nvim-treesitter"] = {
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		event = "BufEnter",
		config = function()
			require("configs.treesitter")
		end,
		branch = "v0.8.0",
	},
	-- You can disable default plugins as follows:
	-- ["goolord/alpha-nvim"] = { disable = true },

	-- You can also add new plugins here as well:
	-- Add plugins, the packer syntax without the "use"
	-- { "andweeb/presence.nvim" },
	-- {
	--   "ray-x/lsp_signature.nvim",
	--   event = "BufRead",
	--   config = function()
	--     require("lsp_signature").setup()
	--   end,
	-- },
	-- 用于跑测试用
	-- {
	--   "nvim-neotest/neotest",
	--   requires = {
	--     "nvim-lua/plenary.nvim",
	--     "nvim-treesitter/nvim-treesitter",
	--     "antoinemadec/FixCursorHold.nvim",
	--     "nvim-neotest/neotest-go",
	--   },
	--   event = "BufRead",
	--   config = function()
	--     require("neotest").setup({
	--       adapters = {
	--         require("neotest-go"),
	--       },
	--     })
	--   end,
	-- },
	-- We also support a key value style plugin definition similar to NvChad:
	-- ["ray-x/lsp_signature.nvim"] = {
	--   event = "BufRead",
	--   config = function()
	--     require("lsp_signature").setup()
	--   end,
	-- },
	-- https://github.com/kevinhwang91/nvim-ufo#table-of-contents
	-- 折叠代码
	{
		"kevinhwang91/nvim-ufo",
		requires = "kevinhwang91/promise-async",
		event = "BufRead",
		config = function()
			-- require('ufo').setup({
			--         fold_virt_text_handler = fold_handler
			-- })
			require("ufo").setup()
		end,
	},
	-- https://github.com/glepnir/lspsaga.nvim
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		event = "BufRead",
		config = function()
			local saga = require("lspsaga")

			saga.init_lsp_saga({
				-- your configuration
			})
		end,
	},
	-- {
	--   "klen/nvim-test",
	--   event = "BufRead",
	--   config = function()
	--     require('nvim-test').setup({
	--       term = "toggleterm"
	--     })
	--     require('nvim-test.runners.go-test'):setup {
	--       command = "go",
	--       args = { "test", "-count=1", "-v" }
	--     }
	--
	--   end
	-- },
}

-- local fold_handler = function(virtText, lnum, endLnum, width, truncate)
--         local newVirtText = {}
--         local suffix = ('  %d '):format(endLnum - lnum)
--         local sufWidth = vim.fn.strdisplaywidth(suffix)
--         local targetWidth = width - sufWidth
--         local curWidth = 0
--         for _, chunk in ipairs(virtText) do
--                 local chunkText = chunk[1]
--                 local chunkWidth = vim.fn.strdisplaywidth(chunkText)
--                 if targetWidth > curWidth + chunkWidth then
--                         table.insert(newVirtText, chunk)
--                 else
--                         chunkText = truncate(chunkText, targetWidth - curWidth)
--                         local hlGroup = chunk[2]
--                         table.insert(newVirtText, { chunkText, hlGroup })
--                         chunkWidth = vim.fn.strdisplaywidth(chunkText)
--                         -- str width returned from truncate() may less than 2nd argument, need padding
--                         if curWidth + chunkWidth < targetWidth then
--                                 suffix = suffix .. (' '):rep(targetWidth - curWidth - chunkWidth)
--                         end
--                         break
--                 end
--                 curWidth = curWidth + chunkWidth
--         end
--         table.insert(newVirtText, { suffix, 'MoreMsg' })
--         return newVirtText
-- end
