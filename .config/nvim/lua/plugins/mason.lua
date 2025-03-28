return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "eslint-lsp",
        "hadolint",
        "prettierd",
        "shfmt",
        "stylua",
        "selene",
        "shellcheck",
        "delve",
        "sql-formatter",
      },

      registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
    },
  },
}
