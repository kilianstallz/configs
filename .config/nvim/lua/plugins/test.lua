return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-jest",
      {
        "fredrikaverpil/neotest-golang",
        version = "*",
        build = function()
          vim.system({ "go", "install", "gotest.tools/gotestsum@latest" }):wait()
        end,
      },
    },
    -- We use opts to configure adapters. LazyVim will merge this with defaults.
    opts = function(_, opts)
      opts.adapters = opts.adapters or {}

      -- 1. Add Go Adapter
      local golang = require("neotest-golang")({
        runner = "gotestsum",
        warn_test_name_dupes = false, -- Optional: Silence the warning if you want
      })
      table.insert(opts.adapters, golang)

      -- 2. Add Jest Adapter
      local jest = require("neotest-jest")({
        jestConfigFile = function(path)
          return require("utils.path").get_project_root(path) .. "jest.config.ts"
        end,
        env = { CI = true },
        cwd = function(path)
          return require("utils.path").get_project_root(path)
        end,
      })
      table.insert(opts.adapters, jest)
    end,
    -- IMPORTANT: We remove the custom 'config' function entirely.
    -- LazyVim's default neotest config (or the plugin's default) handles
    -- calling setup() using the 'opts' we constructed above.
  },
}
