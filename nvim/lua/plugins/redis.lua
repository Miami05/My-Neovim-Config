return {
  -- Redis client for Neovim
  {
    "nvim-lua/plenary.nvim",
    dependencies = {
      {
        "tami5/sqlite.lua",
        module = "sqlite",
      },
    },
  },

  -- Redis integration (custom plugin-like functionality)
  {
    "nvim-lua/plenary.nvim",
    config = function()
      -- Create Redis commands
      vim.api.nvim_create_user_command("RedisConnect", function(opts)
        local host = opts.args ~= "" and opts.args or "localhost:6379"
        vim.notify("Redis: Connecting to " .. host, vim.log.levels.INFO)
        -- You would implement actual Redis connection logic here
      end, { nargs = "?", desc = "Connect to Redis server" })

      vim.api.nvim_create_user_command("RedisGet", function(opts)
        if opts.args == "" then
          vim.notify("Redis: Please provide a key", vim.log.levels.ERROR)
          return
        end
        vim.notify("Redis: Getting key '" .. opts.args .. "'", vim.log.levels.INFO)
        -- Implement Redis GET command
      end, { nargs = 1, desc = "Get value from Redis" })

      vim.api.nvim_create_user_command("RedisSet", function(opts)
        local args = vim.split(opts.args, " ", { trimempty = true })
        if #args < 2 then
          vim.notify("Redis: Please provide key and value", vim.log.levels.ERROR)
          return
        end
        vim.notify("Redis: Setting '" .. args[1] .. "' = '" .. args[2] .. "'", vim.log.levels.INFO)
        -- Implement Redis SET command
      end, { nargs = "+", desc = "Set key-value in Redis" })
    end,
    keys = {
      { "<leader>rc", "<cmd>RedisConnect<cr>", desc = "Connect to Redis" },
      { "<leader>rg", "<cmd>RedisGet ", desc = "Redis GET key" },
      { "<leader>rs", "<cmd>RedisSet ", desc = "Redis SET key value" },
    },
  },

  -- Swagger/OpenAPI support
  {
    "vinnymeller/swagger-preview.nvim",
    cmd = { "SwaggerPreview", "SwaggerPreviewStop", "SwaggerPreviewToggle" },
    config = function()
      require("swagger-preview").setup({
        port = 8000,
        host = "localhost",
      })
    end,
    keys = {
      { "<leader>ra", "<cmd>SwaggerPreview<cr>", desc = "Start Swagger Preview" },
      { "<leader>rP", "<cmd>SwaggerPreviewStop<cr>", desc = "Stop Swagger Preview" },
      { "<leader>rt", "<cmd>SwaggerPreviewToggle<cr>", desc = "Toggle Swagger Preview" },
    },
  },
}
