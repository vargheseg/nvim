return {
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
 {'neovim/nvim-lspconfig'},
 {'folke/trouble.nvim'},
  {"tpope/vim-unimpaired"},
  {"tpope/vim-surround"},
  {"tpope/vim-commentary"},
  {"tpope/vim-repeat"},
  {"tpope/vim-fugitive"},
  {"sbdchd/neoformat"},
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        mode = "buffers",           -- or "tabs"
        separator_style = "slant",  -- or "padded_slant", "thick"
        diagnostics = "nvim_lsp",
        offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1 } },
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",  -- loads only when needed
    dependencies = { "nvim-tree/nvim-web-devicons" },  -- for icons (requires a Nerd Font)
    opts = {
      options = {
        theme = "auto",        -- or "gruvbox", "catppuccin", etc.
        globalstatus = true,   -- one statusline for all windows
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
      },
    },
  },
  {
    "ntpeters/vim-better-whitespace",
    config = function()
      vim.g.better_whitespace_enabled = 1
      vim.g.strip_whitespace_confirm = 0
      vim.g.strip_only_modified_lines = 1
      vim.g.strip_whitespace_on_save = 1

      -- Optional: nicer red highlight for trailing whitespace
      vim.cmd([[highlight ExtraWhitespace guibg=#FF5555 ctermbg=9]])
    end,
  },
}
