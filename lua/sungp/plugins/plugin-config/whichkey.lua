return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {},
  keys = {
    {
      "<leader>?", 
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)"
    },
    {
      "<leader>f", 
      function()
        require("which-key").show({ mode = "n", prefix = "<leader>f" })
      end,
      desc = "File Operations"
    },
    {
      "<leader>e", 
      function()
        require("which-key").show({ mode = "n", prefix = "<leader>e" })
      end,
      desc = "Explore Operations"
    },
    {
      "<leader>n", 
      function()
        require("which-key").show({ mode = "n", prefix = "<leader>n" })
      end,
      desc = "Noice Operations"
    },
    {
      "<leader>b", 
      function()
        require("which-key").show({ mode = "n", prefix = "<leader>b" })
      end,
      desc = "Buffer Operations"
    },
    {
      "<leader>m", 
      function()
        require("which-key").show({ mode = "n", prefix = "<leader>m" })
      end,
      desc = "Maximizer Operations"
    },
    {
      "<leader>h", 
      function()
        require("which-key").show({ mode = "n", prefix = "<leader>h" })
      end,
      desc = "Treesitter Operations"
    },
    {
        "<leader>t",
        function()
            require("which-key").show({mode = "n", prefix = "<leader>t"})
        end,
        desc = "Terminal Operations"
    }, 
    {
        "<leader>s",
        function()
            require("which-key").show({mode = "n", prefix = "<leader>s"})
        end,
        desc = "Session Operations"
    }
  }
}
