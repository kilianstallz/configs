return {
  {
    "GustavEikaas/easy-dotnet.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
    config = function()
      require("easy-dotnet").setup()
    end,
  },
  {
    "seblyng/roslyn.nvim",
    ft = "cs",
    opts = {
      -- your configuration comes here; leave empty for default settings
    },
  },
}
