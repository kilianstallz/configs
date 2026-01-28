return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "go",
      "lua",
    },
    highlight = {
      enalbled = true,
      use_languagetree = true,
    },
    indent = {
      enable = true,
    },
    autotag = {
      enable = true,
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = true,
      filetypes = { "html", "xml" },
    },
  },
}
