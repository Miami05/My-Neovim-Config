return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false, -- Load early for certain plugins to function correctly
  opts = {
    -- Enable desired plugins; set to true or provide a configuration table
    animate = { enabled = true },
    bigfile = { enabled = true },
    bufdelete = { enabled = true },
    dashboard = { enabled = true },
    debug = { enabled = true },
    dim = { enabled = true },
    explorer = { enabled = true },
    git = { enabled = true },
    gitbrowse = { enabled = true },
    health = { enabled = true },
    image = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    layout = { enabled = true },
    lazygit = { enabled = true },
    meta = { enabled = true },
    notifier = {
      enabled = true,
      timeout = 3000, -- Notification display duration in milliseconds
    },
    notify = { enabled = true },
    picker = { enabled = true },
    profiler = { enabled = true },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scope = { enabled = true },
    scratch = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    styles = { enabled = true },
    terminal = { enabled = true },
    toggle = { enabled = true },
    util = { enabled = true },
    win = { enabled = true },
    words = { enabled = true },
    zen = { enabled = true },
  },
  keys = {
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Git Branches",
    },
    {
      "<leader>gl",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>gL",
      function()
        Snacks.picker.git_log_line()
      end,
      desc = "Git Log Line",
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>gS",
      function()
        Snacks.picker.git_stash()
      end,
      desc = "Git Stash",
    },
    {
      "<leader>gd",
      function()
        Snacks.picker.git_diff()
      end,
      desc = "Git Diff (Hunks)",
    },
    {
      "<leader>gf",
      function()
        Snacks.picker.git_log_file()
      end,
      desc = "Git Log File",
    },
  },
}
