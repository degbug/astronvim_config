return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle Explorer" },
    ["<leader><leader>"] = { function() require("telescope.builtin").find_files() end,
      desc = "find files" },
    ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
    ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
    ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
    ["<TAB>"] = { "<cmd>BufferLineCycleNext<cr>", desc = "Move buffer tab right" },
    ["<S-TAB>"] = { "<cmd>BufferLineCyclePrev<cr>", desc = "Move buffer tab left" },
    ["<leader>1"] = {
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "LSP code action"

    }
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
