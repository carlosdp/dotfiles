return {
  'nvim-tree/nvim-web-devicons',
  {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup()
      
      -- vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })
    end
  }
}
