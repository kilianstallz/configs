return {
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "gofumpt",
        "goimports",
        "golines",
        "gomodifytags",
        "impl",
        "golangci-lint",
        "delve",
        "gopls",
        "lua-language-server",
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
