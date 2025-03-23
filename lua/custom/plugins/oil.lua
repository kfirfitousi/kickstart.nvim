return {
  {
    'stevearc/oil.nvim',
    config = function()
      require('oil').setup()
      vim.keymap.set('n', '\\', function()
        if vim.bo.filetype == 'oil' then
          vim.cmd 'b#' -- Go back to the last buffer if Oil is open
        else
          vim.cmd 'Oil'
        end
      end, { desc = 'Toggle Oil or return to last buffer' })
    end,
    -- Optional dependencies
    dependencies = { { 'echasnovski/mini.icons', opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
}
