return {
  {
    "nvim-neotest/neotest-jest",
  },
  {
    "fredrikaverpil/neotest-golang",
  },
  {
    "Issafalcon/neotest-dotnet",
  },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-jest", "neotest-golang", "neotest-dotnet" } },
  },
}
