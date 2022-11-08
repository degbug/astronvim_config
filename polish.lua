return function()
  local config_group = vim.api.nvim_create_augroup('MyConfigGroup', {}) -- A global group for all your config autocommands

  vim.api.nvim_create_autocmd({ 'User' }, {
    pattern = "SessionLoadPost",
    group = config_group,
    callback = function()
      -- require('neo-tree').toggle(false, true)
      vim.cmd "Neotree toggle"
      -- vim.api.nvim_buf_attach(1, false, {})
      require("smart-splits").move_cursor_right()
    end,
  })

  -- require('nvim-test.runners.go-test'):setup {
  --   args = { "-count=1" }
  -- }

end
