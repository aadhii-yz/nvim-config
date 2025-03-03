return {
  -- Go LSP and Tools
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          root_dir = require("lspconfig.util").root_pattern("go.work", "go.mod", ".git"),
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
                shadow = true,
              },
              staticcheck = true,
            },
          },
        },
      },
    },
  },

  -- Install Mason packages for Go
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "gopls",          -- LSP server for Go
        "golangci-lint",  -- Linter
        "delve",          -- Debugger
      },
    },
  },

  -- Debugging with DAP
  {
    "mfussenegger/nvim-dap",
    opts = function(_, opts)
      local dap = require("dap")
      dap.adapters.go = {
        type = "server",
        port = "${port}",
        executable = {
          command = "dlv",
          args = { "dap", "-l", "127.0.0.1:${port}" },
        },
      }
      dap.configurations.go = {
        {
          type = "go",
          name = "Debug",
          request = "launch",
          program = "${file}",
        },
        {
          type = "go",
          name = "Debug Package",
          request = "launch",
          program = "${fileDirname}",
        },
      }
      return opts
    end,
  },

  -- Add Go tools
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" },
    config = true,
  },
}
