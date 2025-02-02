return {
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
    opts = {
      rocks = {
        "fzy",
        "pathlib.nvim ~> 1.0"
      },
      hererocks = {
        bin = vim.fn.stdpath("data") .. "/lazy-rocks/hererocks/bin"
      },
    },
  },
}
