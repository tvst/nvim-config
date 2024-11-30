-- add any tools you want to have installed below
return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "chrome-debug-adapter",
      "debugpy",
      "stylua",
      "shellcheck",
      "shfmt",
      "flake8",
      "ruff",
      "isort",
      "prettier",
    },
  },
}
