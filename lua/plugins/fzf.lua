return {
  {
   "junegunn/fzf.vim",
   dependencies = {
     {
       "junegunn/fzf",
       build = "./install --all",   -- builds fzf binary automatically
     },
   },
   keys = {
     -- === Most common keybindings (leader + f prefix) ===
     { "<leader>f", ":Files<CR>",          desc = "Find files" },
     { "<leader>A", ":Rg<CR>",             desc = "Live grep (ripgrep)" },
     { "<leader>a", ":Rg <C-r><C-w><CR>",  desc = "grep under CursorColumn (ripgrep)" },
     { "<leader>b", ":Buffers<CR>",        desc = "Open buffers" },
     { "<leader>fh", ":Helptags<CR>",       desc = "Help tags" },
     { "<leader>?", ":History<CR>",        desc = "Old files (history)" },
     { "<leader>fr", ":History<CR>",        desc = "Recent files" },   -- same as above, or customize
     { "<leader>fc", ":Commands<CR>",       desc = "Commands" },
     { "<leader>s", ":BLines<CR>",       desc = "Search history" },

     -- Git specific
     { "<leader>gs", ":GFiles?<CR>",        desc = "Git status (changed files)" },
     { "<leader>gc", ":Commits<CR>",        desc = "Git commits" },
     { "<leader>gb", ":BCommits<CR>",       desc = "Git commits for current buffer" },

     -- Extra useful ones
     { "<leader>fm", ":Marks<CR>",          desc = "Marks" },
     { "<leader>ft", ":Tags<CR>",           desc = "Tags" },
     { "<leader>fw", ":Windows<CR>",        desc = "Windows" },
   },
   init = function()
     -- Global fzf.vim settings (these run before the plugin loads)
     vim.g.fzf_action = {
       ["enter"]  = "edit",
       ["ctrl-t"] = "tab split",
       ["ctrl-x"] = "split",
       ["ctrl-v"] = "vsplit",
       ["ctrl-q"] = "loclist",   -- or "quickfix"
     }

     -- Layout: floating window (modern look)
     vim.g.fzf_layout = {
       window = {
         width = 0.85,
         height = 0.80,
         yoffset = 0.15,
         xoffset = 0.5,
         highlight = "Normal",
         border = "rounded",   -- requires Neovim 0.9+
       },
     }

     -- Preview window (right side)
     vim.g.fzf_preview_window = { "right:50%", "ctrl-/" }

     -- Colors (match your colorscheme)
     vim.g.fzf_colors = {
       fg      = { "fg", "Normal" },
       bg      = { "bg", "Normal" },
       hl      = { "fg", "Comment" },
       ["fg+"] = { "fg", "CursorLine", "CursorColumn", "Normal" },
       ["bg+"] = { "bg", "CursorLine", "CursorColumn" },
       ["hl+"] = { "fg", "Statement" },
       info    = { "fg", "PreProc" },
       border  = { "fg", "Ignore" },
       prompt  = { "fg", "Conditional" },
       pointer = { "fg", "Exception" },
       marker  = { "fg", "Keyword" },
       spinner = { "fg", "Label" },
       header  = { "fg", "Comment" },
     }

     -- Use ripgrep with sensible defaults for :Rg
     vim.g.fzf_rg_command = 'rg --column --line-number --no-heading --color=always --smart-case --hidden --follow --glob "!{.git,node_modules}/*"'
   end,
 },
}
