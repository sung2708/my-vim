return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      -- Set up Mason
      mason.setup()
      mason_lspconfig.setup()

      -- Define common capabilities with nvim-cmp integration
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Function to handle LSP-specific keymaps and behaviors
      local on_attach = function(client, bufnr)
        local opts = { buffer = bufnr, noremap = true, silent = true }

        -- Keymaps for LSP actions
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>pd", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

        -- Highlight references
        if client.server_capabilities.document_highlight then
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end

      -- Function to set up LSP servers
      local function setup_lsp(server_name, custom_config)
        local config = {
          capabilities = capabilities,
          on_attach = on_attach,
        }
        if custom_config then
          config = vim.tbl_deep_extend("force", config, custom_config)
        end
        lspconfig[server_name].setup(config)
      end

      -- Set up handlers for LSP servers
      mason_lspconfig.setup_handlers({
        function(server_name)
          setup_lsp(server_name)
        end,
        -- Custom configuration for clangd
        ["clangd"] = function()
          setup_lsp("clangd", {
            cmd = {
              "clangd",
              "--background-index",
              "--header-insertion=never",
            },
          })
        end,
      })
    end,
  },
}