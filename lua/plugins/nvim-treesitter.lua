return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",           -- automatically updates parsers
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      ensure_installed = {
        "lua", "vim", "vimdoc", "markdown", "markdown_inline",
        "python", "javascript", "typescript", "html", "css", "json",
        -- Add any languages you use regularly
      },
      highlight = { enable = true },      -- main feature: better syntax highlighting
      indent = { enable = true },         -- better automatic indentation
      incremental_selection = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.config").setup(opts)
    end,
  },
}
